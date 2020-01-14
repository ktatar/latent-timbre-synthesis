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
latent_dim = config['CVAE'].getint('latent_dim')
#n_units = config['VAE'].getint('n_units')
#kl_beta = config['VAE'].getfloat('kl_beta')
#batch_normalization = config['VAE'].getboolean('batch_norm')
#VAE_output_activation = config['VAE'].get('output_activation')

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

class CVAE(tf.keras.Model):
  def __init__(self, latent_dim, original_dim):
    super(CVAE, self).__init__()
    self.original_dim = original_dim
    self.cqt_bins = int(original_dim/8)
    self.latent_dim = latent_dim
    self.inference_net = tf.keras.Sequential(
      [
          tf.keras.layers.InputLayer(input_shape=(self.original_dim,)),
          tf.keras.layers.Reshape(target_shape=(self.cqt_bins, 8, 1)),
          tf.keras.layers.Conv2D(
              filters=32, kernel_size=3, strides=(2, 2), activation='relu'),
          tf.keras.layers.Conv2D(
              filters=64, kernel_size=3, strides=(2, 2), activation='relu'),
          tf.keras.layers.Flatten(),
          # No activation
          tf.keras.layers.Dense(self.latent_dim + self.latent_dim),
      ]
    )

    self.generative_net = tf.keras.Sequential(
         [
          tf.keras.layers.InputLayer(input_shape=(self.latent_dim,)),
          tf.keras.layers.Dense(units=int(self.cqt_bins/4)*int(8/4)*32, activation=tf.nn.relu),
          tf.keras.layers.Reshape(target_shape=(int(self.cqt_bins/4), int(8/4), 32)),
          tf.keras.layers.Conv2DTranspose(
              filters=64,
              kernel_size=3,
              strides=(2, 2),
              padding="SAME",
              activation='relu'),
          tf.keras.layers.Conv2DTranspose(
              filters=32,
              kernel_size=3,
              strides=(2, 2),
              padding="SAME",
              activation='relu'),
          # No activation
          tf.keras.layers.Conv2DTranspose(
              filters=1, kernel_size=3, strides=(1, 1), padding="SAME"),
          tf.keras.layers.Reshape(target_shape=(self.original_dim,)),
        ]
    )

  @tf.function
  def sample(self, eps=None):
    if eps is None:
      eps = tf.random.normal(shape=(100, self.latent_dim))
    return self.decode(eps, apply_sigmoid=True)

  def encode(self, x):
    mean, logvar = tf.split(self.inference_net(x), num_or_size_splits=2, axis=1)
    return mean, logvar

  def reparameterize(self, mean, logvar):
    eps = tf.random.normal(shape=mean.shape)
    return eps * tf.exp(logvar * .5) + mean

  def decode(self, z, apply_sigmoid=False):
    logits = self.generative_net(z)
    if apply_sigmoid:
      probs = tf.sigmoid(logits)
      return probs

    return logits

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
cvae = CVAE(original_dim=original_dim, latent_dim = latent_dim)

optimizer = tf.keras.optimizers.Adam(learning_rate=learning_rate)

def log_normal_pdf(sample, mean, logvar, raxis=1):
  log2pi = tf.math.log(2. * np.pi)
  return tf.reduce_sum(
      -.5 * ((sample - mean) ** 2. * tf.exp(-logvar) + logvar + log2pi),
      axis=raxis)

@tf.function
def compute_loss(model, x):
  mean, logvar = model.encode(x)
  z = model.reparameterize(mean, logvar)
  x_logit = model.decode(z)

  cross_ent = tf.nn.sigmoid_cross_entropy_with_logits(logits=x_logit, labels=x+0.0)
  logpx_z = -tf.reduce_sum(cross_ent, axis=[1])
  logpz = log_normal_pdf(z, 0., 0.)
  logqz_x = log_normal_pdf(z, mean, logvar)
  return -tf.reduce_mean(logpx_z + logpz - logqz_x)

@tf.function
def compute_apply_gradients(model, x, optimizer):
  with tf.GradientTape() as tape:
    loss = compute_loss(model, x)
  gradients = tape.gradient(loss, model.trainable_variables)
  optimizer.apply_gradients(zip(gradients, model.trainable_variables))

ckpt = tf.train.Checkpoint(step=tf.Variable(0), optimizer=optimizer, net=cvae)

manager = tf.train.CheckpointManager(ckpt, os.path.join(workdir,'tf_ckpts'), max_to_keep=max_to_keep)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Iterate over epochs.
for epoch in range(epochs):
    try:
      print('Start of epoch {}'.format(epoch))
      epoch_start = time.time()
      for train_x in train_dataset:
        compute_apply_gradients(cvae, train_x, optimizer)

      loss_metrics = tf.keras.metrics.Mean()
      for train_x in train_dataset:
        loss_metrics(compute_loss(cvae, train_x))
        
      elbo = -loss_metrics.result()
      ckpt.step.assign_add(1)
      time_elapsed = time.time() - epoch_start
      print('EPOCH {}: MEAN LOSS = {}, time elapsed = {:.1f}'.format(epoch, elbo, time_elapsed))
                   
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
    mean, logvar = cvae.encode(x_batch_train)
    z = cvae.reparameterize(mean, logvar)
    reconstructed = cvae.decode(z)
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