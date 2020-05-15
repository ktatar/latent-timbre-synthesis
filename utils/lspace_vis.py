# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
from sklearn.preprocessing import MinMaxScaler
from sklearn.manifold import TSNE
import random
import numpy as np
import matplotlib.pyplot as plt
import os, sys, argparse, time
from pathlib import Path
import librosa
import pdb
import configparser
import glob
import json

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./lspace_vis.ini' , help='path to the config file')
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


#Model configs
try:
    print(config['VAE'])
    config['CVAE'] = config['VAE'] 
except:
    pass
latent_dim = config['CVAE'].getint('latent_dim')

#Training configs
batch_size = config['training'].getint('batch_size')

#etc
example_length = config['extra'].getint('example_length')
normalize_examples = config['extra'].getboolean('normalize_examples')
alpha_min = config['extra'].getfloat('alpha_min')
alpha_max = config['extra'].getfloat('alpha_max')
alpha_step = config['extra'].getfloat('alpha_step')

interpolations_audio_1 = config['extra'].get('interpolations_audio_1')
audio_1_offset = config['extra'].getint('audio_1_offset')
interpolations_audio_2 = config['extra'].get('interpolations_audio_2')
audio_2_offset = config['extra'].getint('audio_2_offset')

AUTOTUNE = tf.data.experimental.AUTOTUNE

#We need to define the custom Sampling Layer
class Sampling(layers.Layer):
  #Uses (z_mean, z_log_var) to sample z, the vector encoding a digit.

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon

#load the model
my_model_path = workspace.joinpath('model').joinpath('mymodel_last.h5')

with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
  trained_model = tf.keras.models.load_model(my_model_path)

trained_model.summary()

# create Encoder model
encoder = tf.keras.Model(inputs = trained_model.input, outputs = [trained_model.get_layer("z_mean").output, trained_model.get_layer("z_log_var").output], name='encoder')
encoder.summary()

# create Decoder model
decoder = tf.keras.Model(inputs = trained_model.get_layer('decoder').input, outputs = trained_model.get_layer('decoder').output, name='decoder')
decoder.summary()

#create the dataset
print('creating the dataset...')
training_array = []
new_loop = True
remaining = len(my_cqt)

#Generate latent vectors for all cqt files
remaining = len(os.listdir(my_cqt))
my_files = os.listdir(my_cqt)
my_files = my_files[:3]
new_loop = True
audio_all_latent_vecs_mean = []
audio_all_latent_vecs_log_var = []

for f in os.listdir(my_cqt):  
    if f.endswith('.npy'):
        print('{:4d} remaining, adding<- {}'.format(remaining, f))
        file_path = my_cqt.joinpath(f)
        new_array = np.load(file_path)
              
        audio_all_dataset = tf.data.Dataset.from_tensor_slices(new_array).batch(batch_size).prefetch(AUTOTUNE) 
        latent_vecs_mean = tf.constant(0., dtype='float32', shape=(1,latent_dim))
        latent_vecs_log_var = tf.constant(0., dtype='float32', shape=(1,latent_dim))

        for step, x_batch_train in enumerate(audio_all_dataset):
            mean, log_var = encoder(x_batch_train, training=False)
            latent_vecs_mean = tf.concat([latent_vecs_mean, mean], 0)
            latent_vecs_log_var = tf.concat([latent_vecs_log_var, log_var], 0)
        if new_loop:
            num_frames_per_file = [len(new_array)]
            audio_all_latent_vecs_mean = latent_vecs_mean[1:]
            audio_all_latent_vecs_log_var = latent_vecs_log_var[1:]
            new_loop = False
        else:
            num_frames_per_file = np.concatenate((num_frames_per_file, [len(new_array)]), axis=0)
            audio_all_latent_vecs_mean = np.concatenate((audio_all_latent_vecs_mean, latent_vecs_mean[1:]), axis=0)
            audio_all_latent_vecs_log_var = np.concatenate((audio_all_latent_vecs_log_var, latent_vecs_log_var[1:]), axis=0)
        remaining -= 1
print("audio_all_latent_vecs_mean: ", audio_all_latent_vecs_mean.shape)

tsne = TSNE(n_components=2, n_iter=5000, verbose=1)
Z_tsne = tsne.fit_transform(audio_all_latent_vecs_mean)
np.save(workspace.joinpath('Z_tsne-scatter.npy'),Z_tsne)\
np.save(workspace.joinpath('num_frames_per_file.npy'), num_frames_per_file)
Z_tsne_x = Z_tsne[:,0]
Z_tsne_y = Z_tsne[:,1]

audio_all_latent_vecs_mean = []
audio_all_latent_vecs_log_var = []

# scatter plot latent vectors of all sound files
plt.figure()
fig, ax = plt.subplots()

for i in range(len(num_frames_per_file)):
    start = np.sum(num_frames_per_file[:i])
    ax.scatter(Z_tsne_x[start: start+num_frames_per_file[i] ], Z_tsne_y[start: start+num_frames_per_file[i]], s=0.01)

ax.set_xlabel('$t-SNE.1$')
ax.set_ylabel('$t-SNE.2$')
fig.savefig('full_latent_space_scatter.png', dpi=600)