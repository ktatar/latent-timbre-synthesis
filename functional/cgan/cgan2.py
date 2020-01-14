from __future__ import absolute_import, division, print_function, unicode_literals
import tensorflow as tf

import glob
import imageio
import matplotlib.pyplot as plt
import numpy as np
import os, sys, argparse, time
import configparser
import PIL
from tensorflow.keras import layers
from tensorflow.keras import optimizers
from tensorflow.keras import Model
import time

from IPython import display

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default_cgt.ini' , help='path to the config file')
args = parser.parse_args()

#Get configs
config_path = args.config
config = configparser.ConfigParser(allow_no_value=True)
if not os.path.exists(config_path):
    config.Error("config file '%s' not found"%config_path)
    sys.exit()
config.read(config_path)

# get values from config 
datapath = config['dataset'].get('datapath')
dataset_name = config['dataset'].get('cqt_dataset')
dataset_path = os.path.join(datapath, dataset_name)
os.makedirs(dataset_path,exist_ok=True)

image_shape = (48, 8)
filter_size = (5, 5)
BUFFER_SIZE = 60000
BATCH_SIZE = config['training'].getint('batch_size')
continue_training = config['training'].getboolean('continue_training')
LATENT_DIM = config['CGAN'].getint('latent_dim')
EPOCHS = config['training'].getint('epochs')
DATASET = config['dataset'].get('datapath')
DESCRIPTION  = config['extra'].get('description')

print("BATCH_SIZE", BATCH_SIZE)
print("LATENT_DIM", LATENT_DIM)
print("EPOCHS", EPOCHS)

#Create workspace
if not continue_training:
    run_id = 0
    while True:
        try:
            my_runs = os.path.join(DATASET, DESCRIPTION)
            workdir = os.path.join(my_runs, 'run-%03d' % (run_id)) 
            print(workdir)
            os.makedirs(workdir)
            break
        except OSError:
            if os.path.isdir(workdir):
                run_id = run_id + 1
                continue
            raise

    config['dataset']['workspace'] = workdir
else:
    workdir = config['dataset'].get('workspace')

# Load and prepare the dataset
print('creating the dataset...')
training_array = []
new_loop = True

for f in os.listdir(dataset_path): 
    if f.endswith('.npy'):
        print('adding-> %s' % f)
        new_array = np.load(os.path.join(dataset_path,f))
        if new_loop:
            training_array = new_array
            new_loop = False
        else:
            training_array = np.concatenate((training_array, new_array), axis=0)

print('Total number of CQT frames: {}'.format(len(training_array)))

for frame in training_array[2000:2010]:
    print(frame)


training_array = training_array.reshape((training_array.shape[0], 48, 8, 1))

print(training_array.shape)

train_dataset = tf.data.Dataset.from_tensor_slices(training_array)

print(train_dataset)

train_dataset = train_dataset.shuffle(BUFFER_SIZE).batch(BATCH_SIZE)


# Create the models

#Both the generator and discriminator are defined using the Keras Functional API.

# The Generator

def make_generator_model():
    in_lat = layers.Input(shape=(LATENT_DIM,))
    x = layers.Dense(image_shape[0] // 4 * image_shape[1]// 4 * 256, use_bias=False)(in_lat)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    x = layers.Reshape((image_shape[0] // 4, image_shape[1] // 4, 256))(x)
    x = layers.Conv2DTranspose(128, (5, 5), strides=(1, 1), padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    x = layers.Conv2DTranspose(64, (5, 5), strides=(2, 2), padding='same', use_bias=False)(x)
    x = layers.BatchNormalization()(x)
    x = layers.LeakyReLU()(x)
    out_img = layers.Conv2DTranspose(1, filter_size, strides=(2, 2), padding='same', use_bias=False, activation='tanh')(x)
    
    # define model
    model = Model(in_lat, out_img)
    return model

generator = make_generator_model()

generator.summary()
tf.keras.utils.plot_model(generator, show_shapes=True, dpi=64)

noise = tf.random.normal([1, LATENT_DIM])
generated_image = generator(noise, training=False)

plt.imshow(generated_image[0, :, :, 0], cmap='gray')

# The Discriminator

def make_discriminator_model():
    in_img = layers.Input(shape=(image_shape[0], image_shape[1], 1))
    x = layers.Conv2D(64, (5, 5), strides=(2, 2), padding='same')(in_img)
    x = layers.LeakyReLU()(x)
    x = layers.Dropout(0.3)(x)
    x = layers.Conv2D(128, (5, 5), strides=(2, 2), padding='same')(x)
    x = layers.LeakyReLU()(x)
    x = layers.Dropout(0.3)(x)
    x = layers.Flatten()(x)
    out_decision = layers.Dense(1)(x)
    
    # define model
    model = Model(in_img, out_decision)
    return model

discriminator = make_discriminator_model()

discriminator.summary()
tf.keras.utils.plot_model(discriminator, show_shapes=True, dpi=64)

decision = discriminator(generated_image)
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

# The generator's loss quantifies hoork well it was able to trick the discriminator. 
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

checkpoint_dir = os.path.join(workdir,'training_checkpoints')
os.makedirs(checkpoint_dir, exist_ok=True)
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt")
checkpoint = tf.train.Checkpoint(generator_optimizer=generator_optimizer,
                                 discriminator_optimizer=discriminator_optimizer,
                                 generator=generator,
                                 discriminator=discriminator)

# Define the training loop

num_examples_to_generate = 16

# We will reuse this seed overtime (so it's easier)
# to visualize progress in the animated GIF)
seed = tf.random.normal([num_examples_to_generate, LATENT_DIM])

# The training loop begins with generator receiving a random seed as input. 
# That seed is used to produce an image. The discriminator is then used to classify real 
# images (drawn from the training set) and fakes images (produced by the generator). 
# The loss is calculated for each of these models, and the gradients are used to 
# update the generator and discriminator.

# Notice the use of `tf.function`
# This annotation causes the function to be "compiled".
@tf.function
def train_step(images):
    noise = tf.random.normal([BATCH_SIZE, LATENT_DIM])

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
    display.clear_output(wait=True)
    generate_and_save_images(generator,
                             epoch + 1,
                             seed)

    # Save the model every 15 epochs
    if (epoch + 1) % 15 == 0:
      checkpoint.save(file_prefix = checkpoint_prefix)

    print ('epoch {} : gen_loss {:01.4f} and disc_loss {:01.4f} and time {}'.format(epoch + 1, gen_loss, disc_loss, time.time()-start))

  # Generate after the final epoch
  display.clear_output(wait=True)
  generate_and_save_images(generator,
                           epochs,
                           seed)

image_dir = os.path.join(workdir,"images") 
os.makedirs(image_dir, exist_ok=True)

def generate_and_save_images(model, epoch, test_input):
  # Notice `training` is set to False.
  # This is so all layers run in inference mode (batchnorm).
  predictions = model(test_input, training=False)

  fig = plt.figure(figsize=(image_shape[1]//4,image_shape[0]//4))

  for i in range(predictions.shape[0]):
      plt.subplot(4, 4, i+1)
      plt.imshow(predictions[i, :, :, 0] * 127.5 + 127.5, cmap='gray')
      plt.axis('off')

  plt.savefig(os.path.join(image_dir,'image_at_epoch_{:04d}.png'.format(epoch)))
  plt.show()
  
# Train the model

# Call the train() method defined above to train the generator and discriminator simultaneously. 
# Note, training GANs can be tricky. It's important that the generator and discriminator do not overpower each other 
# (e.g., that they train at a similar rate).

# At the beginning of the training, the generated images look like random noise. As training 
# progresses, the generated digits will look increasingly real. After about 50 epochs, they 
# resemble MNIST digits. This may take about one minute / epoch with the default settings on Colab.
  
train(train_dataset, EPOCHS)

print("Exiting...")
end_time = time.time()
config['extra']['end'] = time.asctime( time.localtime(end_time) )
time_elapsed = end_time - start_time
config['extra']['time_elapsed'] = str(time_elapsed)
with open(os.path.join(workdir,'config.ini'), 'w') as configfile:
  config.write(configfile)