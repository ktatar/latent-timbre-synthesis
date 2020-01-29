# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers

import random
import numpy as np

import os, sys, argparse, time
import librosa
import pdb
import configparser

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--dir', type=str, help='path to the run directory')
parser.add_argument('--dataset', type=str, help='path to the dataset directory')
args = parser.parse_args()

#Get configs
run_path = args.dir
config = configparser.ConfigParser(allow_no_value=True)
config_path = os.path.join(run_path, 'config.ini')
config.read(config_path)

#import audio configs 
sample_rate = config['audio'].getint('sample_rate')
hop_length = config['audio'].getint('hop_length')
bins_per_octave = config['audio'].getint('bins_per_octave')
num_octaves = config['audio'].getint('num_octaves')
n_bins = int(num_octaves * bins_per_octave)
n_iter = config['audio'].getint('n_iter')

#dataset
dataset = config['dataset'].get('datapath')
if args.dataset != None:
  dataset = args.dataset
cqt_dataset = config['dataset'].get('cqt_dataset')
my_cqt = os.path.join(dataset, cqt_dataset)
my_audio = os.path.join(dataset, 'audio')

#Training configs
batch_size = config['training'].getint('batch_size')

#etc
example_length = config['extra'].getint('example_length')
normalize_examples = config['extra'].getboolean('normalize_examples')


AUTOTUNE = tf.data.experimental.AUTOTUNE

#We need to define the custom Sampling Layer
class Sampling(layers.Layer):
  """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon


#load the model
my_model_path = os.path.join(os.path.join(run_path, 'model'),'mymodel_last.h5')
with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
  trained_model = tf.keras.models.load_model(my_model_path)

trained_model.summary()

# Generate examples 
print("Generating examples...")
my_examples_folder = os.path.join(run_path, 'audio_examples')
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
    reconstructed = trained_model(x_batch_train)
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

print('bye...')
