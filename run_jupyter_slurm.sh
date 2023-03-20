#!/bin/bash
#
# SLURM Parameters
# ------------------------------------------------------------------------
# - Job Name (e.g. displayed in sinfo, squeue)
#SBATCH --job-name=JupyterLab
# - How many instances of this script should run?
#SBATCH --ntasks=1
# - Where to direct program output to (output of pathon scripts, jupyter, etc.)?
#SBATCH --output=slurm.jupyterlab.out
#SBATCH --error=slurm.jupyterlab.err

source /opt/anaconda3/etc/profile.d/conda.sh

module load use.storage
module load anaconda3

conda activate dh_segment_torch #Activate previously created dh-Segment environment

# start jupyter
jupyter notebook --port 20286 --ip 10.103.251.100 --no-browser --notebook-dir=~/storage/mynotebooks/
# --notebook-dir= Add the correct path to the directory where your notebook is stored
# --ip Add the IP of the node that you want the notebook to be executed (e.g., HPC1)