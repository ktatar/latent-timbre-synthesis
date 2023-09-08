# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals
import random
import numpy as np
import ctypes

import os, sys, argparse, time, random
from pathlib import Path
import librosa
import soundfile as sf
import configparser
from pythonosc import dispatcher
from pythonosc import osc_server 
from typing import List, Any
from pythonosc.udp_client import SimpleUDPClient
import warnings 
import sounddevice as sd
from scipy import interpolate

def print_plus_osc(my_report):
  print(my_report)
  client.send_message("/report", my_report)

print("Initiating Tensorflow...")

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

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

#These are default values, but they are updates while loading a model run. 
sample_rate = 44100
hop_length = 128
n_iter = 1
bins_per_octave = 48
num_octaves = 8
n_bins = int(num_octaves * bins_per_octave)
n_iter = 1
batch_size = 16
sound = {
  'interpolate_two':{
    'first':{
      'name': '',
      'audio_path': '',
      'duration': 0.0,
      'cqt_path':'',
      'CQT': np.empty([0])
    },
    'second':{
      'name': '',
      'audio_path': '',
      'duration': 0.0,
      'cqt_path':'',
      'CQT': np.empty([0])
    },
    'alfa': np.empty([1000]).fill(0.5),
    'save_folder': '' 
  }
}
#generate empty models
trained_model = tf.keras.Model()
encoder = tf.keras.Model()
decoder = tf.keras.Model()

#audio devices
audio_device_list = {}

#A numpy array to pass the audio around 
generated_audio = np.empty([])
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

def get_audio_devices(address: str, *osc_arguments: List[Any]) -> None:
  global audio_device_list

  audio_device_list = sd.query_devices()
  
  #Following is to generate the umenu in Max GUI
  client.send_message("/audio/devicelist", "clear")
  for i in range(len(audio_device_list)):
    client.send_message("/audio/devicelist", str(i)+' '+audio_device_list[i]['name'])
  
  print(str(audio_device_list))
def set_input_audio_device(address: str, *osc_arguments: List[Any]) -> None:
  #set using the device ID give by sd.query_device()
  sd.default.device[0] = osc_arguments[0]
  print_plus_osc('Audio input is set to {}'.format(audio_device_list[sd.default.device[0]]['name']))

def set_output_audio_device(address: str, *osc_arguments: List[Any]) -> None:
  #set using the device ID give by sd.query_device()
  sd.default.device[1] = osc_arguments[0]
  print_plus_osc('Audio output is set to {}'.format(audio_device_list[sd.default.device[1]]['name']))


def set_load_datasetpath_with_model(my_state=False):
  global load_datasetpath_with_model

  #if you want to set the dataset path directly from the config file, 
  load_datasetpath_with_model = my_state

def warning_plus_osc(my_warning):
  warnings.warn(my_warning)
  client.send_message("/report", my_warning)

def initiate_dataset(address: str, *osc_arguments: List[Any]) -> None:
  global dataset

  if Path(osc_arguments[0]).exists(): 
    dataset = Path(osc_arguments[0])
    my_report = 'Dataset is set to: \n {}'.format(dataset.resolve())
    print(my_report)
    client.send_message("/dataset", str(dataset.resolve()) )   # Send float message
    client.send_message("/report", my_report)
  else:
    my_warning = 'Could not set the dataset. The path does not exist. Received the following OSC message: \n {}'.format(osc_arguments[:])
    warning_plus_osc(my_warning)

def load_model(address: str, *osc_arguments: List[Any]) -> None:
  global dataset, run_path, my_cqt, my_audio, trained_model, encoder, decoder, config, sample_rate, hop_length, bins_per_octave, num_octaves, n_bins

  run_path = Path(osc_arguments[0])

  #reports
  print_plus_osc('Current dataset path is {}'.format( str(dataset.resolve())))
  print_plus_osc('Received a request to load model from path {}'.format( str(dataset.resolve())))
  
  if not run_path.exists():
    my_warning = 'Run path does not exist: \n {} \n Could not load the DL model'.format(str(run_path.resolve()))
    warning_plus_osc(my_warning)
    return

  config_path = run_path / 'config.ini'
  if not config_path.exists():
    my_warning = 'Run path does not exist: \n {} \n Could not load the DL model'.format(config_path)
    warning_plus_osc(my_warning)
    return

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
  
  #Audio configs
  sample_rate = config['audio'].getint('sample_rate')
  hop_length = config['audio'].getint('hop_length')
  bins_per_octave = config['audio'].getint('bins_per_octave')
  num_octaves = config['audio'].getint('num_octaves')
  n_bins = int(num_octaves * bins_per_octave)
  #n_iter = config['audio'].getint('n_iter')

  sd.default.samplerate = sample_rate


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
  
  #Max sends the full path, but we just need the filename
  file_name = Path(osc_arguments[0]).stem
  audio_path = my_audio / (file_name+'.wav')
  cqt_path = my_cqt / (file_name+'.npy')

  if audio_path.exists() and cqt_path.exists(): 
    sound['interpolate_two']['first']['name'] = file_name
    sound['interpolate_two']['first']['audio_path'] = audio_path
    sound['interpolate_two']['first']['cqt_path'] = cqt_path
    my_report = 'First sound is set to: \n {} \n at the path \n {}'.format( sound['interpolate_two']['first']['name'], sound['interpolate_two']['first']['audio_path'], sound['interpolate_two']['first']['cqt_path'])
    
    print_plus_osc(my_report)
    client.send_message("/sound/interpolate_two/first/path",  str(audio_path.resolve()))
    client.send_message("/sound/interpolate_two/first/name",  sound['interpolate_two']['first']['name'])

    #Load Audio 1 
    sound['interpolate_two']['first']['duration'] = librosa.get_duration(filename=audio_path)
    sound['interpolate_two']['first']['CQT'] = np.load(my_cqt / (sound['interpolate_two']['first']['name']+'.npy'))

  else:
    my_warning = 'Could not set the first sound for interpolate_two. Either audio or CQT path do not exist. Received the following OSC message: \n {} \n generated the following audio path \n {} \n generated following CQT path \n {}'.format(osc_arguments[0], audio_path, cqt_path)
    warning_plus_osc(my_warning)

def set_i2_second_sound(address: str, *osc_arguments: List[Any]) -> None:
  global sound, generated_audio

  file_name = Path(osc_arguments[0]).stem  
  audio_path = my_audio / (file_name+'.wav')
  cqt_path = my_cqt / (file_name+'.npy')
  
  if audio_path.exists() and cqt_path.exists(): 
    sound['interpolate_two']['second']['name'] = file_name
    sound['interpolate_two']['second']['audio_path'] = audio_path
    sound['interpolate_two']['second']['cqt_path'] = cqt_path
    my_report = 'Second sound is set to: \n {} \n at the path \n {}'.format(sound['interpolate_two']['second']['name'],sound['interpolate_two']['second']['audio_path'], sound['interpolate_two']['second']['cqt_path']  )
    
    print_plus_osc(my_report)
    
    client.send_message("/sound/interpolate_two/second/path", str(audio_path.resolve()))
    client.send_message("/sound/interpolate_two/second/name", sound['interpolate_two']['second']['name'])   

    #Load Audio 1 
    sound['interpolate_two']['second']['duration'] = librosa.get_duration(filename=audio_path)
    sound['interpolate_two']['second']['CQT'] = np.load(my_cqt / (sound['interpolate_two']['second']['name']+'.npy'))

  #If path does not exists  
  else:
    my_warning = 'Could not set the second sound for interpolate_two. The path does not exist. Received the following OSC message: \n {} \n generated the following path \n Audio:{} \n CQT:{}'.format(osc_arguments[0], audio_path, cqt_path)
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
  normalize = osc_arguments[0]
  client.send_message("/output/normalize", normalize) 
  if normalize:
    print_plus_osc('Output normalization is on.')
  else:
    print_plus_osc('Output normalization is off.')

def generate_sound(address: str, *osc_arguments: List[Any]) -> None:  
  global generated_audio

  if len(osc_arguments) != 3:
    warning_plus_osc('Error: Generate sound function did not receive enough arguments ({}). Required number of arguments are 3: duration, audio_1_offset, audio_2_offset. Units are seconds.'.format(len(osc_arguments)))
    return

  example_length = float(osc_arguments[0])
  if verbose:
    print_plus_osc('Interpolate two - duration set to {}'.format(example_length))
  
  interpolations_audio_1 = sound['interpolate_two']['first']['name']
  audio_1_offset = osc_arguments[1]
  
  interpolations_audio_2 = sound['interpolate_two']['second']['name']
  audio_2_offset = osc_arguments[2]
  
  if (audio_1_offset+example_length) > sound['interpolate_two']['first']['duration']:
    warning_plus_osc('audio_1_offset+example_length ({}) > Audio_1 total length ({}). Can not generate examples. \n Are you sure you set the sounds? \n Audio 1 name-> {}'.format(audio_1_offset+example_length, sound['interpolate_two']['first']['duration'], sound['interpolate_two']['first']['name']))
    return
  
  elif (audio_2_offset+example_length) > sound['interpolate_two']['second']['duration']:
    warning_plus_osc('audio_2_offset+example_length ({}) > Audio_2 total length ({}). Can not generate interpolations. \n Are you sure you set the sounds? \n Audio 1 name-> {}'.format(audio_2_offset+example_length, sound['interpolate_two']['second']['duration'], sound['interpolate_two']['second']['name']))
    return 
  
  #Model configs
  if 'VAE' in config:
    config['model'] = config['VAE'] 
  elif 'CVAE' in config:
    config['model'] = config['CVAE']
  else:
    warning_plus_osc('Could not find the model parameters in the config. Tried key options CVAE and VAE.')
    return  

  latent_dim = config['model'].getint('latent_dim')

  if verbose:
    print_plus_osc('First audio: {} \n First audio offset: {} \n Second audio: {} \n Second audio offset: {} \n Example Length: {}'.format(interpolations_audio_1, audio_1_offset, interpolations_audio_2, audio_2_offset, example_length))
  
  audio_1_offset_frames = librosa.time_to_samples(audio_1_offset, sr=sample_rate)//hop_length
  audio_2_offset_frames = librosa.time_to_samples(audio_2_offset, sr=sample_rate)//hop_length
  duration_frames = librosa.time_to_samples(example_length, sr=sample_rate)//hop_length

  cqt_audio_1 = sound['interpolate_two']['first']['CQT']
  C_1 = cqt_audio_1[audio_1_offset_frames:(audio_1_offset_frames+duration_frames)]

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

  cqt_audio_2 = sound['interpolate_two']['second']['CQT']
  C_2 = cqt_audio_2[audio_2_offset_frames:(audio_2_offset_frames+duration_frames)]

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

  #Generate interpolations 
  if verbose: 
    print_plus_osc('Generating interpolations')

  #ALFA multiplier matrix generation
  #MAX sends a curve with 1000 samples. We create a function using this curve, and then we resample this function to match the size of number of audio frames
  #Get alfa
  alfa = sound['interpolate_two']['alfa']
  
  #Map [-1, 1] range from Max to [0,1]. 
  alfa = (alfa + 1.0)/2.0

  #Resample and reshape to multiply each latent vector with an alfa vector
  f = interpolate.interp1d(np.arange(0, len(alfa)), alfa)
  my_stretched_alfa = f(np.linspace(0.0, len(alfa)-1, len(audio_1_latent_vecs_mean)))
  #add an axis to stretched array
  my_multiplier_array = my_stretched_alfa[...,np.newaxis]

  #Generate vectors out of constants
  alfa = np.repeat(my_multiplier_array, audio_1_latent_vecs_mean.shape[1], axis=1)

  #generate mixed latent vectors    
  #alfa(latent1-latent2)+latent2 = alfa * latent1 + (1-alfa) * latent2
  latent_mix_mean = tf.math.add(
      tf.math.multiply(tf.constant(alfa, dtype='float32'), audio_1_latent_vecs_mean), 
      tf.math.multiply(tf.constant(1-alfa, dtype='float32'), audio_2_latent_vecs_mean))
  latent_mix_log_var = tf.math.add(
      tf.math.multiply(tf.constant(alfa, dtype='float32'),audio_1_latent_vecs_log_var), 
      tf.math.multiply(tf.constant(1-alfa, dtype='float32'), audio_2_latent_vecs_log_var))

  sampled_latent_mix = Sampling()((latent_mix_mean, latent_mix_log_var))                      

  decoder_dataset = tf.data.Dataset.from_tensor_slices(sampled_latent_mix).batch(batch_size).prefetch(AUTOTUNE)

  if verbose:
    print_plus_osc('Generating DL model outputs')
  output_C = tf.constant(0., dtype='float32', shape=(1,n_bins))
  with tf.keras.utils.CustomObjectScope({'Sampling': Sampling}):
    for step, x_batch_train in enumerate(decoder_dataset):
      output_C = decoder(sampled_latent_mix,training=False)
  if verbose:
    print_plus_osc('Running phase estimation') 

  y_inv_audio_mix = librosa.griffinlim_cqt(np.transpose(output_C), sr=sample_rate, n_iter=n_iter, hop_length=hop_length, bins_per_octave=bins_per_octave, dtype=np.float32)
  generated_audio = y_inv_audio_mix
  if verbose:
    print_plus_osc("Audio generated, playing...")
  
  sd.play(generated_audio)

def play_again(address: str, *osc_arguments: List[Any]) -> None:

    sd.play(generated_audio)
    if verbose:
        print_plus_osc("Playing the previous audio...")

def save_audio(address: str, *osc_arguments: List[Any]) -> None:
    if sound['interpolate_two']['save_folder'] == '':
        print_plus_osc('Please provide a save folder before saving the audio')
        return

    #Try filenames until you find an available one.
    count = 0
    while True:
        filename = 'generated_audio-{:05d}.wav'.format(count)
        save_path = sound['interpolate_two']['save_folder'] / filename 
        if save_path.exists():
            count += 1
            continue
        else:
            #save the audio to a wav file
            sf.write(save_path, generated_audio, sample_rate)
            print_plus_osc('Saved the last generated sound at the path: {}'.format(save_path))
            break

def set_alfa(address: str, *osc_arguments: List[Any]) -> None:
  global sound

  sound['interpolate_two']['alfa'] = np.asarray(osc_arguments[:]) 
  print_plus_osc('Alfa vector is updated.')

def set_save_folder(address: str, *osc_arguments: List[Any]) -> None:
    global sound

    if Path(osc_arguments[0]).exists():
      save_folder = Path(osc_arguments[0])
      sound['interpolate_two']['save_folder'] = save_folder
      print_plus_osc('Save folder set to {}'.format(str(save_folder.resolve())))
    else:
        warning_plus_osc('Save folder does not exist at the path {}'.format(osc_arguments[0]))    

def stop_playing(address: str, *osc_arguments: List[Any]) -> None:
    
    sd.stop()
    print_plus_osc('Stopped audio playback...')

def test_connection(address: str, *osc_arguments: List[Any]) -> None:
  print('Received the connection test message. Sending a message to test the connection from python to Max. Did you receive "Connection works"? ')
  client.send_message("/report", ' Connection works. #{}'.format(random.randint(1,100)) )

def set_phase_iter(address: str, *osc_arguments: List[Any]) -> None:
  global n_iter

  n_iter = int(osc_arguments[0]) 
  print_plus_osc('Number of phase estimation iterations set to {}'.format(n_iter))

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


  dispatcher = dispatcher.Dispatcher()
  dispatcher.map("/test/connection", test_connection)

  dispatcher.map("/load/dataset", initiate_dataset)
  dispatcher.map("/load/model", load_model)

  #set params
  dispatcher.map("/batch_size/set", set_batch_size)
  dispatcher.map('/output/normalize', set_normalization)
  dispatcher.map("/output/gf_iter", set_griffin_lim_iterations)
  dispatcher.map('/audio/devicelist', get_audio_devices)
  dispatcher.map('/audio/device/in', set_input_audio_device)
  dispatcher.map('/audio/device/out', set_output_audio_device)
  #interpolate two sounds
  dispatcher.map("/interpolate_two/generate", generate_sound)
  
  dispatcher.map('/sound/set_phase_iter', set_phase_iter)
  dispatcher.map("/sound/interpolate_two/first/audio_path", set_i2_first_sound)
  dispatcher.map("/sound/interpolate_two/second/audio_path", set_i2_second_sound)
  dispatcher.map("/sound/interpolate_two/play_again", play_again)
  dispatcher.map("/sound/interpolate_two/save_folder", set_save_folder)
  dispatcher.map("/sound/interpolate_two/save", save_audio)
  dispatcher.map("/sound/stop", stop_playing)

  dispatcher.map("/set_alfa", set_alfa)
  

  server = osc_server.ThreadingOSCUDPServer(
      (args.receiveIP, args.receivePORT), dispatcher)

  print("Listening to {}".format(server.server_address))
  client = SimpleUDPClient(args.sendIP, args.sendPORT)  # Create client
  print("Sending reports to {} {}".format(args.sendIP, args.sendPORT))
  if verbose:
    print_plus_osc('Initiating audio...\n')
  
  audio_device_list = sd.query_devices()
  #Following is to generate the umenu in Max GUI
  client.send_message("/audio/devicelist", "clear")
  for i in range(len(audio_device_list)):
    client.send_message("/audio/devicelist", str(i)+' '+audio_device_list[i]['name'])
  
  print(str(audio_device_list))

  print('Current audio device: {}'.format(sd.default.device))
  client.send_message("/audio/io", '{} {}'.format(sd.default.device[0], sd.default.device[1]) )
  print_plus_osc('Waiting osc message to load a model...')
  server.serve_forever()