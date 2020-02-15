# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers

import random
import numpy as np
import ctypes

import os, sys, argparse, time, random
import librosa
import pdb
import configparser
from pythonosc import dispatcher
from pythonosc import osc_server
from typing import List, Any

import warnings 
def custom_formatwarning(msg, *args, **kwargs):
    # ignore everything except the message
    return str(msg) + '\n'

warnings.formatwarning = custom_formatwarning

#tensorflow autotune
AUTOTUNE = tf.data.experimental.AUTOTUNE
#verbose for the extra prints
verbose = True
config = {}
load_datasetpath_with_model = False
dataset = ''
run_path = ''
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

def initiate_dataset(address: str, *osc_arguments: List[Any]) -> None:
  if os.path.exists(osc_arguments[0]): 
    dataset = osc_arguments[0]
    print('Dataset is set to: \n {}'.format(osc_arguments[0]))
  else:
    warnings.warn('Could not set the dataset. The path does not exist. Received the following OSC message: \n {}'.format(osc_arguments[:]))
def load_model(address: str, *osc_arguments: List[Any]) -> None:
  global dataset, run_path, my_cqt, my_audio
  run_path = osc_arguments[0]

  if not os.path.exists(run_path):
    raise FileNotFoundError('Run path does not exist: \n {} \n Could not load the DL model'.format(run_path))

  config = configparser.ConfigParser(allow_no_value=True)
  config_path = os.path.join(run_path, 'config.ini')
  config.read(config_path)

  cqt_dataset = config['dataset'].get('cqt_dataset')
  my_cqt = os.path.join(dataset, cqt_dataset)
  print('CQT dataset set to \n {}'.format(my_cqt))
  my_audio = os.path.join(dataset, 'audio')
  print('Audio path set to \n {}'.format(my_audio))

  #dataset
  if load_datasetpath_with_model:
    dataset = config['dataset'].get('datapath')
    print('Reverting back to the training dataset path \n {}'.format(dataset))

  cqt_dataset = config['dataset'].get('cqt_dataset')
  my_cqt = os.path.join(config['dataset'].get('datapath'), cqt_dataset)
  print('CQT dataset set to \n {}'.format(my_cqt))
  my_audio = os.path.join(config['dataset'].get('datapath'), 'audio')
  print('Audio path set to \n {}'.format(my_audio))

  #Training configs
  batch_size = config['training'].getint('batch_size')

  #load the model
  my_model_path = os.path.join(os.path.join(run_path, 'model'),'mymodel_last.h5')

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

  print('Model loaded successfully from \n {}'.format(run_path))
  

if __name__ == "__main__":
    #Parse arguments
  parser = argparse.ArgumentParser()
  parser.add_argument("--ip", default="127.0.0.1",
        help="The ip of the OSC server")
  parser.add_argument("--port", type=int, default=7010,
        help="The port the OSC server is listening on")
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

  server = osc_server.ThreadingOSCUDPServer(
      (args.ip, args.port), dispatcher)
  print("Serving on {}".format(server.server_address))
  server.serve_forever()
  
