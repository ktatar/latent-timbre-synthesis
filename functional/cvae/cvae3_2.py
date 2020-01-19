from __future__ import absolute_import, division, print_function, unicode_literals

import tensorflow as tf
from tensorflow.keras import layers
from scipy import stats

import random
import numpy as np
import os, sys, argparse, time
import matplotlib.pyplot as plt
import configparser
import random
import json
import pathlib

from IPython import display

AUTOTUNE = tf.data.experimental.AUTOTUNE

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default_celeba.ini' , help='path to the config file')
args = parser.parse_args()

##Get configs
config_path = args.config
config = configparser.ConfigParser(allow_no_value=True)
try: 
  config.read(config_path)
except FileNotFoundError:
  print('Config File Not Found at {}'.format(config_path))
  sys.exit()

# dataset and workspace settings
datapath = config['dataset'].get('datapath')
dataset_name = config['dataset'].get('cqt_dataset')
dataset_path = os.path.join(datapath, dataset_name)
os.makedirs(dataset_path,exist_ok=True)
workdir = config['dataset'].get('workspace')

#Training configs
epochs = config['training'].getint('epochs')
learning_rate = config['training'].getfloat('learning_rate')
batch_size = config['training'].getint('batch_size')
buffer_size = config['training'].getint('buffer_size')
ckpt_epochs = config['training'].getint('checkpoint_epochs')

# Model configs
latent_dim = config['VAE'].getint('latent_dim')
kernel_size = config['VAE'].getint('kernel_size')
dense_units = config['VAE'].getint('n_units')
kl_beta = config['VAE'].getfloat('kl_beta')

# Load and prepare the dataset

#data_dir = "C:/Users/dbisig/.keras/datasets/celeba"
data_dir = "C:/Users/dbisig/.keras/datasets/celeba2000"
data_dir = pathlib.Path(data_dir)

train_filenames_list = tf.data.Dataset.list_files(str(data_dir/'train/*'))
#train_filenames_list = tf.data.Dataset.list_files(str(data_dir/'train60000/*'))
test_filenames_list = tf.data.Dataset.list_files(str(data_dir/'test/*'))

IMG_WIDTH = 128
IMG_HEIGHT = 128

def decode_img(img):
  # convert the compressed string to a 3D uint8 tensor
  img = tf.image.decode_jpeg(img, channels=3)
  # resize the image to the desired size.
  return tf.image.resize(img, [IMG_WIDTH, IMG_HEIGHT])

def process_path(file_path):
  img = tf.io.read_file(file_path)
  img = decode_img(img)
  return img

train_images = train_filenames_list.map(process_path, num_parallel_calls=AUTOTUNE)
test_images = test_filenames_list.map(process_path, num_parallel_calls=AUTOTUNE)

# normalizing the images to [0, 1]
def normalize(image):
  #image = tf.cast(image, tf.float32)
  image = (image / 255.0)
  return image

def random_crop(image):
  cropped_image = tf.image.random_crop(
      image, size=[IMG_HEIGHT, IMG_WIDTH, 3])

  return cropped_image

def random_jitter(image):
  # resizing to 286 x 286 x 3
  image = tf.image.resize(image, [IMG_WIDTH + 30, IMG_HEIGHT + 30],
                          method=tf.image.ResizeMethod.NEAREST_NEIGHBOR)

  # randomly cropping to 256 x 256 x 3
  image = random_crop(image)

  # random mirroring
  image = tf.image.random_flip_left_right(image)

  return image

def preprocess_image_train(image):
    image = random_jitter(image)
    image = normalize(image)
    return image

def preprocess_image_test(image):
  image = normalize(image)
  return image

train_images = train_images.map(
    preprocess_image_train, num_parallel_calls=AUTOTUNE).cache().shuffle(
    buffer_size).batch(batch_size)

test_images = test_images.map(
    preprocess_image_test, num_parallel_calls=AUTOTUNE).cache().shuffle(
    buffer_size).batch(batch_size)

sample_train_imae = next(iter(train_images))
sample_test_image = next(iter(test_images))

plt.subplot(121)
plt.title('train image')
plt.imshow(sample_train_imae[0])

plt.subplot(122)
plt.title('test image')
plt.imshow(sample_test_image[0])


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
input_img = layers.Input(shape=(IMG_WIDTH, IMG_HEIGHT, 3))
x = layers.Conv2D(32, kernel_size, padding='same', activation='relu', strides=(2, 2))(input_img)
x = layers.Conv2D(64, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2D(128, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2D(256, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
#x = layers.Conv2D(64, 3, padding='same', activation='relu')(x)
# need to know the shape of the network here for the decoder
shape_before_flattening = tf.keras.backend.int_shape(x)

print(shape_before_flattening)

x = layers.Flatten()(x)
# Two outputs, latent mean and (log)variance
z_mean = layers.Dense(latent_dim)(x)
z_log_sigma = layers.Dense(latent_dim)(x)
z = Sampling()((z_mean, z_log_sigma))

encoder = tf.keras.Model(inputs=input_img, outputs=z, name='encoder')
encoder.summary()
tf.keras.utils.plot_model(encoder, show_shapes=True, dpi=64)

# Define decoder model.
input_latent = tf.keras.Input(shape=(latent_dim), name='z_sampling')
# Expand
x = layers.Dense(np.prod(shape_before_flattening[1:]), activation='relu')(input_latent)
# reshape
x = layers.Reshape(shape_before_flattening[1:])(x)
# use Conv2DTranspose to reverse the conv layers from the encoder
x = layers.Conv2DTranspose(128, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2DTranspose(64, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
x = layers.Conv2DTranspose(32, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)
output_img = layers.Conv2DTranspose(3, kernel_size, padding='same', activation='relu', strides=(2, 2))(x)

decoder = tf.keras.Model(input_latent, output_img, name='decoder')
decoder.summary()
tf.keras.utils.plot_model(decoder, show_shapes=True, dpi=64)

decoder_output = decoder(z)


# Define VAE model.
vae = tf.keras.Model(input_img, [decoder_output, z_mean, z_log_sigma], name='vae')
vae.summary()
tf.keras.utils.plot_model(vae, show_shapes=True, dpi=64)


def vae_loss(input_img, output_img, z_mean, z_log_sigma):
    # Reconstruction loss
    #rec_loss = tf.reduce_mean((input_img-output_img)**2)
    
    flat_x = tf.keras.backend.flatten(input_img)
    flat_z = tf.keras.backend.flatten(output_img)
    rec_loss = tf.reduce_mean((flat_x-flat_z)**2)
    #rec_loss = cross_entropy(flat_x, flat_z)
    # KL divergence
    kl_loss = -kl_beta * tf.keras.backend.mean(1 + z_log_sigma - tf.keras.backend.square(z_mean) - tf.keras.backend.exp(z_log_sigma), axis=-1)
    return tf.keras.backend.mean(rec_loss + kl_loss)

#vae.add_loss(vae_loss)

optimizer = tf.keras.optimizers.Adam(learning_rate)

# Save checkpoints

# This notebook also demonstrates how to save and restore models, which can be helpful 
# in case a long running training task is interrupted.

checkpoint_dir = os.path.join(workdir,'training_checkpoints')
os.makedirs(checkpoint_dir, exist_ok=True)
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt")
checkpoint = tf.train.Checkpoint(optimizer=optimizer,
                                 vae=vae)

checkpoint_manager = tf.train.CheckpointManager(checkpoint, checkpoint_dir, max_to_keep=5)

# if a checkpoint exists, restore the latest checkpoint.
if checkpoint_manager.latest_checkpoint:
  checkpoint.restore(checkpoint_manager.latest_checkpoint)
  print ('Latest checkpoint restored!!')

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

@tf.function
def test_step(input_images):
    with tf.GradientTape() as tape:
      output_images, z_means, z_log_sigmas = vae(input_images, training=False)

      loss = vae_loss(input_images, output_images, z_means, z_log_sigmas) 

    gradients_of_vae = tape.gradient(loss, vae.trainable_variables)

    optimizer.apply_gradients(zip(gradients_of_vae, vae.trainable_variables))
    
    return loss

def train(train_dataset, test_dataset, epochs):
  for epoch in range(epochs):
    start = time.time()

    for image_batch in train_dataset:
        train_loss = train_step(image_batch)
        
    for image_batch in test_dataset:
        test_loss = train_step(image_batch)

    # Save the model every ckpt_epochs epochs
    if (epoch + 1) % ckpt_epochs == 0:
      checkpoint.save(file_prefix = checkpoint_prefix)
      
      # Produce images for the GIF as we go
      display.clear_output(wait=True)
      #generate_and_save_images(vae, epoch + 1, test_dataset)
      generate_and_save_latent_interpolation(epoch)

    print ('epoch {} : train loss {:01.4f} test loss {:01.4f} time {}'.format(epoch + 1, train_loss, test_loss, time.time()-start))


  # Generate after the final epoch
  display.clear_output(wait=True)
  #generate_and_save_images(vae, epochs, test_dataset)
  generate_and_save_latent_interpolation(epoch)
  
image_dir = os.path.join(workdir,"images") 
os.makedirs(image_dir, exist_ok=True)

def generate_and_save_images(model, epoch, test_dataset):
    
    test_images = next(iter(test_dataset))
    test_images = test_images[:num_examples_to_generate]
    predictions, _, _ = model(test_images, training=False)
    predictions = np.array(predictions)
    
    fig = plt.figure(figsize=(4,4))
    
    for i in range(num_examples_to_generate):
        plt.subplot(4, 4, i+1)
        plt.imshow(predictions[i, :, :, :])
        plt.axis('off')
    
    plt.savefig(os.path.join(image_dir,'image_at_epoch_{:04d}.png'.format(epoch)))
    #plt.close()
    plt.show()
    
    
# latent space vector interpolation
latent_space_samplecount = 10

#sample_train_imae = next(iter(train_images))
interpolation_images = sample_train_imae[2:6]

fig = plt.figure(figsize=(2,2), dpi = 300)
plt.subplot(2, 2, 1)
plt.imshow(interpolation_images[0])
plt.axis('off')
plt.subplot(2, 2, 2)
plt.imshow(interpolation_images[1])
plt.axis('off')
plt.subplot(2, 2, 3)
plt.imshow(interpolation_images[2])
plt.axis('off')
plt.subplot(2, 2, 4)
plt.imshow(interpolation_images[3])
plt.axis('off')
plt.savefig(os.path.join(image_dir,'orig_target_images.png'))
plt.show()

def generate_and_save_latent_interpolation(epoch):
    latent_interpolation_targets = encoder(interpolation_images)
    latent_interpolation_targets = np.array(latent_interpolation_targets)
    latent_interpolation_targets = np.reshape(latent_interpolation_targets, (2, 2, latent_dim))

    predictions, _, _ = vae(interpolation_images, training=False)
    predictions = np.array(predictions)

    fig = plt.figure(figsize=(2,2), dpi = 300)
    plt.subplot(221)
    plt.imshow(predictions[0,:,:,:])
    plt.axis('off')
    plt.subplot(222)
    plt.imshow(predictions[1,:,:,:])
    plt.axis('off')
    plt.subplot(223)
    plt.imshow(predictions[2,:,:,:])
    plt.axis('off')
    plt.subplot(224)
    plt.imshow(predictions[3,:,:,:])
    plt.axis('off')
    plt.savefig(os.path.join(image_dir,'target_images_at_epoch_{:04d}.png'.format(epoch)))
    plt.show()
    
    latent_sampling_grid = np.empty((latent_space_samplecount, latent_space_samplecount, latent_dim))

    fig = plt.figure(figsize=(latent_space_samplecount,latent_space_samplecount), dpi = 300)

    for gy in range(latent_space_samplecount):
    
        lsy = 1.0 / (latent_space_samplecount - 1) * gy
    
        for gx in range(latent_space_samplecount):
        
            lsx = 1.0 / (latent_space_samplecount - 1) * gx
        
            lt00 = latent_interpolation_targets[0][0]
            lt10 = latent_interpolation_targets[1][0]
            lt01 = latent_interpolation_targets[0][1]
            lt11 = latent_interpolation_targets[1][1]

            ltx0 =  lt00 + (lt10 - lt00) * lsx
            ltx1 =  lt01 + (lt11 - lt01) * lsx
            lt = ltx0 + (ltx1 - ltx0) * lsy
                 
            lt = np.reshape(lt, (1, latent_dim))
            prediction = decoder(lt)
                
            plt.subplot(latent_space_samplecount, latent_space_samplecount, gy * latent_space_samplecount + gx + 1)
            plt.imshow(prediction[0, :, :, :])
            plt.axis('off')

    plt.savefig(os.path.join(image_dir,'target_interpolation_at_epoch_{:04d}.png'.format(epoch)))
    plt.show()
    
    

train(train_images, test_images, epochs)

# show vae output for single train and test image

sample_train_image = next(iter(train_images))
sample_test_image = next(iter(test_images))

generate_and_save_images(vae, 11, test_images)

print(sample_train_image.shape)
print(sample_test_image.shape)

plt.subplot(121)
plt.title('train image')
plt.imshow(sample_train_imae[0])

plt.subplot(122)
plt.title('test image')
plt.imshow(sample_test_image[0])


sample_train_image = sample_train_imae[:1]
vae_train_output, _, _ = vae(sample_train_image, training=False)
vae_train_output = np.array(vae_train_output)
    
sample_test_image = sample_test_image[:1]
vae_test_output, _, _ = vae(sample_test_image, training=False)
vae_test_output = np.array(vae_test_output)

plt.subplot(121)
plt.title('vae train image')
plt.imshow(vae_train_output[0])

plt.subplot(122)
plt.title('vae test image')
plt.imshow(vae_test_output[0])


# show decoder output for single latent space vector
xy = np.random.uniform(low=-1.0, high=1.0, size=latent_dim)
xy = np.reshape(xy, (1, latent_dim))
decoder_output = decoder(xy)
decoder_output = np.array(decoder_output)
plt.imshow(decoder_output[0, :, :, :])


# random samplsampling of latent space
latent_space_samplecount = 16
xy = np.random.uniform(low=-1.0, high=1.0, size=latent_space_samplecount * latent_space_samplecount * latent_dim)
xy = np.reshape(xy, (latent_space_samplecount * latent_space_samplecount, latent_dim))



# grid sampling of latent space
latent_space_samplecount = 20
x = np.linspace(-1.0, 1.0, latent_space_samplecount)
y = np.linspace(-1.0, 1.0, latent_space_samplecount)
xy = np.zeros((latent_space_samplecount, latent_space_samplecount, 2))

for j, j_y in np.ndenumerate(y):
    for i, i_x in np.ndenumerate(x):
        xy[i][j][0] = i_x
        xy[i][j][1] = j_y

xy = np.reshape(xy, (latent_space_samplecount * latent_space_samplecount, 2))



latent_grid = tf.convert_to_tensor(xy, dtype=tf.float32)
decoder_output = decoder(latent_grid)
decoder_output = np.array(decoder_output)

fig = plt.figure(figsize=(latent_space_samplecount, latent_space_samplecount), dpi = 300)
for i in range(xy.shape[0]):
    plt.subplot(latent_space_samplecount, latent_space_samplecount, i+1)
    plt.imshow(decoder_output[i, :, :, :])
    plt.axis('off')
plt.show()



# latent space vector interpolation
latent_space_samplecount = 10

#sample_train_imae = next(iter(train_images))
interpolation_images = sample_train_imae[:4]
latent_interpolation_targets = encoder(interpolation_images)
latent_interpolation_targets = np.array(latent_interpolation_targets)
latent_interpolation_targets = np.reshape(latent_interpolation_targets, (2, 2, latent_dim))

plt.subplot(221)
plt.imshow(interpolation_images[0])
plt.subplot(222)
plt.imshow(interpolation_images[1])
plt.subplot(223)
plt.imshow(interpolation_images[2])
plt.subplot(224)
plt.imshow(interpolation_images[3])

predictions, _, _ = vae(interpolation_images, training=False)
predictions = np.array(predictions)

plt.subplot(221)
plt.imshow(predictions[0,:,:,:])
plt.subplot(222)
plt.imshow(predictions[1,:,:,:])
plt.subplot(223)
plt.imshow(predictions[2,:,:,:])
plt.subplot(224)
plt.imshow(predictions[3,:,:,:])

latent_sampling_grid = np.empty((latent_space_samplecount, latent_space_samplecount, latent_dim))

fig = plt.figure(figsize=(latent_space_samplecount,latent_space_samplecount), dpi = 300)

for gy in range(latent_space_samplecount):
    
    lsy = 1.0 / (latent_space_samplecount - 1) * gy
    
    for gx in range(latent_space_samplecount):
        
        lsx = 1.0 / (latent_space_samplecount - 1) * gx
        
        lt00 = latent_interpolation_targets[0][0]
        lt10 = latent_interpolation_targets[1][0]
        lt01 = latent_interpolation_targets[0][1]
        lt11 = latent_interpolation_targets[1][1]

        ltx0 =  lt00 + (lt10 - lt00) * lsx
        ltx1 =  lt01 + (lt11 - lt01) * lsx
        lt = ltx0 + (ltx1 - ltx0) * lsy
                 
        lt = np.reshape(lt, (1, latent_dim))
        prediction = decoder(lt)
                
        plt.subplot(latent_space_samplecount, latent_space_samplecount, gy * latent_space_samplecount + gx + 1)
        plt.imshow(prediction[0, :, :, :])
        plt.axis('off')

plt.show()