# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

import random
import numpy as np

import os, sys, argparse, time
from pathlib import Path

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
dataset = Path(config['dataset'].get('datapath'))
if not dataset.exists():
    raise FileNotFoundError(dataset.resolve())

cqt_dataset = config['dataset'].get('cqt_dataset')

if config['dataset'].get('workspace') != None:
  workspace = Path(config['dataset'].get('workspace'))

run_number = config['dataset'].getint('run_number')



my_cqt = dataset / cqt_dataset

if not my_cqt.exists():
    raise FileNotFoundError(my_cqt.resolve())

my_audio = dataset / 'audio'
    
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
adam_beta_1 = config['training'].getfloat('adam_beta_1')
adam_beta_2 = config['training'].getfloat('adam_beta_2')

#Model configs
latent_dim = config['VAE'].getint('latent_dim')
n_units = config['VAE'].getint('n_units')
kl_beta = config['VAE'].getfloat('kl_beta')
batch_normalization = config['VAE'].getboolean('batch_norm')
VAE_output_activation = config['VAE'].get('output_activation')
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
            my_runs = dataset / desc
            run_name = 'run-{:03d}'.format(run_id)
            workdir = my_runs / run_name 
            os.makedirs(workdir)

            break
        except OSError:
            if workdir.is_dir():
                run_id = run_id + 1
                continue
            raise

    config['dataset']['workspace'] = str(workdir.resolve())
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
        file_path = my_cqt / f
        new_array = np.load(file_path)
        if new_loop:
            training_array = new_array
            new_loop = False
        else:
            training_array = np.concatenate((training_array, new_array), axis=0)

total_cqt = len(training_array)
print('Total number of CQT frames: {}'.format(total_cqt))
config['dataset']['total_frames'] = str(total_cqt)

print("saving initial configs...")
config_path = workdir / 'config.ini'
with open(config_path, 'w') as configfile:
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

# Train
model_dir = workdir / "model"
os.makedirs(model_dir,exist_ok=True)

log_dir = workdir / 'logs'
os.makedirs(log_dir, exist_ok=True)

if not continue_training:
  # Define encoder model.
  original_dim = n_bins
  original_inputs = tf.keras.Input(shape=(original_dim,), name='encoder_input')
  x = layers.Dense(n_units, activation='relu')(original_inputs)
  z_mean = layers.Dense(latent_dim, name='z_mean')(x)
  z_log_var = layers.Dense(latent_dim, name='z_log_var')(x)
  z = Sampling()((z_mean, z_log_var))
  encoder = tf.keras.Model(inputs=original_inputs, outputs=z, name='encoder')
  encoder.summary()

  # Define decoder model.
  latent_inputs = tf.keras.Input(shape=(latent_dim,), name='z_sampling')
  x = layers.Dense(n_units, activation='relu')(latent_inputs)
  outputs = layers.Dense(original_dim, activation=VAE_output_activation)(x)
  decoder = tf.keras.Model(inputs=latent_inputs, outputs=outputs, name='decoder')
  decoder.summary()

  outputs = decoder(z)
  # Define VAE model.
  vae = tf.keras.Model(inputs=original_inputs, outputs=outputs, name='vae')
  vae.summary()


  if plot_model:
    tf.keras.utils.plot_model(
      vae,
      to_file= workdir.joinpath('model_vae.jpg'),
      show_shapes=True,
      show_layer_names=True,
      rankdir='TB',
      expand_nested=True,
      dpi=300
    )

    tf.keras.utils.plot_model(
        encoder,
        to_file= workdir.joinpath('model_encoder.jpg'),
        show_shapes=True,
        show_layer_names=True,
        rankdir='TB',
        expand_nested=True,
        dpi=300
    )

    tf.keras.utils.plot_model(
        decoder,
        to_file=workdir.joinpath('model_decoder.jpg'),
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

  if learning_schedule:
    learning_rate = tf.keras.optimizers.schedules.ExponentialDecay(
      learning_rate*100,
      decay_steps=int(epochs*0.8),
      decay_rate=0.96,
      staircase=True)


  optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate, beta_1=adam_beta_1, beta_2=adam_beta_2)

  vae.compile(optimizer, 
    loss=tf.keras.losses.MeanSquaredError())

else: 
  #load the model
  my_model_path = workdir.joinpath('model','mymodel_last.h5')

  with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
    vae = tf.keras.models.load_model(my_model_path)
  vae.summary()

  # create Encoder model
  encoder = tf.keras.Model(inputs = vae.input, outputs = [vae.get_layer("z_mean").output, vae.get_layer("z_log_var").output], name='encoder')
  encoder.summary()

  # create Decoder model
  decoder = tf.keras.Model(inputs = vae.get_layer('decoder').input, outputs = vae.get_layer('decoder').output, name='decoder')
  decoder.summary()

modelpath = model_dir.joinpath('mymodel_last.h5')

callbacks = [
    tf.keras.callbacks.ModelCheckpoint(
      filepath= str(modelpath),
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
      log_dir=str(log_dir), 
      histogram_freq=1)
]

history = vae.fit(training_array, training_array, epochs=epochs, batch_size=batch_size, callbacks=callbacks)

print('\nhistory dict:', history.history)

with open(workdir.joinpath('my_history.json'), 'w') as json_file:
  json.dump(history.history, json_file)

print("Finished training...")
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
config['extra']['total_epochs'] = str(len(history.history['loss']))
with open(workdir.joinpath('config.ini'), 'w') as configfile:
  config.write(configfile)

# Generate examples 
print("Generating examples...")
my_examples_folder = workdir.joinpath('audio_examples')
for f in os.listdir(my_audio):
  print("Examples for {}".format(os.path.splitext(f)[0])) 
  file_path = my_audio.joinpath(f) 
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
  #y_icqt_full = librosa.icqt(C_complex, hop_length=hop_length, sr=fs, bins_per_octave=bins_per_octave, , dtype=np.float32)

  C_32 = C.astype('float32')
  y_inv_32 = librosa.griffinlim_cqt(C, sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
  
  ## Generate the same CQT using the model
  my_array = np.transpose(C_32)
  test_dataset = tf.data.Dataset.from_tensor_slices(my_array).batch(batch_size).prefetch(AUTOTUNE)
  output = tf.constant(0., dtype='float32', shape=(1,n_bins))
  print("Working on regenerating cqt magnitudes with the DL model")
  for step, x_batch_train in enumerate(test_dataset):
    reconstructed = vae(x_batch_train)
    output = tf.concat([output, reconstructed], 0)

  output_np = np.transpose(output.numpy())
  output_inv_32 = librosa.griffinlim_cqt(output_np[1:], 
    sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
  if normalize_examples:
    output_inv_32 = librosa.util.normalize(output_inv_32)
  print("Saving audio files...")
  my_audio_out_fold = my_examples_folder.joinpath(os.path.splitext(f)[0])
  os.makedirs(my_audio_out_fold,exist_ok=True)
  librosa.output.write_wav(my_audio_out_fold.joinpath('original.wav'),
                           s, sample_rate)
  librosa.output.write_wav(my_audio_out_fold.joinpath('original-icqt+gL.wav'),
                           y_inv_32, sample_rate)
  librosa.output.write_wav(my_audio_out_fold.joinpath('VAE-output+gL.wav'),
                           output_inv_32, sample_rate)

#Generate a plot for loss 
print("Generating loss plot...")
history_dict = history.history
fig = plt.figure()
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.ylim(0.,0.01)
plt.plot(history_dict['loss'])
fig.savefig(workdir.joinpath('my_history_plot.pdf'), dpi=300)

print('bye...')