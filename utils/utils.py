# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals
import tensorflow as tf
from tensorflow.keras import layers
import random
import numpy as np

import os, sys, argparse, time

import librosa
import configparser
import random
import json
import matplotlib.pyplot as plt

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default.ini' , help='path to the config file')
args = parser.parse_args()
print(args['config'])

