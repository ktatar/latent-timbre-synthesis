# Latent Timbre Synthesis

Latent Timbre Synthesis (LTS) is a deep learning audio synthesis architecture that learns from audio sample dataset.. 

## Latent Timbre Synthesis using Variational Auto-Encoders
We combine Auto-Encoder based architectures with inverse audio synthesis to generate a latent audio space for musical applications.

## Installation 

The training and the synthesis engines are working on Python. Currently, we have an app called interpolate_two which uses Max 8 for the user interface and interaction with the engine. 

### Python 

1- Conda 
Download and install Anaconda for Python 3.7 for your os:
https://www.anaconda.com/distribution/

- Create a new python 3.7 environment
Please open your terminal (Anaconda Command Prompt for Windows),

`conda create -n lts python=3.7`

- Activate your conda environment before continuing the following steps:
`conda activate lts`

2- Tensorflow
We will install tensorflow using conda. If you have an NVIDIA GPU, please follow the GPU guide below. For all other hardware, please follow the CPU option. The code is compatible with both GPU, and CPU only; however training would take too long on CPU. I strongly recommend using a GPU if you plan to train new models. 


- Open your terminal (Anaconda Command Prompt for Windows),

- Install tensorflow using conda:
    - with GPU:
    `conda install tensorflow-gpu=2.0.0`

    - only CPU:
    `conda install tensorflow=2.0.0`

3- Python Libraries

- Install librosa for audio feature extraction
`pip install librosa`


For using the interpolate_two app

- Install python-osc for osc communication
`pip install python-osc`

- Install sounddevice for Audio IO in python
`conda install -c conda-forge python-sounddevice`
    
    - If you get "Module not found" error after the  sounddevice installation:
        - First try to close and open your terminal, and then run it again.
        - If you still have the error, try this fix:
            
            `pip uninstall sounddevice`
            
            `pip install sounddevice`

4- Max 8 Libraries

- For the app interpolate_two, install AudioMix from Max 8 Package Manager. 

Enjoy...