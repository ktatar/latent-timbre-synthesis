from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers

import random
import numpy as np
import os, sys, argparse, time
import matplotlib.pyplot as plt
import configparser
import random
import json

from IPython import display

#Training configs

epochs = 200
buffer_size = 60000
batch_size = 64

# Model configs
latent_dim = 4

# workspace configs
workdir = "mnist"

# Load and prepare the dataset

(train_images, _), (test_images, _) = tf.keras.datasets.mnist.load_data()
#(train_images, _), (test_images, _) = tf.keras.datasets.fashion_mnist.load_data()

train_images = train_images.reshape(train_images.shape[0], 28, 28, 1).astype('float32')
#train_images = (train_images - 127.5) / 127.5 # Normalize the images to [-1, 1]
train_images = train_images / 255.0 # Normalize the images to [0, 1]

test_images = test_images.reshape(test_images.shape[0], 28, 28, 1).astype('float32')
#test_images = (test_images - 127.5) / 127.5 # Normalize the images to [-1, 1]
test_images = test_images / 255.0 # Normalize the images to [0, 1]

# Batch and shuffle the data
train_dataset = tf.data.Dataset.from_tensor_slices(train_images).shuffle(buffer_size).batch(batch_size)
test_dataset = tf.data.Dataset.from_tensor_slices(test_images).batch(buffer_size)

#Define Sampling Layer
class Sampling(layers.Layer):
  """Uses (z_mean, z_log_var) to sample z, the vector encoding a digit."""

  def call(self, inputs):
    z_mean, z_log_var = inputs
    batch = tf.shape(z_mean)[0]
    dim = tf.shape(z_mean)[1]
    epsilon = tf.keras.backend.random_normal(shape=(batch, dim))
    return z_mean + tf.exp(0.5 * z_log_var) * epsilon

# Define encoder model.
input_img = layers.Input(shape=(28, 28, 1))
x = layers.Conv2D(32, 3, padding='same', activation='relu')(input_img)
x = layers.Conv2D(64, 3, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2D(64, 3, padding='same', activation='relu')(x)
x = layers.Conv2D(64, 3, padding='same', activation='relu')(x)
# need to know the shape of the network here for the decoder
shape_before_flattening = tf.keras.backend.int_shape(x)
x = layers.Flatten()(x)
x = layers.Dense(32, activation='relu')(x)
# Two outputs, latent mean and (log)variance
z_mean = layers.Dense(latent_dim)(x)
z_log_sigma = layers.Dense(latent_dim)(x)
z = Sampling()((z_mean, z_log_sigma))

encoder = tf.keras.Model(inputs=input_img, outputs=z, name='encoder')
encoder.summary()

# Define decoder model.
input_latent = tf.keras.Input(shape=(latent_dim), name='z_sampling')
# Expand to 784 total pixels
x = layers.Dense(np.prod(shape_before_flattening[1:]), activation='relu')(input_latent)
# reshape
x = layers.Reshape(shape_before_flattening[1:])(x)
# use Conv2DTranspose to reverse the conv layers from the encoder
x = layers.Conv2DTranspose(32, 3, padding='same', activation='relu', strides=(2, 2))(x)
output_img = layers.Conv2D(1, 3, padding='same', activation='sigmoid')(x)

decoder = tf.keras.Model(input_latent, output_img, name='decoder')
decoder.summary()
tf.keras.utils.plot_model(decoder, show_shapes=True, dpi=64)

decoder_output = decoder(z)
# Define VAE model.
vae = tf.keras.Model(input_img, [decoder_output, z_mean, z_log_sigma], name='vae')
vae.summary()
tf.keras.utils.plot_model(vae, show_shapes=True, dpi=64)

# Add Reconstruction and KL loss.
cross_entropy = tf.keras.losses.BinaryCrossentropy(from_logits=True)

def vae_loss(input_img, output_img, z_mean, z_log_sigma):
    # Reconstruction loss
    #rec_loss = tf.reduce_mean((input_img-output_img)**2)
    
    flat_x = tf.keras.backend.flatten(input_img)
    flat_z = tf.keras.backend.flatten(output_img)
    rec_loss = tf.reduce_mean((flat_x-flat_z)**2)
    #rec_loss = cross_entropy(flat_x, flat_z)
    # KL divergence
    kl_loss = -5e-4 * tf.keras.backend.mean(1 + z_log_sigma - tf.keras.backend.square(z_mean) - tf.keras.backend.exp(z_log_sigma), axis=-1)
    return tf.keras.backend.mean(rec_loss + kl_loss)

#vae.add_loss(vae_loss)

optimizer = tf.keras.optimizers.Adam(1e-4)

# Save checkpoints

# This notebook also demonstrates how to save and restore models, which can be helpful 
# in case a long running training task is interrupted.

checkpoint_dir = os.path.join(workdir,'training_checkpoints')
os.makedirs(checkpoint_dir, exist_ok=True)
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt")
checkpoint = tf.train.Checkpoint(optimizer=optimizer,
                                 vae=vae)

# Define the training loop
num_examples_to_generate = 16

# Training Loop
@tf.function
def train_step(input_images):
    with tf.GradientTape() as tape:
      output_images, z_means, z_log_sigmas = vae(input_images, training=True)

      loss = vae_loss(input_images, output_images, z_means, z_log_sigmas) 

    gradients_of_vae = tape.gradient(loss, vae.trainable_variables)

    optimizer.apply_gradients(zip(gradients_of_vae, vae.trainable_variables))
    
    return loss

def train(train_dataset, test_images, epochs):
  for epoch in range(epochs):
    start = time.time()

    for image_batch in train_dataset:
        loss = train_step(image_batch)

    # Produce images for the GIF as we go
    display.clear_output(wait=True)
    generate_and_save_images(vae, epoch + 1, test_images)

    # Save the model every 15 epochs
    if (epoch + 1) % 15 == 0:
      checkpoint.save(file_prefix = checkpoint_prefix)

    print ('epoch {} : loss {:01.4f} time {}'.format(epoch + 1, loss, time.time()-start))

  # Generate after the final epoch
  display.clear_output(wait=True)
  generate_and_save_images(vae, epochs, test_images)
  
image_dir = os.path.join(workdir,"images") 
os.makedirs(image_dir, exist_ok=True)

def generate_and_save_images(model, epoch, test_images):
    
    test_images = test_images[:num_examples_to_generate]
    predictions, _, _ = model(test_images, training=False)
    predictions = np.array(predictions)
    
    fig = plt.figure(figsize=(4,4))
    
    for i in range(num_examples_to_generate):
        plt.subplot(4, 4, i+1)
        plt.imshow(predictions[i, :, :, 0], cmap='gray')
        plt.axis('off')
    
    plt.savefig(os.path.join(image_dir,'image_at_epoch_{:04d}.png'.format(epoch)))
    #plt.close()
    plt.show()


train(train_dataset, test_images, epochs)

generate_and_save_images(vae, 0, test_images)