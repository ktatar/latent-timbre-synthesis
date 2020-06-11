# -*- coding: utf-8 -*-

print('script started...')
# The original visualization script is divided to two because scikit tsne runs on cpu, and we run the tsne training on a job with multiple cores and no gpu.


#import tensorflow as tf
#from tensorflow.keras import layers
#print('tensorflow loaded...')

from tsnecuda import TSNE
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
parser.add_argument('--config', type=str, default ='./lspace_vis_tsne.ini' , help='path to the config file')
args = parser.parse_args()

#Get configs
print("Getting configs...")

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
print("Init dataset...")

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

num_frames_per_file = np.load(workspace.joinpath('num_frames_per_file.npy'))
audio_all_latent_vecs_mean = np.load(workspace.joinpath("all_latent_vecs").joinpath('all_latent_vecs_mean.npy'))

tsne = TSNE(n_components=2, perplexity=30, n_iter=1000)

Z_tsne = tsne.fit_transform(audio_all_latent_vecs_mean)
np.save(workspace.joinpath('Z_tsne_mean.npy'), Z_tsne)
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