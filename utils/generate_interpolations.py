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
if args.dataset != None:
  dataset = args.dataset

cqt_dataset = config['dataset'].get('cqt_dataset')
my_cqt = os.path.join(dataset, cqt_dataset)
my_audio = os.path.join(dataset, 'audio')

if not os.path.exists(dataset):
    raise FileNotFoundError

if not os.path.exists(my_cqt):
    raise FileNotFoundError


#Model configs
try:
    print(config['VAE'])
    config['CVAE'] = config['VAE'] 
    
latent_dim = config['CVAE'].getint('latent_dim')

#Training configs
batch_size = config['training'].getint('batch_size')

#etc
example_length = config['extra'].getint('example_length')
normalize_examples = config['extra'].getboolean('normalize_examples')

interpolations_audio_1 = config['extra'].get('interpolations_audio_1')
audio_1_offset = config['extra'].getint('audio_1_offset')
interpolations_audio_2 = config['extra'].get('interpolations_audio_2')
audio_2_offset = config['extra'].getint('audio_2_offset')
num_random_interpolations = config['extra'].getint('num_random_interpolations')

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

# create Encoder model
encoder = tf.keras.Model(inputs = trained_model.input, outputs = [trained_model.get_layer("z_mean").output, trained_model.get_layer("z_log_var").output], name='encoder')
encoder.summary()

# create Decoder model
decoder = tf.keras.Model(inputs = trained_model.get_layer('decoder').input, outputs = trained_model.get_layer('decoder').output, name='decoder')
decoder.summary()


duration_frames = librosa.time_to_samples(example_length, sr=sample_rate)//hop_length

# Interpolations of selected sections
print('Generating interpolations between fixed-sections')
my_interpolations_folder = os.path.join(run_path, 'audio_examples_interpolations')
my_fixed_interpolations_folder = os.path.join(my_interpolations_folder, 'fixed')
os.makedirs(my_fixed_interpolations_folder,exist_ok = True)

print('loading audio and CQT matrixes')

#Load Audio 1 
audio_1 = interpolations_audio_1
audio_1_path = os.path.join(my_audio, audio_1)
#Saudio_1_offset = 75
audio_1_offset_frames = librosa.time_to_samples(audio_1_offset, sr=sample_rate)//hop_length
my_file_duration = librosa.get_duration(filename=audio_1_path)

s_1, fs_1 = librosa.load(audio_1_path, duration=example_length, offset=audio_1_offset, sr=None)
librosa.output.write_wav(os.path.join(my_fixed_interpolations_folder,'original_1.wav'),
                           s_1, fs_1)

#Load audio 2
audio_2 = interpolations_audio_2
audio_2_path = os.path.join(my_audio, audio_2)
#audio_2_offset = 118
audio_2_offset_frames = librosa.time_to_samples(audio_2_offset, sr=sample_rate)//hop_length
my_file_duration = librosa.get_duration(filename=audio_2_path)

s_2, fs_2 = librosa.load(audio_2_path, duration=example_length, offset=audio_2_offset, sr=None)
librosa.output.write_wav(os.path.join(my_fixed_interpolations_folder,'original_2.wav'),
                           s_2, fs_2)

#Load audio 1 CQTs
cqt_audio_1 = np.load(os.path.join(my_cqt,os.path.splitext(audio_1)[0]+'.npy'))
C_1 = cqt_audio_1[audio_1_offset_frames:(audio_1_offset_frames+duration_frames)]
print('Generating VAE-output+gL_1.wav')
y_inv_audio_1 = librosa.griffinlim_cqt(np.transpose(C_1), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)

#write original magnitude response +phase estimation
librosa.output.write_wav(os.path.join(my_fixed_interpolations_folder,'VAE-output+gL_1.wav'),
                           y_inv_audio_1, sample_rate)

#Load audio 2 CQTs
cqt_audio_2 = np.load(os.path.join(my_cqt,os.path.splitext(audio_2)[0]+'.npy'))
C_2 = cqt_audio_2[audio_2_offset_frames:(audio_2_offset_frames+duration_frames)]
print('Generating VAE-output+gL_2.wav')
y_inv_audio_2 = librosa.griffinlim_cqt(np.transpose(C_2), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)

#write original magnitude response +phase estimation
librosa.output.write_wav(os.path.join(my_fixed_interpolations_folder,'VAE-output+gL_2.wav'),
                           y_inv_audio_2, sample_rate)

#Generate latent vectors for audio_1
audio_1_dataset = tf.data.Dataset.from_tensor_slices(C_1).batch(batch_size).prefetch(AUTOTUNE)
latent_vecs_mean = tf.constant(0., dtype='float32', shape=(1,latent_dim))
latent_vecs_log_var = tf.constant(0., dtype='float32', shape=(1,latent_dim))

for step, x_batch_train in enumerate(audio_1_dataset):
    mean, log_var = encoder(x_batch_train, training=False)
    latent_vecs_mean = tf.concat([latent_vecs_mean, mean], 0)
    latent_vecs_log_var = tf.concat([latent_vecs_log_var, log_var], 0)

audio_1_latent_vecs_mean = latent_vecs_mean[1:]
audio_1_latent_vecs_log_var = latent_vecs_log_var[1:]

#Generate latent vectors for audio_2
audio_2_dataset = tf.data.Dataset.from_tensor_slices(C_2).batch(batch_size).prefetch(AUTOTUNE)
latent_vecs_mean = tf.constant(0., dtype='float32', shape=(1,latent_dim))
latent_vecs_log_var = tf.constant(0., dtype='float32', shape=(1,latent_dim))

for step, x_batch_train in enumerate(audio_2_dataset):
    mean, log_var = encoder(x_batch_train, training=False)
    latent_vecs_mean = tf.concat([latent_vecs_mean, mean], 0)
    latent_vecs_log_var = tf.concat([latent_vecs_log_var, log_var], 0)

audio_2_latent_vecs_mean = latent_vecs_mean[1:]
audio_2_latent_vecs_log_var = latent_vecs_log_var[1:]

#Generate and save interpolations 
print('Generating interpolations')
my_alfas = np.arange(0.1,1,0.1)

for i in range(len(my_alfas)):
    alfa = my_alfas[i]
    print('Working on alfa {:2.1f}'.format(alfa))
    #generate mixed latent vectors
    latent_mix_mean = tf.math.add(
        tf.math.multiply(tf.constant(1-alfa, dtype='float32'), audio_1_latent_vecs_mean), 
        tf.math.multiply(tf.constant(alfa, dtype='float32'), audio_2_latent_vecs_mean))
    latent_mix_log_var = tf.math.add(
        tf.math.multiply(tf.constant(1-alfa, dtype='float32'),audio_1_latent_vecs_log_var), 
        tf.math.multiply(tf.constant(alfa, dtype='float32'), audio_2_latent_vecs_log_var))

    sampled_latent_mix = Sampling()((latent_mix_mean, latent_mix_log_var))                      

    decoder_dataset = tf.data.Dataset.from_tensor_slices(sampled_latent_mix).batch(batch_size).prefetch(AUTOTUNE)

    print('Generating DL model outputs')
    output_C = tf.constant(0., dtype='float32', shape=(1,n_bins))
    with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
        for step, x_batch_train in enumerate(decoder_dataset):
            output_C = decoder(sampled_latent_mix,training=False)
    print('Running phase estimation')           
    y_inv_audio_mix = librosa.griffinlim_cqt(np.transpose(output_C), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
    librosa.output.write_wav(os.path.join(my_fixed_interpolations_folder,'x_interpolations_{:2.1f}.wav'.format(alfa)),
                           s_2, fs_2)

# Interpolations of random sections
print('Generating interpolations between random sections')
for my_idx in range(num_random_interpolations):
    print('Working on random sections number {}'.format(my_idx))
    my_interpolations_folder = os.path.join(run_path, 'audio_examples_interpolations')
    my_interpolation_folder = os.path.join(my_interpolations_folder, 'random-{:2d}'.format(my_idx))
    os.makedirs(my_interpolation_folder,exist_ok = True)
    
    my_records = os.listdir(my_audio)

    print('loading audio and CQT matrixes')

    #Load Audio 1 
    audio_1 = my_records[random.randint(0, len(my_records)-1)]
    audio_1_path = os.path.join(my_audio, audio_1)
    audio_1_duration = librosa.get_duration(filename=audio_1_path)
    audio_1_offset = random.randint(0, int(audio_1_duration)-example_length)
    audio_1_offset_frames = librosa.time_to_samples(audio_1_offset, sr=sample_rate)//hop_length

    s_1, fs_1 = librosa.load(audio_1_path, duration=example_length, offset=audio_1_offset, sr=None)
    librosa.output.write_wav(os.path.join(my_interpolation_folder,'original_1.wav'),
                               s_1, fs_1)

    #Load audio 2
    audio_2 =  my_records[random.randint(0, len(my_records)-1)]
    audio_2_path = os.path.join(my_audio, audio_2)
    audio_2_duration = librosa.get_duration(filename=audio_2_path)
    audio_2_offset = random.randint(0, int(audio_2_duration)-example_length)
    audio_2_offset_frames = librosa.time_to_samples(audio_2_offset, sr=sample_rate)//hop_length
    my_file_duration = librosa.get_duration(filename=audio_2_path)

    s_2, fs_2 = librosa.load(audio_2_path, duration=example_length, offset=audio_2_offset, sr=None)
    librosa.output.write_wav(os.path.join(my_interpolation_folder,'original_2.wav'),
                               s_2, fs_2)

    #Load audio 1 CQTs
    cqt_audio_1 = np.load(os.path.join(my_cqt,os.path.splitext(audio_1)[0]+'.npy'))
    C_1 = cqt_audio_1[audio_1_offset_frames:(audio_1_offset_frames+duration_frames)]
    print('Generating VAE-output+gL_1.wav')
    y_inv_audio_1 = librosa.griffinlim_cqt(np.transpose(C_1), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)

    #write original magnitude response +phase estimation
    librosa.output.write_wav(os.path.join(my_interpolation_folder,'VAE-output+gL_1.wav'),
                               y_inv_audio_1, sample_rate)

    #Load audio 2 CQTs
    cqt_audio_2 = np.load(os.path.join(my_cqt,os.path.splitext(audio_2)[0]+'.npy'))
    C_2 = cqt_audio_2[audio_2_offset_frames:(audio_2_offset_frames+duration_frames)]
    print('Generating VAE-output+gL_2.wav')
    y_inv_audio_2 = librosa.griffinlim_cqt(np.transpose(C_2), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)

    #write original magnitude response +phase estimation
    librosa.output.write_wav(os.path.join(my_interpolation_folder,'VAE-output+gL_2.wav'),
                               y_inv_audio_2, sample_rate)

    #Generate latent vectors for audio_1
    audio_1_dataset = tf.data.Dataset.from_tensor_slices(C_1).batch(batch_size).prefetch(AUTOTUNE)
    latent_vecs_mean = tf.constant(0., dtype='float32', shape=(1,latent_dim))
    latent_vecs_log_var = tf.constant(0., dtype='float32', shape=(1,latent_dim))

    for step, x_batch_train in enumerate(audio_1_dataset):
        mean, log_var = encoder(x_batch_train, training=False)
        latent_vecs_mean = tf.concat([latent_vecs_mean, mean], 0)
        latent_vecs_log_var = tf.concat([latent_vecs_log_var, log_var], 0)

    audio_1_latent_vecs_mean = latent_vecs_mean[1:]
    audio_1_latent_vecs_log_var = latent_vecs_log_var[1:]

    #Generate latent vectors for audio_2
    audio_2_dataset = tf.data.Dataset.from_tensor_slices(C_2).batch(batch_size).prefetch(AUTOTUNE)
    latent_vecs_mean = tf.constant(0., dtype='float32', shape=(1,latent_dim))
    latent_vecs_log_var = tf.constant(0., dtype='float32', shape=(1,latent_dim))

    for step, x_batch_train in enumerate(audio_2_dataset):
        mean, log_var = encoder(x_batch_train, training=False)
        latent_vecs_mean = tf.concat([latent_vecs_mean, mean], 0)
        latent_vecs_log_var = tf.concat([latent_vecs_log_var, log_var], 0)

    audio_2_latent_vecs_mean = latent_vecs_mean[1:]
    audio_2_latent_vecs_log_var = latent_vecs_log_var[1:]

    #Generate and save interpolations 
    my_alfas = np.arange(0.1,1,0.1)
    
    print('Generating interpolations')

    for i in range(len(my_alfas)):
        alfa = my_alfas[i]
        print('Working on alfa {:2.1f}'.format(alfa))
        #generate mixed latent vectors
        latent_mix_mean = tf.math.add(
            tf.math.multiply(tf.constant(1-alfa, dtype='float32'), audio_1_latent_vecs_mean), 
            tf.math.multiply(tf.constant(alfa, dtype='float32'), audio_2_latent_vecs_mean))
        latent_mix_log_var = tf.math.add(
            tf.math.multiply(tf.constant(1-alfa, dtype='float32'),audio_1_latent_vecs_log_var), 
            tf.math.multiply(tf.constant(alfa, dtype='float32'), audio_2_latent_vecs_log_var))

        sampled_latent_mix = Sampling()((latent_mix_mean, latent_mix_log_var))                      

        decoder_dataset = tf.data.Dataset.from_tensor_slices(sampled_latent_mix).batch(batch_size).prefetch(AUTOTUNE)

        print('Generating DL model outputs')
        output_C = tf.constant(0., dtype='float32', shape=(1,n_bins))
        with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
            for step, x_batch_train in enumerate(decoder_dataset):
                output_C = decoder(sampled_latent_mix,training=False)
        print('Running phase estimation')
        y_inv_audio_mix = librosa.griffinlim_cqt(np.transpose(output_C), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
        librosa.output.write_wav(os.path.join(my_interpolation_folder,'x_interpolations_{:2.1f}.wav'.format(alfa)),
                               s_2, fs_2)
        print('Saved x_interpolations_{:2.1f}.wav'.format(alfa))