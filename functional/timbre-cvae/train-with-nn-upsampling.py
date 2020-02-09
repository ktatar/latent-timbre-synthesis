# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

import random
import numpy as np

import os, sys, argparse, time
from termcolor import colored
os.system('color')

import librosa
import configparser
import random
import json
import matplotlib.pyplot as plt

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default.ini' , help='path to the config file')
args = parser.parse_args()

#Get configs
config_path = args.config
config = configparser.ConfigParser(allow_no_value=True)
try: 
  config.read(config_path)
except FileNotFoundError:
  print('Config File Not Found at {}'.format(config_path))
  sys.exit()

#import audio configs 
sample_rate = config['audio'].getint('sample_rate')
hop_length = config['audio'].getint('hop_length')
bins_per_octave = config['audio'].getint('bins_per_octave')
num_octaves = config['audio'].getint('num_octaves')
n_bins = int(num_octaves * bins_per_octave)
n_iter = config['audio'].getint('n_iter')

#dataset
dataset = config['dataset'].get('datapath')
cqt_dataset = config['dataset'].get('cqt_dataset')
workspace = config['dataset'].get('workspace')
run_number = config['dataset'].getint('run_number')

if not os.path.exists(dataset):
    raise FileNotFoundError
    
my_cqt = os.path.join(dataset, cqt_dataset)

if not os.path.exists(my_cqt):
    raise FileNotFoundError

my_audio = os.path.join(dataset, 'audio')
    
#Training configs
epochs = config['training'].getint('epochs')
learning_rate = config['training'].getfloat('learning_rate')
batch_size = config['training'].getint('batch_size')
train_buf = config['training'].getint('buffer_size')
buffer_size_dataset = config['training'].getboolean('buffer_size_dataset')
max_to_keep = config['training'].getint('max_ckpts_to_keep')
ckpt_epochs = config['training'].getint('checkpoint_epochs')
continue_training = config['training'].getboolean('continue_training')
learning_schedule = config['training'].getboolean('learning_schedule')
save_best_only = config['training'].getboolean('save_best_only')
early_patience_epoch = config['training'].getint('early_patience_epoch')
early_delta = config['training'].getfloat('early_delta')

#Model configs
latent_dim = config['CVAE'].getint('latent_dim')

num_dense_layers = config['CVAE'].getint('num_dense_layers')
dense_units = config['CVAE'].getint('dense_units')
dense_unit_divider = config['CVAE'].getint('dense_unit_divider')

num_conv_layers = config['CVAE'].getint('num_conv_layers')
initial_filters = config['CVAE'].getint('num_inital_filters')
kernel_size = config['CVAE'].getint('kernel_size')
upsampling = config['CVAE'].get('upsampling')

kl_beta = config['CVAE'].getfloat('kl_beta')
batch_norm = config['CVAE'].getboolean('batch_norm')
mid_activations = config['CVAE'].get('mid_activations')
output_activation = config['CVAE'].get('output_activation')

#etc
example_length = config['extra'].getint('example_length')
normalize_examples = config['extra'].getboolean('normalize_examples')
plot_model = config['extra'].getboolean('plot_model')
desc = config['extra'].get('description')
start_time = time.time()
config['extra']['start'] = time.asctime( time.localtime(start_time) )

AUTOTUNE = tf.data.experimental.AUTOTUNE

#Create workspace

if not continue_training:
    run_id = run_number
    while True:
        try:
            my_runs = os.path.join(dataset, desc)
            workdir = os.path.join(my_runs, 'run-%03d' % (run_id)) 
            os.makedirs(workdir)

            break
        except OSError:
            if os.path.isdir(workdir):
                run_id = run_id + 1
                continue
            raise

    config['dataset']['workspace'] = workdir
else:
    workdir = config['dataset'].get('workspace')

print(colored("Workspace: {}".format(workdir), 'magenta'))

#create the dataset
print(colored('creating the dataset...', 'magenta'))
training_array = []
new_loop = True

for f in os.listdir(my_cqt): 
    if f.endswith('.npy'):
        print('adding-> %s' % f)
        new_array = np.load(os.path.join(my_cqt,f))
        if new_loop:
            training_array = new_array
            new_loop = False
        else:
            training_array = np.concatenate((training_array, new_array), axis=0)

total_cqt = len(training_array)
print(colored('Total number of CQT frames: {}'.format(total_cqt)), 'magenta')
config['dataset']['total_frames'] = str(total_cqt)

print(colored("saving initial configs...", 'magenta') )
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

if buffer_size_dataset:
  train_buf = len(training_array)

#Define Sampling Layer
class Sampling(layers.Layer):
  """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon

# Define encoder model.
original_dim = n_bins
original_inputs = tf.keras.Input(shape=(original_dim,), name='encoder_input')
x = layers.Reshape((bins_per_octave//2, num_octaves*2, 1))(original_inputs)
x = layers.Conv2D(initial_filters, kernel_size, padding='same', activation=mid_activations, strides=(2, 2))(x)
if num_conv_layers>0:
  for i in range(num_conv_layers):
    x = layers.Conv2D(initial_filters*pow(2,(i+1)), kernel_size, padding='same', activation=mid_activations, strides=(2, 2))(x)

# need to know the shape of the network here for the decoder
shape_before_flattening = tf.keras.backend.int_shape(x)

#print("Shape before flattening: {}".format(shape_before_flattening))

x = layers.Flatten()(x)
if num_dense_layers > 0:
  for i in range(num_dense_layers):
    x = layers.Dense(dense_units//pow(dense_unit_divider,i), activation=mid_activations)(x)

# Two outputs, latent mean and (log)variance
z_mean = layers.Dense(latent_dim, name='z_mean')(x)
z_log_var = layers.Dense(latent_dim, name='z_log_var')(x)
z = Sampling()((z_mean, z_log_var))
encoder = tf.keras.Model(inputs=original_inputs, outputs=z, name='encoder')
encoder.summary()

# Define decoder model.
latent_inputs = tf.keras.Input(shape=(latent_dim,), name='z_sampling')
# Expand
if num_dense_layers>0:
  x = layers.Dense(dense_units//pow(dense_unit_divider,num_dense_layers-1))(latent_inputs)
  if num_dense_layers>1:
    for i in range(num_dense_layers-1):
      x = layers.Dense((dense_units//pow(dense_unit_divider,num_dense_layers-1))*pow(dense_unit_divider,(i+1)), activation=mid_activations)(x)
  x = layers.Dense(np.prod(shape_before_flattening[1:]), activation=mid_activations)(x)
else:
  x = layers.Dense(np.prod(shape_before_flattening[1:]))(latent_inputs)
# reshape
x = layers.Reshape(shape_before_flattening[1:])(x)
# use Conv2DTranspose to reverse the conv layers from the encoder
if num_conv_layers>0:
  for i in range(num_conv_layers):
    x = layers.UpSampling2D(size=(2, 2), interpolation=upsampling)(x)
    x = layers.Conv2D(initial_filters*pow(2,num_conv_layers)//pow(2,(i+1)), kernel_size, padding='same', activation=mid_activations, strides=(1, 1))(x)
x = layers.UpSampling2D(size=(2, 2), interpolation=upsampling)(x)
x = layers.Conv2D(1, kernel_size, padding='same', strides=(1, 1))(x)

outputs = layers.Flatten()(x)
decoder = tf.keras.Model(inputs=latent_inputs, outputs=outputs, name='decoder')
decoder.summary()

outputs = decoder(z)
# Define VAE model.
vae = tf.keras.Model(inputs=original_inputs, outputs=outputs, name='vae')
vae.summary()

if plot_model:
  tf.keras.utils.plot_model(
    vae,
    to_file=os.path.join(workdir,'model_vae.jpg'),
    show_shapes=True,
    show_layer_names=True,
    rankdir='TB',
    expand_nested=True,
    dpi=300
  )

  tf.keras.utils.plot_model(
      encoder,
      to_file=os.path.join(workdir,'model_encoder.jpg'),
      show_shapes=True,
      show_layer_names=True,
      rankdir='TB',
      expand_nested=True,
      dpi=300
  )

  tf.keras.utils.plot_model(
      decoder,
      to_file=os.path.join(workdir,'model_decoder.jpg'),
      show_shapes=True,
      show_layer_names=True,
      rankdir='TB',
      expand_nested=True,
      dpi=300
  )

# Add KL divergence regularization loss.
kl_loss = - kl_beta * tf.reduce_mean(
    z_log_var - tf.square(z_mean) - tf.exp(z_log_var) + 1)
vae.add_loss(kl_loss)

# Train
model_dir = os.path.join(workdir, "model")
os.makedirs(model_dir, exist_ok=True)

log_dir = os.path.join(workdir, 'logs')
os.makedirs(log_dir, exist_ok=True)

callbacks = [
    tf.keras.callbacks.ModelCheckpoint(
      filepath=os.path.join(model_dir,'mymodel_last.h5'),
      # Path where to save the model
      # The two parameters below mean that we will overwrite
      # the current checkpoint if and only if
      # the `val_loss` score has improved.
      save_best_only=save_best_only,
      monitor='loss',
      verbose=1),
    tf.keras.callbacks.EarlyStopping(
      # Stop training when `val_loss` is no longer improving
      monitor='loss',
      # "no longer improving" being defined as "no better than 1e-2 less"
      min_delta=early_delta,
      # "no longer improving" being further defined as "for at least 2 epochs"
      patience=early_patience_epoch,
      verbose=1),
    tf.keras.callbacks.TensorBoard(
      log_dir=log_dir, 
      histogram_freq=1)
]

if learning_schedule:
  learning_rate = tf.keras.optimizers.schedules.ExponentialDecay(
    learning_rate*100,
    decay_steps=int(epochs*0.8),
    decay_rate=0.96,
    staircase=True)

optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate)

vae.compile(optimizer, 
  loss=tf.keras.losses.MeanSquaredError())

history = vae.fit(training_array, training_array, epochs=epochs, batch_size=batch_size, callbacks=callbacks)

print('\nhistory dict:', history.history)

with open(os.path.join(workdir,'my_history.json'), 'w') as json_file:
  json.dump(history.history, json_file)

print(colored("Finished training...", 'magenta'))
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Generate examples 
print(colored("Generating examples...", 'magenta'))
my_examples_folder = os.path.join(workdir, 'audio_examples')
for f in os.listdir(my_audio):
  print("Examples for {}".format(os.path.splitext(f)[0])) 
  file_path = os.path.join(my_audio,f) 
  my_file_duration = librosa.get_duration(filename=file_path)
  my_offset = random.randint(0, int(my_file_duration)-example_length)
  s, fs = librosa.load(file_path, duration=example_length, offset=my_offset, sr=None)
  # Get the CQT magnitude
  print("Calculating CQT")
  C_complex = librosa.cqt(y=s, sr=fs, hop_length= hop_length, bins_per_octave=bins_per_octave, n_bins=n_bins)
  C = np.abs(C_complex)
  # Invert using Griffin-Lim
  #y_inv = librosa.griffinlim_cqt(C, sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave)
  # And invert without estimating phase
  #y_icqt = librosa.icqt(C, sr=fs, hop_length=hop_length, bins_per_octave=bins_per_octave)
  #y_icqt_full = librosa.icqt(C_complex, hop_length=hop_length, sr=fs, bins_per_octave=bins_per_octave)
  C_32 = C.astype('float32')
  y_inv_32 = librosa.griffinlim_cqt(C, sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
  ## Generate the same CQT using the model
  my_array = np.transpose(C_32)
  test_dataset = tf.data.Dataset.from_tensor_slices(my_array).batch(batch_size).prefetch(AUTOTUNE)
  output = tf.constant(0., dtype='float32', shape=(1,n_bins))

  print(colored("Working on regenerating cqt magnitudes with the DL model", 'magenta') )
  for step, x_batch_train in enumerate(test_dataset):
    reconstructed = vae(x_batch_train)
    output = tf.concat([output, reconstructed], 0)

  output_np = np.transpose(output.numpy())
  output_inv_32 = librosa.griffinlim_cqt(output_np[1:], 
    sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)

  if normalize_examples:
    output_inv_32 = librosa.util.normalize(output_inv_32)  
  print(colored("Saving audio files...", 'magenta'))
  my_audio_out_fold = os.path.join(my_examples_folder, os.path.splitext(f)[0])
  os.makedirs(my_audio_out_fold,exist_ok=True)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original.wav'),
                           s, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original-icqt+gL.wav'),
                           y_inv_32, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'VAE-output+gL.wav'),
                           output_inv_32, fs)

#Generate a plot for loss 
print(colored("Generating loss plot...", 'magenta'))
history_dict = history.history
fig = plt.figure()
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.ylim(0.,0.01)
plt.plot(history_dict['loss'])
fig.savefig(os.path.join(workdir,'my_history_plot.pdf'), dpi=300)

print(colored('bye...', 'magenta'))