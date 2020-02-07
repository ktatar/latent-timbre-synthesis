
from __future__ import absolute_import, division, print_function, unicode_literals

#import tensorflow as tf
#from tensorflow.keras import layers

import random
import numpy as np

import os, sys, argparse, time
import librosa
from tqdm import tqdm
import configparser

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default.ini' , help='path to the config file')
args = parser.parse_args()

#Get configs
config_path = args.config
config = configparser.ConfigParser(allow_no_value=True)
config.read(config_path)

#audio configs
#import audio configs 
sample_rate = config['audio'].getint('sample_rate')
hop_length = config['audio'].getint('hop_length')
bins_per_octave = config['audio'].getint('bins_per_octave')
num_octaves = config['audio'].getint('num_octaves')
n_bins = num_octaves * bins_per_octave
n_iter=config['audio'].getint('n_iter')
cqt_bit_depth = config['audio'].get('cqt_bit_depth')

#dataset
dataset = config['dataset'].get('datapath')
cqt_dataset = config['dataset'].get('cqt_dataset')
my_cqt = os.path.join(dataset, cqt_dataset)
os.makedirs(my_cqt,exist_ok=True)
my_audio_folder = dataset + '/audio'
pbar = len(os.listdir(my_audio_folder))
print('TOTAL FILES: '+str(pbar))
with open(os.path.join(my_cqt,'config.ini'), 'w') as configfile:
  config.write(configfile)
current_num = 0
if __name__ == '__main__': 
    for f in os.listdir(my_audio_folder): 
        if ( os.path.isfile(os.path.join(my_audio_folder, f)) & f.endswith('.wav') ):
            print('DONE: '+str(current_num))
            my_audio = os.path.join(my_audio_folder,f)
            outfile = os.path.join(my_cqt,os.path.splitext(f)[0])
            if os.path.exists(outfile+'.npy'):
                print(outfile+' exists. Next file...')
                current_num += 1
                continue
            try:
                print('loading...: '+my_audio)    
                s, fs = librosa.load(my_audio, sr=None)
                if fs != sample_rate:
                    print("resampling %s" % (my_audio))
                    s, fs = librosa.load(my_audio, sr=sample_rate)
                hop_length = hop_length
                bins_per_octave = bins_per_octave
                print('get CQTs...')
                # Get the CQT magnitude
                C_complex = librosa.cqt(y=s, sr=sample_rate, hop_length= hop_length, bins_per_octave=bins_per_octave, n_bins=n_bins)
                C = np.abs(C_complex)
                print('data processing...')
                #tensorflow expects the transpose of librosa's output
                C = np.transpose(C)
                #tensorflow works in float32; cqt arrays are float64
                if cqt_bit_depth == 'float32':
                    C = C.astype('float32')
                print('writing: '+outfile)
                np.save(outfile, C)
                current_num += 1
            except:
                print('There was an issue with '+f)    
                current_num += 1
                continue