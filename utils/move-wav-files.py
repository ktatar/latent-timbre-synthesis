    # -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals
import os 
import numpy as np

path = 'D:/my_workspace/dataset/erokia/func-timbre-vae-cedar/run-013/audio_examples_interpolations'
my_destination = ''

count = 0

#For loop for files in a folder
for root, dirs, files in os.walk(path):
    for f in files:
        if f.endswith('.wav'):
           filepath = root + os.sep + f
           #print(path+'/'+str(count)+'-'+f)
           os.rename(filepath, path+'/'+str(count)+'-'+f)
           count += 1