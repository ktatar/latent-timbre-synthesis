#!/bin/bash
#SBATCH --gres=gpu:1        # request GPU "generic resource"
#SBATCH --cpus-per-task=6   # maximum CPU cores per GPU request: 6 on Cedar, 16 on Graham.
#SBATCH --mem=12000M        # memory per node
#SBATCH --time=0-10:00      # time (DD-HH:MM)
#SBATCH --output=%N-%j.out  # %N for node name, %j for jobID
#SBATCH --mail-user=ktatar@sfu.ca
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-pasquier

module load nixpkgs/16.09  gcc/7.3.0  python/3.7.4 cuda/10.0.130 cudnn/7.6
source /home/$USER/tf2_gpu/bin/activate
sleep 5
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EBROOTCUDA/lib64:$EBROOTCUDNN/lib64

python generate_interpolations.py --dir  /home/ktatar/scratch/datasets/erokia/func-timbre-vae-cedar/run-013
