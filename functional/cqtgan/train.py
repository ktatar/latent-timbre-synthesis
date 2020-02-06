# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
tf.keras.backend.clear_session()  # For easy reset of notebook state.

import random
import numpy as np

import os, sys, argparse, time
from termcolor import colored
os.system('color')

import librosa
import configparser
import random
import json
import matplotlib.pyplot as plt
import time

#from IPython import display

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default.ini' , help='path to the config file')
args = parser.parse_args()

##Get configs
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
dataset = config['dataset'].get('datapath')
cqt_dataset = config['dataset'].get('cqt_dataset')
workspace = config['dataset'].get('workspace')
run_number = config['dataset'].getint('run_number')

if not os.path.exists(dataset):
    raise FileNotFoundError('dataset folder does not exist!')
    
my_cqt = os.path.join(dataset, cqt_dataset)

if not os.path.exists(my_cqt):
    raise FileNotFoundError

my_audio = os.path.join(dataset, 'audio')
    
#Training configs
epochs = config['training'].getint('epochs')
learning_rate = config['training'].getfloat('learning_rate')
batch_size = config['training'].getint('batch_size')
train_buf = config['training'].getint('buffer_size')
buffer_size_dataset = config['training'].getboolean('buffer_size_dataset')
max_to_keep = config['training'].getint('max_ckpts_to_keep')
ckpt_epochs = config['training'].getint('checkpoint_epochs')
continue_training = config['training'].getboolean('continue_training')
learning_schedule = config['training'].getboolean('learning_schedule')
save_best_only = config['training'].getboolean('save_best_only')
early_patience_epoch = config['training'].getint('early_patience_epoch')
early_delta = config['training'].getfloat('early_delta')

#Model configs
latent_dim = config['CGAN'].getint('latent_dim')

#etc
example_length = config['extra'].getint('example_length')
normalize_examples = config['extra'].getboolean('normalize_examples')
plot_model = config['extra'].getboolean('plot_model')
desc = config['extra'].get('description')
start_time = time.time()
config['extra']['start'] = time.asctime( time.localtime(start_time) )

AUTOTUNE = tf.data.experimental.AUTOTUNE

#Create workspace
if not continue_training:
    run_id = run_number
    while True:
        try:
            my_runs = os.path.join(dataset, desc)
            workdir = os.path.join(my_runs, 'run-%03d' % (run_id)) 
            os.makedirs(workdir)
            print(workdir)

            break
        except OSError:
            if os.path.isdir(workdir):
                run_id = run_id + 1
                continue
            raise

    config['dataset']['workspace'] = workdir
else:
    workdir = config['dataset'].get('workspace')

print(colored("Workspace: {}".format(workdir), 'magenta'))

# Load and prepare the dataset
print(colored('creating the dataset...', 'magenta'))
training_array = []
new_loop = True

for f in os.listdir(my_cqt): 
    if f.endswith('.npy'):
        print('adding-> %s' % f)
        new_array = np.load(os.path.join(my_cqt,f))
        if new_loop:
            training_array = new_array
            new_loop = False
        else:
            training_array = np.concatenate((training_array, new_array), axis=0)

total_cqt = len(training_array)
print(colored('Total number of CQT frames: {}'.format(total_cqt)), 'magenta')
config['dataset']['total_frames'] = str(total_cqt)

print(colored("saving initial configs..."), 'magenta')
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

if buffer_size_dataset:
  train_buf = len(training_array)

#training_array = training_array.reshape((training_array.shape[0], bins_per_octave, num_octaves, 1))
train_df = tf.data.Dataset.from_tensor_slices(training_array)
train_dataset = train_df.shuffle(train_buf).batch(batch_size).prefetch(AUTOTUNE)

# Create the models

#Both the generator and discriminator are defined using the Keras Functional API.

# The Generator
def make_generator_model():
    in_cqt = layers.Input(shape=(latent_dim,))
    x = layers.Dense(image_shape[0] // 4 * image_shape[1]// 4 * generator_filters, use_bias=False)(in_lat)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    x = layers.Reshape((image_shape[0] // 4, image_shape[1] // 4, generator_filters))(x)
    x = layers.Conv2DTranspose(generator_filters//2, kernel_size, strides=(1, 1), padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    x = layers.Conv2DTranspose(generator_filters//4, kernel_size, strides=(2, 2), padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    x = layers.Conv2DTranspose(1, kernel_size, strides=(2, 2), padding='same', use_bias=False, activation=generator_activation)(x)
    out_audio_frame = layers.Reshape(target_shape=(n_bins,))(x)

    # define model
    model = Model(in_cqt, out_audio_frame)
    return model

generator = make_generator_model()
generator.summary()

# The Discriminator

def make_discriminator_model():
    in_audio_frame = layers.Input(shape=(n_bins,))
    x = layers.Reshape(target_shape=(bins_per_octave, num_octaves, 1))(in_img)
    x = layers.Conv2D(discriminator_filters, (5, 5), strides=(2, 2), padding='same')(x)
    x = layers.LeakyReLU()(x)
    x = layers.Dropout(0.3)(x)
    x = layers.Conv2D(discriminator_filters*2, (5, 5), strides=(2, 2), padding='same')(x)
    x = layers.LeakyReLU()(x)
    x = layers.Dropout(0.3)(x)
    x = layers.Flatten()(x)
    out_decision = layers.Dense(1)(x)
    
    # define model
    model = Model(in_audio_frame, out_decision)
    return model

discriminator = make_discriminator_model()

discriminator.summary()
#tf.keras.utils.plot_model(discriminator, show_shapes=True, dpi=64)
if plot_model:
  tf.keras.utils.plot_model(
    generator,
    to_file=os.path.join(workdir,'model_vae.jpg'),
    show_shapes=True,
    show_layer_names=True,
    rankdir='TB',
    expand_nested=True,
    dpi=300
  )

  tf.keras.utils.plot_model(
      discriminator,
      to_file=os.path.join(workdir,'model_encoder.jpg'),
      show_shapes=True,
      show_layer_names=True,
      rankdir='TB',
      expand_nested=True,
      dpi=300
  )

# Define the loss and optimizers

# Define loss functions and optimizers for both models.

cross_entropy = tf.keras.losses.BinaryCrossentropy(from_logits=True)

# Discriminator loss
def discriminator_loss(real_output, fake_output):
    real_loss = cross_entropy(tf.ones_like(real_output), real_output)
    fake_loss = cross_entropy(tf.zeros_like(fake_output), fake_output)
    total_loss = real_loss + fake_loss
    return total_loss

# Generator loss
def generator_loss(fake_output):
    return cross_entropy(tf.ones_like(fake_output), fake_output)

# The discriminator and the generator optimizers are different since we will train 
# two networks separately.
    
generator_optimizer = tf.keras.optimizers.Adam(learning_rate)
discriminator_optimizer = tf.keras.optimizers.Adam(learning_rate)

# Save checkpoints

# This notebook also demonstrates how to save and restore models, which can be helpful 
# in case a long running training task is interrupted.

checkpoint_dir = os.path.join(workdir,'training_checkpoints')
os.makedirs(checkpoint_dir, exist_ok=True)
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt")
checkpoint = tf.train.Checkpoint(generator_optimizer=generator_optimizer,
                                 discriminator_optimizer=discriminator_optimizer,
                                 generator=generator,
                                 discriminator=discriminator, step=tf.Variable(0))
manager = tf.train.CheckpointManager(
    checkpoint, directory=checkpoint_prefix, max_to_keep=max_to_keep)

# Define the training loop

# The training loop begins with generator receiving a random seed as input. 
# That seed is used to produce an image. The discriminator is then used to classify real 
# images (drawn from the training set) and fakes images (produced by the generator). 
# The loss is calculated for each of these models, and the gradients are used to 
# update the generator and discriminator.

# Notice the use of `tf.function`
# This annotation causes the function to be "compiled".
@tf.function
def train_step(images):
    noise = tf.random.normal([batch_size, latent_dim])

    with tf.GradientTape() as gen_tape, tf.GradientTape() as disc_tape:
      generated_images = generator(noise, training=True)

      real_output = discriminator(images, training=True)
      fake_output = discriminator(generated_images, training=True)
      
      gen_loss = generator_loss(fake_output)
      disc_loss = discriminator_loss(real_output, fake_output) 

    gradients_of_generator = gen_tape.gradient(gen_loss, generator.trainable_variables)
    gradients_of_discriminator = disc_tape.gradient(disc_loss, discriminator.trainable_variables)

    generator_optimizer.apply_gradients(zip(gradients_of_generator, generator.trainable_variables))
    discriminator_optimizer.apply_gradients(zip(gradients_of_discriminator, discriminator.trainable_variables))
    
    return gen_loss, disc_loss

def train(dataset, epochs):
  for epoch in range(epochs):
    start = time.time()

    for image_batch in dataset:
      gen_loss, disc_loss = train_step(image_batch)

    # Produce images for the GIF as we go
    #display.clear_output(wait=False)
    generate_and_save_images(generator,
                             epoch + 1,
                             seed)
    
    # Save the model every 15 epochs
    checkpoint.step.assign_add(1)
    if int(checkpoint.step) % ckpt_epochs == 0:
      save_path = manager.save()
      print("Saved checkpoint for epoch {}: {}".format(int(checkpoint.step), save_path))

    print ('epoch {} : gen_loss {:01.4f} and disc_loss {:01.4f} and time {}'.format(epoch + 1, gen_loss, disc_loss, time.time()-start))

  # Generate after the final epoch
  #display.clear_output(wait=False)
  generate_and_save_images(generator,
                           epochs,
                           seed)

image_dir = os.path.join(workdir,"images") 
os.makedirs(image_dir, exist_ok=True)
  
# Train the model

# Call the train() method defined above to train the generator and discriminator simultaneously. 
# Note, training GANs can be tricky. It's important that the generator and discriminator do not overpower each other 
# (e.g., that they train at a similar rate).

# At the beginning of the training, the generated images look like random noise. As training 
# progresses, the generated digits will look increasingly real. After about 50 epochs, they 
# resemble MNIST digits. This may take about one minute / epoch with the default settings on Colab.
  
train(train_dataset, epochs)

print("Exiting...")
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)

# Generate examples 
'''print("Generating examples...")
my_examples_folder = os.path.join(workdir, 'audio_examples')
for f in range(num_examples):

  num_frames = int(np.rint(example_duration * sample_rate))

  print('Generating latent vectors...')
  shape = [num_frames, latent_dim] # [frame, image, channel, component]
  all_latents = tf.random.normal(shape=shape,seed=None).numpy().astype(np.float32)
  all_latents = scipy.ndimage.gaussian_filter(all_latents, [smoothing_sec * sample_rate] + [0, 0], mode='wrap')
  all_latents /= np.sqrt(np.mean(np.square(all_latents)))

  cqts = generator(all_latents, training=False)'''
