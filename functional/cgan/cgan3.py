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

#from IPython import display

#Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--config', type=str, default ='./default-tatar.ini' , help='path to the config file')
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
    parser.error("dataset folder '%s' not found"%dataset)
    sys.exit() 

my_cqt = os.path.join(dataset, cqt_dataset)

if not os.path.exists(my_cqt):
    parser.error("npy folder '%s' not found. Run create_dataset.py first. "%my_cqt)
    sys.exit() 

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


#Model configs
image_shape = (bins_per_octave, num_octaves)
kernelsize = config['CGAN'].getint('kernelsize')
kernel_size = (kernelsize, kernelsize)
generator_filters = config['CGAN'].getint('generator_filters')
discriminator_filters = config['CGAN'].getint('discriminator_filters')
generator_activation = config['CGAN'].get('generator_activation')
latent_dim = config['CGAN'].getint('latent_dim')

#etc
example_duration = config['extra'].getint('example_duration')
example_smoothing = config['extra'].getint('example_smoothing')
num_examples = config['extra'].getint('num_examples')
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

# Load and prepare the dataset
print('creating the dataset...')
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

print('Total number of CQT frames: {}'.format(len(training_array)))
if buffer_size_dataset:
  train_buf = len(training_array)

#training_array = training_array.reshape((training_array.shape[0], bins_per_octave, num_octaves, 1))
train_dataset = tf.data.Dataset.from_tensor_slices(training_array)
train_dataset = train_dataset.shuffle(train_buf).batch(batch_size).prefetch(AUTOTUNE)


# Create the models

#Both the generator and discriminator are defined using the Keras Functional API.

# The Generator

def make_generator_model():
    in_lat = layers.Input(shape=(latent_dim,))
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
    out_img = layers.Reshape(target_shape=(n_bins,))(x)

    # define model
    model = Model(in_lat, out_img)
    return model

generator = make_generator_model()

generator.summary()
#tf.keras.utils.plot_model(generator, show_shapes=True, dpi=64)

noise = tf.random.normal([1, latent_dim])
generated_image = generator(noise, training=False)

#plt.imshow(generated_image[0, :, :, 0], cmap='gray')

# The Discriminator

def make_discriminator_model():
    in_img = layers.Input(shape=(n_bins,))
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
    model = Model(in_img, out_decision)
    return model

discriminator = make_discriminator_model()

discriminator.summary()
#tf.keras.utils.plot_model(discriminator, show_shapes=True, dpi=64)

decision = discriminator(generated_image)
#print (decision)

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

num_examples_to_generate = 16

# We will reuse this seed overtime (so it's easier)
# to visualize progress in the animated GIF)
seed = tf.random.normal([num_examples_to_generate, latent_dim])

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

def generate_and_save_images(model, epoch, test_input):
  # Notice `training` is set to False.
  # This is so all layers run in inference mode (batchnorm).
  predictions = model(test_input, training=False)
  predictions = tf.reshape(predictions, shape=(len(test_input), bins_per_octave, num_octaves, 1))
  fig = plt.figure(figsize=(image_shape[1]//4,image_shape[0]//4))

  for i in range(predictions.shape[0]):
      plt.subplot(4, 4, i+1)
      plt.imshow(predictions[i, :, :, 0] * 127.5 + 127.5, cmap='gray')
      plt.axis('off')

  plt.savefig(os.path.join(image_dir,'image_at_epoch_{:04d}.png'.format(epoch)))
  plt.close()
  #plt.show()
  
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
print("Generating examples...")
my_examples_folder = os.path.join(workdir, 'audio_examples')
for f in range(num_examples):

  num_frames = int(np.rint(example_duration * sample_rate))

  print('Generating latent vectors...')
  shape = [num_frames, latent_dim] # [frame, image, channel, component]
  all_latents = tf.random.normal(shape=shape,seed=None).numpy().astype(np.float32)
  all_latents = scipy.ndimage.gaussian_filter(all_latents, [smoothing_sec * sample_rate] + [0, 0], mode='wrap')
  all_latents /= np.sqrt(np.mean(np.square(all_latents)))

  cqts = generator(all_latents, training=False)
