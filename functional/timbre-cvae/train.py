# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

import random
import numpy as np

import os, sys, argparse, time

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
n_bins = int(8 * bins_per_octave)
n_iter = config['audio'].getint('n_iter')

#dataset
dataset = config['dataset'].get('datapath')
cqt_dataset = config['dataset'].get('cqt_dataset')
workspace = config['dataset'].get('workspace')
run_number = config['dataset'].getint('run_number')

if not os.path.exists(dataset):
    parser.error("dataset folder '%s' not found"%dataset)
    sys.exit() 

my_cqt = os.path.join(dataset, cqt_dataset)

if not os.path.exists(my_cqt):
    parser.error("npy folder '%s' not found. Run create_dataset.py first. "%my_cqt)
    sys.exit() 

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
n_units = config['CVAE'].getint('n_units')
kernel_size = config['CVAE'].getint('kernel_size')
kl_beta = config['CVAE'].getfloat('kl_beta')
batch_norm = config['CVAE'].getboolean('batch_norm')
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

print("Workspace: {}".format(workdir))

#create the dataset
print('creating the dataset...')
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
print('Total number of CQT frames: {}'.format(total_cqt))
config['dataset']['total_frames'] = str(total_cqt)

print("saving initial configs...")
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
x = layers.Conv2D(32, kernel_size, padding='same', activation='relu')(x)
x = layers.Conv2D(64, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2D(128, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
# need to know the shape of the network here for the decoder
shape_before_flattening = tf.keras.backend.int_shape(x)
x = layers.Flatten()(x)
x = layers.Dense(n_units, activation='relu')(x)
z_mean = layers.Dense(latent_dim, name='z_mean')(x)
z_log_var = layers.Dense(latent_dim, name='z_log_var')(x)
z = Sampling()((z_mean, z_log_var))
encoder = tf.keras.Model(inputs=original_inputs, outputs=z, name='encoder')
encoder.summary()

# Define decoder model.
latent_inputs = tf.keras.Input(shape=(latent_dim,), name='z_sampling')
x = layers.Dense(n_units, activation='relu')(latent_inputs)
x = layers.Dense(np.prod(shape_before_flattening[1:]), activation='relu')(x)
# reshape
x = layers.Reshape(shape_before_flattening[1:])(x)
# use Conv2DTranspose to reverse the conv layers from the encoder
x = layers.Conv2DTranspose(64, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2DTranspose(32, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)

x = layers.Conv2DTranspose(1, kernel_size, padding='same', activation=output_activation)(x)
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
        verbose=1)
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

print("Finished training...")
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Generate examples 
print("Generating examples...")
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
  y_inv = librosa.griffinlim_cqt(C, sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave)
  # And invert without estimating phase
  y_icqt = librosa.icqt(C, sr=fs, hop_length=hop_length, bins_per_octave=bins_per_octave)
  y_icqt_full = librosa.icqt(C_complex, hop_length=hop_length, sr=fs, bins_per_octave=bins_per_octave)

  C_32 = C.astype('float32')
  y_inv_32 = librosa.griffinlim_cqt(C, sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave)
  
  ## Generate the same CQT using the model
  my_array = np.transpose(C_32)
  test_dataset = tf.data.Dataset.from_tensor_slices(my_array).batch(batch_size).prefetch(AUTOTUNE)
  output = tf.constant(0., dtype='float32', shape=(1,n_bins))
  print("Working on regenerating cqt magnitudes with the DL model")
  for step, x_batch_train in enumerate(test_dataset):
    reconstructed = vae(x_batch_train)
    output = tf.concat([output, reconstructed], 0)

  output_np = np.transpose(output.numpy())
  output_inv_32 = librosa.griffinlim_cqt(output_np, 
    sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave)
  if normalize_examples:
    output_inv_32 = librosa.util.normalize(output_inv_32)  
  print("Saving audio files...")
  my_audio_out_fold = os.path.join(my_examples_folder, os.path.splitext(f)[0])
  os.makedirs(my_audio_out_fold,exist_ok=True)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original.wav'),
                           s, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original-icqt+gL.wav'),
                           y_inv_32, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'VAE-output+gL.wav'),
                           output_inv_32, fs)

#Generate a plot for loss 
print("Generating loss plot...")
history_dict = history.history
fig = plt.figure()
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.plot(history_dict['loss'])
fig.savefig(os.path.join(workdir,'my_history_plot.jpg'), dpi=300)

print('bye...')