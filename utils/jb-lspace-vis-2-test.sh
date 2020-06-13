#!/bin/bash
#SBATCH --cpus-per-task=4   # maximum CPU cores per GPU request: 6 on Cedar, 16 on Graham.
#SBATCH --mem=32000M        # memory per node
#SBATCH --time=0-00:30      # time (DD-HH:MM)
#SBATCH --output=%N-%j.out  # %N for node name, %j for jobID
#SBATCH --mail-user=ktatar@sfu.ca
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --account=rrg-pasquier
 
module load python/3.7.4
source /home/$USER/pycpu/bin/activate
echo "pycpu activated..."
sleep 10
python /home/ktatar/scratch/latent-timbre-synthesis/utils/lspace_vis_tsne-2.py --config /home/ktatar/scratch/latent-timbre-synthesis/utils/lspace_vis_tsne.ini
