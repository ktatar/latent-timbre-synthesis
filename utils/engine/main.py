# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

import random
import numpy as np
import ctypes

import os, sys, argparse, time, random
from pathlib import Path
import librosa
import pdb
import configparser
from pythonosc import dispatcher
from pythonosc import osc_server
from typing import List, Any
from pythonosc.udp_client import SimpleUDPClient

import warnings 
def custom_formatwarning(msg, *args, **kwargs):
    # ignore everything except the message
    return str(msg) + '\n'

warnings.formatwarning = custom_formatwarning

#tensorflow autotune
AUTOTUNE = tf.data.experimental.AUTOTUNE

#Global Variables
#verbose for the extra prints
verbose = True
normalize = False
config = configparser.ConfigParser(allow_no_value=True)
load_datasetpath_with_model = False
dataset = ''
run_path = ''
my_audio = ''
my_cqt = ''
n_iter = 1
sound = {
  'interpolate_two':{
    'first':{
      'name': '',
      'audio_path': '',
      'duration': 0,
      'cqt_path':'',
      'CQT': np.empty([0])
    },
    'second':{
      'name': '',
      'audio_path': '',
      'duration': 0,
      'cqt_path':'',
      'CQT': np.empty([0])
    } 
  }
}

trained_model = tf.keras.Model()
encoder = tf.keras.Model()
decoder = tf.keras.Model()

#We need to define the custom Sampling Layer
class Sampling(layers.Layer):
  """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon

def verbose(new_verbose):
  global verbose
  verbose = new_verbose

def set_load_datasetpath_with_model(my_state=False):
  global load_datasetpath_with_model

  #if you want to set the dataset path directly from the config file, 
  load_datasetpath_with_model = my_state

def warning_plus_osc(my_warning):
  warnings.warn(my_warning)
  client.send_message("/report", my_warning)

def print_plus_osc(my_report):
  print(my_report)
  client.send_message("/report", my_report)

def initiate_dataset(address: str, *osc_arguments: List[Any]) -> None:
  global dataset

  if os.path.exists(Path(osc_arguments[0])): 
    dataset = Path(osc_arguments[0])
    my_report = 'Dataset is set to: \n {}'.format(dataset.resolve())
    print(my_report)
    client.send_message("/dataset", str(dataset.resolve()) )   # Send float message
    client.send_message("/report", my_report)
  else:
    my_warning = 'Could not set the dataset. The path does not exist. Received the following OSC message: \n {}'.format(osc_arguments[:])
    warning_plus_osc(my_warning)

def load_model(address: str, *osc_arguments: List[Any]) -> None:
  global dataset, run_path, my_cqt, my_audio, trained_model, encoder, decoder, config
  run_path = Path(osc_arguments[0])

  #reports
  print_plus_osc('Current dataset path is {}'.format( str(dataset.resolve())))
  print_plus_osc('Received a request to load model from path {}'.format( str(dataset.resolve())))
  
  if not os.path.exists(run_path):
    my_warning = 'Run path does not exist: \n {} \n Could not load the DL model'/format(str(run_path.resolve()))
    warning_plus_osc(my_warning)
    return

  config_path = run_path / 'config.ini'
  config.read(config_path)

  cqt_dataset = config['dataset'].get('cqt_dataset')
  my_cqt = Path(dataset) / cqt_dataset
  print_plus_osc('CQT dataset set to \n {}'.format(my_cqt))
  my_audio = Path(dataset) / 'audio'
  print_plus_osc('Audio path set to \n {}'.format(my_audio))

  #dataset
  if load_datasetpath_with_model:
    dataset = config['dataset'].get('datapath')
    print_plus_osc('Reverting back to the training dataset path \n {}'.format(str(dataset.resolve())))

  #Training configs
  batch_size = config['training'].getint('batch_size')
  client.send_message("/model/batch_size", batch_size) 
  #load the model
  my_model_path = run_path / 'model' / 'mymodel_last.h5'

  with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
    trained_model = tf.keras.models.load_model(my_model_path)

  if verbose:
    trained_model.summary()

  # create Encoder model
  encoder = tf.keras.Model(inputs = trained_model.input, outputs = [trained_model.get_layer("z_mean").output, trained_model.get_layer("z_log_var").output], name='encoder')
  
  if verbose:
    encoder.summary()

  # create Decoder model
  decoder = tf.keras.Model(inputs = trained_model.get_layer('decoder').input, outputs = trained_model.get_layer('decoder').output, name='decoder')
  
  if verbose: 
    decoder.summary()

  print_plus_osc('Model loaded successfully from \n {}'.format(run_path))

def set_i2_first_sound(address: str, *osc_arguments: List[Any]) -> None:
  global sound
  
  audio_path = my_audio / (osc_arguments[0]+'.wav')
  cqt_path = my_cqt / (osc_arguments[0]+'.npy')

  if os.path.exists(audio_path) and os.path.exists(cqt_path): 
    sound['interpolate_two']['first']['name'] = osc_arguments[0]
    sound['interpolate_two']['first']['audio_path'] = str(audio_path.resolve())
    sound['interpolate_two']['first']['cqt_path'] = str(cqt_path.resolve())
    my_report = 'First sound is set to: \n {} \n at the path \n {}'.format( sound['interpolate_two']['first']['name'], sound['interpolate_two']['first']['audio_path'], sound['interpolate_two']['first']['cqt_path'])
    
    print_plus_osc(my_report)
    client.send_message("/sound/interpolate_two/first/path",  sound['interpolate_two']['first']['audio_path'])
    client.send_message("/sound/interpolate_two/first/name",  sound['interpolate_two']['first']['name'])

    #Load Audio 1 
    sound['interpolate_two']['first']['duration'] = librosa.get_duration(filename=audio_path)
    sound['interpolate_two']['first']['CQT'] = np.load(os.path.join(my_cqt, sound['interpolate_two']['first']['name']+'.npy'))

  else:
    my_warning = 'Could not set the first sound for interpolate_two. Either audio or CQT path do not exist. Received the following OSC message: \n {} \n generated the following audio path \n {} \n generated following CQT path \n {}'.format(osc_arguments[0], audio_path, cqt_path)
    warning_plus_osc(my_warning)

def set_i2_second_sound(address: str, *osc_arguments: List[Any]) -> None:
  global sound
  
  audio_path = my_audio / (osc_arguments[0]+'.wav')
  cqt_path = my_cqt / (osc_arguments[0]+'.npy')
  
  if os.path.exists(audio_path) and os.path.exists(cqt_path): 
    sound['interpolate_two']['second']['name'] = osc_arguments[0]
    sound['interpolate_two']['second']['audio_path'] = str(audio_path.resolve())
    sound['interpolate_two']['second']['cqt_path'] = str(cqt_path.resolve())
    my_report = 'Second sound is set to: \n {} \n at the path \n {}'.format(sound['interpolate_two']['second']['name'],sound['interpolate_two']['second']['audio_path'], sound['interpolate_two']['second']['cqt_path']  )
    
    print_plus_osc(my_report)
    
    client.send_message("/sound/interpolate_two/second/path", sound['interpolate_two']['second']['audio_path'])
    client.send_message("/sound/interpolate_two/second/name", sound['interpolate_two']['second']['name'])   

    #Load Audio 1 
    sound['interpolate_two']['first']['duration'] = librosa.get_duration(filename=audio_path)
    sound['interpolate_two']['first']['CQT'] = np.load(os.path.join(my_cqt, sound['interpolate_two']['first']['name']+'.npy'))

  #If path does not exists  
  else:
    my_warning = 'Could not set the first sound. The path does not exist. Received the following OSC message: \n {} \n generated the following path \n Audio:{} \n CQT:{}'.format(osc_arguments[0], audio_path, cqt_path)
    warning_plus_osc(my_warning)

def set_batch_size(address: str, *osc_arguments: List[Any]) -> None:

  global batch_size

  batch_size = int(osc_arguments[0])
  client.send_message("/model/batch_size", batch_size) 

  print_plus_osc('Batch size is set to: {}'.format(osc_arguments[0]))

def set_griffin_lim_iterations(address: str, *osc_arguments: List[Any]) -> None:
  #Expects an integer to set number of iterations for the griffin lim algorithm

  global n_iter

  n_iter = int(osc_arguments[0])
  client.send_message("/output/gf_iter", n_iter) 

  print_plus_osc('Griffin Lim number of iterations is set to: {}'.format(osc_arguments[0]))

def set_normalization(address: str, *osc_arguments: List[Any]) -> None:
  global normalize
  batch_size = int(osc_arguments[0])
  client.send_message("/output/normalize", normalize) 
  if normalize:
    print_plus_osc('Output normalization is on.')
  else:
    print_plus_osc('Output normalization is off.')

def generate_sound(address: str, *osc_arguments: List[Any]) -> None:  
  if len(osc_arguments) != 3:
    warning_plus_osc('Generate sound function did not receive enough arguments ({}). Required number of arguments are 3: duration, audio_1_offset, audio_2_offset'.format(len(osc_arguments)))
    return
  #import audio configs 
  sample_rate = config['audio'].getint('sample_rate')
  hop_length = config['audio'].getint('hop_length')
  bins_per_octave = config['audio'].getint('bins_per_octave')
  num_octaves = config['audio'].getint('num_octaves')
  n_bins = int(num_octaves * bins_per_octave)
  n_iter = config['audio'].getint('n_iter')
  #Model configs
  if 'VAE' in config:
    config['model'] = config['VAE'] 
  elif 'CVAE' in config:
    config['model'] = config['CVAE']
  else:
    warning_plus_osc('Could not find the model parameters in the config. Tried key options CVAE and VAE.')
    return  

  latent_dim = config['model'].getint('latent_dim')

  example_length = int(osc_arguments[0])
  if verbose:
    print_plus_osc('Interpolate 2 - duration set to {}'.format(example_length))
  

  interpolations_audio_1 = sound['interpolate_two']['first']['name']
  audio_1_offset = osc_arguments[1]
  
  interpolations_audio_2 = sound['interpolate_two']['second']['name']
  audio_2_offset = osc_arguments[2]
  
  if verbose:
    print_plus_osc('First audio: {} \n First audio offset: {} \n Second audio: {} \n Second audio offset: {}'.format(interpolations_audio_1, audio_1_offset, interpolations_audio_2, audio_2_offset))
  
  #required for the initial test
  os.makedirs(os.path.join(dataset, test),exist_ok=True)



if __name__ == "__main__":
    #Parse arguments
  parser = argparse.ArgumentParser()
  parser.add_argument("--receiveIP", default="127.0.0.1",
        help="The ip of the OSC server")

  parser.add_argument("--receivePORT", type=int, default=7020,
        help="The port the OSC server is sending")
  
  parser.add_argument("--sendIP", default="127.0.0.1",
        help="The ip of the OSC client")
  
  parser.add_argument("--sendPORT", type=int, default=7021,
        help="The port the OSC client is sending")
  
  parser.add_argument("--verbose", default=True,
      help="Should I report what is happening?")
  args = parser.parse_args()
  
  verbose = args.verbose


  #import audio configs 
  #n_bins = int(config['audio'].getint(num_octaves) * config['audio'].getint(bins_per_octave))

  print('Waiting osc message to load a model...')

  dispatcher = dispatcher.Dispatcher()
  dispatcher.map("/load/dataset", initiate_dataset)
  dispatcher.map("/load/model", load_model)
  dispatcher.map("/generate", generate_sound)

  #set params
  dispatcher.map("/batch_size/set", set_batch_size)
  dispatcher.map('/output/normalize', set_normalization)
  dispatcher.map("/sound/interpolate_two/first/name", set_i2_first_sound)
  dispatcher.map("/sound/interpolate_two/second/name", set_i2_second_sound)
  dispatcher.map("/output/gf_iter", set_griffin_lim_iterations)

  server = osc_server.ThreadingOSCUDPServer(
      (args.receiveIP, args.receivePORT), dispatcher)
  print("Listening to {}".format(server.server_address))
  client = SimpleUDPClient(args.sendIP, args.sendPORT)  # Create client
  print("Sending reports to {} {}".format(args.sendIP, args.sendPORT))
  server.serve_forever()
  
