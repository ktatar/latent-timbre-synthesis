# Tutorial: Deep Convolutional Generative Adversarial Network
# based on: https://www.tensorflow.org/tutorials/generative/dcgan

# This tutorial demonstrates how to generate images of handwritten digits using a 
# Deep Convolutional Generative Adversarial Network (DCGAN). 
# The code is written using the Keras Sequential API with a tf.GradientTape training loop.

# Import TensorFlow and other libraries

from __future__ import absolute_import, division, print_function, unicode_literals
import tensorflow as tf

tf.__version__

import glob
import imageio
import matplotlib.pyplot as plt
import numpy as np
import os
import PIL
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras import optimizers
from tensorflow.keras import Model
import time

from IPython import display

# Load and prepare the dataset
# You will use the cifar10 dataset to train the generator and the discriminator. 
# The generator will generate handwritten digits resembling the MNIST data.

(train_images, train_labels), (_, _) = tf.keras.datasets.cifar10.load_data()

print("images shape ", train_images.shape)

train_images = train_images.reshape(train_images.shape[0], 32, 32, 3).astype('float32')
train_images = (train_images - 127.5) / 127.5 # Normalize the images to [-1, 1]

BUFFER_SIZE = 50000
BATCH_SIZE = 256

# Batch and shuffle the data
# train_dataset = tf.data.Dataset.from_tensor_slices(train_images).shuffle(BUFFER_SIZE).batch(BATCH_SIZE)
train_dataset = tf.data.Dataset.from_tensor_slices((train_images, train_labels)).shuffle(BUFFER_SIZE).batch(BATCH_SIZE)


# Create the models

#Both the generator and discriminator are defined using the Keras Sequential API.

# The Generator

# The generator uses tf.keras.layers.Conv2DTranspose (upsampling) layers to produce an 
# image from a seed (random noise). Start with a Dense layer that takes this seed as input, 
# then upsample several times until you reach the desired image size of 28x28x1. 
# Notice the tf.keras.layers.LeakyReLU activation for each layer, except the output 
# layer which uses tanh.

def make_generator_model(latent_dim, n_classes=10):
	# label input
	in_label = layers.Input(shape=(1,))
	# embedding for categorical input
	li = layers.Embedding(n_classes, 50)(in_label)
	# linear multiplication
	n_nodes = 8 * 8 * 3
	li = layers.Dense(n_nodes)(li)
	# reshape to additional channel
	li = layers.Reshape((8, 8, 3))(li)
    
	# image generator input
	in_lat = layers.Input(shape=(latent_dim,))
    
	# foundation for 8x8 image with 256 layers
	n_nodes = 256 * 8 * 8
	gen = layers.Dense(n_nodes, use_bias=False)(in_lat)
	gen = layers.BatchNormalization()(gen)    
	gen = layers.LeakyReLU()(gen)
	gen = layers.Reshape((8, 8, 256))(gen)
	
	print("gen shape", gen.shape)
	print("li shape", li.shape)
    
	# merge image gen and label input
	merge = layers.Concatenate()([gen, li])
    
	# upsample to 16x16
	gen = layers.Conv2DTranspose(128, (5,5), strides=(1,1), padding='same', use_bias=False)(merge)
	gen = layers.BatchNormalization()(gen)
	gen = layers.LeakyReLU()(gen)
    
	# upsample to 32x32
	gen = layers.Conv2DTranspose(64, (5, 5), strides=(2, 2), padding='same', use_bias=False)(gen)
	gen = layers.BatchNormalization()(gen)
	gen = layers.LeakyReLU()(gen)
    
	# output
	out_layer = layers.Conv2DTranspose(3, (5, 5), strides=(2, 2), padding='same', use_bias=False, activation='tanh')(gen)
	
	# define model
	model = Model([in_lat, in_label], out_layer)
	return model

# Use the (as yet untrained) generator to create an image.
    
generator = make_generator_model(200)

noise = tf.random.normal([1, 200])
label = np.random.randint(0, 10, 1)

print(label)

generated_image = generator([noise, label], training=False)

plt.imshow(generated_image[0, :, :, :] * 0.5 + 0.5)

# The Discriminator

# The discriminator is a CNN-based image classifier.

def make_discriminator_model(in_shape=(32,32,3), n_classes=10):
	# label input
	in_label = layers.Input(shape=(1,))
	# embedding for categorical input
	li = layers.Embedding(n_classes, 50)(in_label)
	# scale up to image dimensions with linear activation
	n_nodes = in_shape[0] * in_shape[1] * in_shape[2]
	li = layers.Dense(n_nodes)(li)
	# reshape to additional channel
	li = layers.Reshape((in_shape[0], in_shape[1], in_shape[2]))(li)
	
	# image input
	in_image = layers.Input(shape=in_shape)
	# concat label as a channel
	merge = layers.Concatenate()([in_image, li])
	
	# downsample
	fe = layers.Conv2D(64, (5, 5), strides=(2, 2), padding='same', input_shape=in_shape)(merge)
	fe = layers.LeakyReLU()(fe)
	fe = layers.Dropout(0.3)(fe)
	
	# downsample
	fe = layers.Conv2D(128, (5,5), strides=(2,2), padding='same')(fe)
	fe = layers.LeakyReLU()(fe)
	fe = layers.Dropout(0.3)(fe)
	
	# flatten feature maps
	fe = layers.Flatten()(fe)
	
	# output
	out_layer = layers.Dense(1)(fe)
	
	# define model
	model = Model([in_image, in_label], out_layer)

	return model

# Use the (as yet untrained) discriminator to classify the generated images as real or fake.
# The model will be trained to output positive values for real images, and negative 
# values for fake images
    
discriminator = make_discriminator_model()
decision = discriminator([generated_image, label])
print (decision)

# Define the loss and optimizers

# Define loss functions and optimizers for both models.

# This method returns a helper function to compute cross entropy loss
cross_entropy = tf.keras.losses.BinaryCrossentropy(from_logits=True)

# Discriminator loss

# This method quantifies how well the discriminator is able to distinguish real images 
# from fakes. It compares the discriminator's predictions on real images to an array of 1s, 
# and the discriminator's predictions on fake (generated) images to an array of 0s.

def discriminator_loss(real_output, fake_output):
    real_loss = cross_entropy(tf.ones_like(real_output), real_output)
    fake_loss = cross_entropy(tf.zeros_like(fake_output), fake_output)
    total_loss = real_loss + fake_loss
    return total_loss

# Generator loss

# The generator's loss quantifies how well it was able to trick the discriminator. 
# Intuitively, if the generator is performing well, the discriminator will classify the 
# fake images as real (or 1). Here, we will compare the discriminators decisions on the 
# generated images to an array of 1s.


def generator_loss(fake_output):
    return cross_entropy(tf.ones_like(fake_output), fake_output)

# The discriminator and the generator optimizers are different since we will train 
# two networks separately.
    
generator_optimizer = tf.keras.optimizers.Adam(1e-4)
discriminator_optimizer = tf.keras.optimizers.Adam(1e-4)

# Save checkpoints

# This notebook also demonstrates how to save and restore models, which can be helpful 
# in case a long running training task is interrupted.

checkpoint_dir = './training_checkpoints'
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt")
checkpoint = tf.train.Checkpoint(generator_optimizer=generator_optimizer,
                                 discriminator_optimizer=discriminator_optimizer,
                                 generator=generator,
                                 discriminator=discriminator)

# Define the training loop

EPOCHS = 2000
noise_dim = 200
num_examples_to_generate = 40

# We will reuse this seed overtime (so it's easier)
# to visualize progress in the animated GIF)
seed = tf.random.normal([num_examples_to_generate, noise_dim])
seed_labels = np.random.randint(0, 10, num_examples_to_generate)

for i in range(num_examples_to_generate):
	seed_labels[i] = i % 10

print(seed_labels)


# The training loop begins with generator receiving a random seed as input. 
# That seed is used to produce an image. The discriminator is then used to classify real 
# images (drawn from the training set) and fakes images (produced by the generator). 
# The loss is calculated for each of these models, and the gradients are used to 
# update the generator and discriminator.

# Notice the use of `tf.function`
# This annotation causes the function to be "compiled".
@tf.function
def train_step(images, labels):
	batch_size = images.shape[0]
	
	#print("batch_size", batch_size)
	
	noise = tf.random.normal([batch_size, noise_dim])
	#print("train_step noise", noise.shape)
	#print("train_step images", images.shape)
	#print("train_step labels", labels.shape)

	with tf.GradientTape() as gen_tape, tf.GradientTape() as disc_tape:
		generated_images = generator([noise, labels], training=True)
		real_output = discriminator([images, labels], training=True)
		fake_output = discriminator([generated_images, labels], training=True)
		
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

		for image_batch, label_batch in dataset:
			gen_loss, disc_loss = train_step(image_batch, label_batch)
			
		# Produce images for the GIF as we go
		display.clear_output(wait=True)
		generate_and_save_images(generator,epoch + 1,[seed, seed_labels])
		
		# Save the model every 15 epochs
		if (epoch + 1) % 15 == 0:
			checkpoint.save(file_prefix = checkpoint_prefix)
		
		print ('GenLoss {} DiscLoss {} Time {} for epoch {}'.format(gen_loss, disc_loss, time.time()-start, epoch + 1))
		
		# Generate after the final epoch
		display.clear_output(wait=True)
		generate_and_save_images(generator,epochs,[seed, seed_labels])
  
def generate_and_save_images(model, epoch, test_input):
	# Notice `training` is set to False.
	# This is so all layers run in inference mode (batchnorm).
	predictions = model(test_input, training=False)
	
	fig = plt.figure(figsize=(10,4))
	
	for i in range(predictions.shape[0]):
		plt.subplot(4, 10, i+1)
		plt.imshow(predictions[i, :, :, :] * 0.5 + 0.5)
		plt.axis('off')
		
	plt.savefig('image_at_epoch_{:04d}.png'.format(epoch))
	plt.show()
  
# Train the model

# Call the train() method defined above to train the generator and discriminator simultaneously. 
# Note, training GANs can be tricky. It's important that the generator and discriminator do not overpower each other 
# (e.g., that they train at a similar rate).

# At the beginning of the training, the generated images look like random noise. As training 
# progresses, the generated digits will look increasingly real. After about 50 epochs, they 
# resemble MNIST digits. This may take about one minute / epoch with the default settings on Colab.
  
train(train_dataset, EPOCHS)
  
  