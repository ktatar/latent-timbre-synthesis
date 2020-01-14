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

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default.ini' , help='path to the config file')
args = parser.parse_args()

#Get configs
config_path = args.config
config = configparser.ConfigParser(allow_no_value=True)
if not os.path.exists(config_path):
    config.Error("config file '%s' not found"%config_path)
    sys.exit()
config.read(config_path)

#import audio configs 
sample_rate = config['audio'].getint('sample_rate')
hop_length = config['audio'].getint('hop_length')
bins_per_octave = config['audio'].getint('bins_per_octave')
num_octaves = config['audio'].getint('num_octaves')
n_bins = int(8 * bins_per_octave)
n_iter=config['audio'].getint('n_iter')

#dataset
dataset = config['dataset'].get('datapath')
cqt_dataset = config['dataset'].get('cqt_dataset')

workspace = config['dataset'].get('workspace')

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
train_buf = batch_size * 16
max_to_keep = config['training'].getint('max_ckpts_to_keep')
ckpt_epochs = config['training'].getint('checkpoint_epochs')
continue_training = config['training'].getboolean('continue_training')
#Model configs
latent_dim = config['VAE'].getint('latent_dim')
n_units = config['VAE'].getint('n_units')
kl_beta = config['VAE'].getfloat('kl_beta')
batch_normalization = config['VAE'].getboolean('batch_norm')
VAE_output_activation = config['VAE'].get('output_activation')
#etc
desc = config['extra'].get('description')
start_time = time.time()
config['extra']['start'] = time.asctime( time.localtime(start_time) )

AUTOTUNE = tf.data.experimental.AUTOTUNE

#Create workspace

if not continue_training:
    run_id = 0
    while True:
        try:
            my_runs = os.path.join(dataset, desc)
            workdir = os.path.join(my_runs, 'run-%03d' % (run_id)) 
            print(workdir)
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

#Define the model

class Sampling(layers.Layer):
  """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon


class Encoder(layers.Layer):
  """Maps to a triplet (z_mean, z_log_var, z)."""

  def __init__(self,
               latent_dim=64,
               intermediate_dim=2000,
               name='encoder', 
               batch_norm = False,
               **kwargs):
    super(Encoder, self).__init__(name=name, **kwargs)
    self.batch_norm = batch_norm
    self.latent_dim = latent_dim
    self.intermediate_dim = intermediate_dim
    self.dense_proj = layers.Dense(intermediate_dim, activation='relu')
    if self.batch_norm:
      self.batch_norm_proj = layers.BatchNormalization()
    self.dense_proj2 = layers.Dense(intermediate_dim, activation='relu')
    if self.batch_norm:
      self.batch_norm_proj2 = layers.BatchNormalization()
    self.dense_mean = layers.Dense(latent_dim)
    self.dense_log_var = layers.Dense(latent_dim)
    self.sampling = Sampling()

  def call(self, inputs):
    x = self.dense_proj(inputs)
    if self.batch_norm:
      x = self.batch_norm_proj(x)
    x = self.dense_proj2(x)
    if self.batch_norm:
      x = self.batch_norm_proj2(x)
    z_mean = self.dense_mean(x)
    z_log_var = self.dense_log_var(x)
    z = self.sampling((z_mean, z_log_var))
    return z_mean, z_log_var, z


class Decoder(layers.Layer):
  """Converts z, the encoded digit vector, back into a readable digit."""

  def __init__(self,
               original_dim=384,
               intermediate_dim=2000,
               batch_norm = False,
               name='decoder',
               output_activation = 'relu',
               **kwargs):
    super(Decoder, self).__init__(name=name, **kwargs)
    self.batch_norm = batch_norm
    self.original_dim = original_dim
    self.intermediate_dim = intermediate_dim
    self.output_activation = output_activation
    self.dense_proj = layers.Dense(intermediate_dim, activation='relu')
    if self.batch_norm:
       self.batch_norm_proj = layers.BatchNormalization()
    self.dense_proj2 = layers.Dense(intermediate_dim, activation='relu')
    if self.batch_norm:
       self.batch_norm_proj2 = layers.BatchNormalization()
    self.dense_output = layers.Dense(original_dim, activation=output_activation)

  def call(self, inputs):
    x = self.dense_proj(inputs)
    if self.batch_norm:
      x = self.batch_norm_proj(x)
    x = self.dense_proj2(x)
    if self.batch_norm:
      x = self.batch_norm_proj2(x)
    return self.dense_output(x)


class VariationalAutoEncoder(tf.keras.Model):
  """Combines the encoder and decoder into an end-to-end model for training."""

  def __init__(self,
               original_dim,
               intermediate_dim=2000,
               latent_dim=64,
               batch_norm = False,
               kl_beta = 2.0,
               output_activation = 'relu',
               name='autoencoder',
               **kwargs):
    super(VariationalAutoEncoder, self).__init__(name=name, **kwargs)
    self.batch_norm = batch_norm
    self.output_activation = output_activation
    self.original_dim = original_dim
    self.latent_dim = latent_dim
    self.intermediate_dim = intermediate_dim
    self.encoder = Encoder(latent_dim=latent_dim,
                           intermediate_dim=intermediate_dim, 
                           batch_norm=batch_norm)
    self.decoder = Decoder(original_dim, 
      intermediate_dim=intermediate_dim, 
      batch_norm=batch_norm, 
      output_activation = output_activation)

  def call(self, inputs, loss_added=True):
    z_mean, z_log_var, z = self.encoder(inputs)
    reconstructed = self.decoder(z)
    if loss_added:
      # Add KL divergence regularization loss.
      kl_loss = - kl_beta * tf.reduce_mean(z_log_var - tf.square(z_mean) - tf.exp(z_log_var) + 1)
      self.add_loss(kl_loss)
    return reconstructed

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

print('Total number of CQT frames: {}'.format(len(training_array)))
path_train_ds = tf.data.Dataset.from_tensor_slices(training_array)
train_dataset = path_train_ds.shuffle(train_buf).batch(batch_size).prefetch(AUTOTUNE)

#initiate the model
print('initiating the model')
original_dim = n_bins
vae = VariationalAutoEncoder(original_dim, 
  intermediate_dim = n_units, 
  latent_dim = latent_dim, 
  kl_beta = kl_beta,
  batch_norm = batch_normalization,
  output_activation = VAE_output_activation)

print('LEARNING RATE {}'.format(learning_rate))
optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate)
mse_loss_fn = tf.keras.losses.MeanSquaredError()

loss_metric = tf.keras.metrics.Mean()

ckpt = tf.train.Checkpoint(step=tf.Variable(0), optimizer=optimizer, net=vae)

manager = tf.train.CheckpointManager(ckpt, os.path.join(workdir,'tf_ckpts'), max_to_keep=max_to_keep)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Iterate over epochs.
for epoch in range(epochs):
    try:
      print('Start of epoch {}'.format(epoch))
      epoch_start = time.time()
      ## Iterate over the batches of the dataset.
      for step, x_batch_train in enumerate(train_dataset):
          with tf.GradientTape() as tape:
              reconstructed = vae(x_batch_train)
              ## Compute reconstruction loss
              loss = mse_loss_fn(x_batch_train, reconstructed)
              loss += sum(vae.losses)  # Add KLD regularization loss

          grads = tape.gradient(loss, vae.trainable_weights)
          optimizer.apply_gradients(zip(grads, vae.trainable_weights))
          loss_metric(loss)
          
          if step % train_buf == 0:
              print('...step {}: mean loss = {}'.format(step, loss_metric.result().numpy()))            
      ckpt.step.assign_add(1)
      time_elapsed = time.time() - epoch_start
      print('EPOCH {}: MEAN LOSS = {}, time elapsed = {:.1f}'.format(epoch, loss_metric.result().numpy(), time_elapsed))  
      if int(ckpt.step) % ckpt_epochs == 0:
          save_path = manager.save()
          print("Saved checkpoint for epoch {}: {}".format(int(ckpt.step), save_path))
    except (KeyboardInterrupt, SystemExit):
        save_path = manager.save()
        print("Exiting... /n Saved checkpoint for epoch {}: {}".format(int(ckpt.step), save_path))

save_path = manager.save()
print("Exiting... /n Saved checkpoint for epoch {}: {}".format(int(ckpt.step), save_path))
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Generate examples 
my_examples_folder = os.path.join(workdir, 'audio_examples')
for f in os.listdir(my_audio): 
  file_path = os.path.join(my_audio,f) 
  my_file_duration = librosa.get_duration(filename=file_path)
  my_offset = random.randint(0, int(my_file_duration)-30)
  s, fs = librosa.load(file_path, duration=30, offset=my_offset, sr=None)
  # Get the CQT magnitude
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

  for step, x_batch_train in enumerate(test_dataset):
    reconstructed = vae(x_batch_train, loss_added=False)
    output = tf.concat([output, reconstructed], 0)

  output_np = np.transpose(output.numpy())
  output_inv_32 = librosa.griffinlim_cqt(output_np, 
    sr=fs, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave)
  output_inv_32_norm = librosa.util.normalize(output_inv_32)
  
  my_audio_out_fold = os.path.join(my_examples_folder, os.path.splitext(f)[0])
  os.makedirs(my_audio_out_fold,exist_ok=True)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original.wav'),
                           s, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'original-icqt+gL.wav'),
                           y_inv_32, fs)
  librosa.output.write_wav(os.path.join(my_audio_out_fold,'VAE-output+gL.wav'),
                           output_inv_32_norm, fs)