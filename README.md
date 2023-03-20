# IN-ROME dhSegment

This is the dhSegment demo notebook adapted to be run on our HPC-cluster.

##Quick how to install

1. Copy all git from github when you are logged in HPC1:
    wget  https://github.com/rockmi/IN-ROME_dhSegment/archive/refs/heads/main.zip #Or right-click on Download ZIP & copy link to the github repository ZIP file

2. To unzip the file, run the following:
    unzip <path to zip file>

3. Create conda environment from the dh_segment_torch.yml file in the cloned repository:
    conda env create -f dh_segment_torch.yml #We have already done this step last week

4. Open the run_jupyter_slurm.sh bash file for the orchestrated submission of the job via Slurm with nano:
    nano <path to bash file>

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

5. Launch Jupyter Notebook with the following command:
    sbatch --nodelist=s3ls2001 --gres=gpu:1 --cpus-per-task=4 run_jupyterlab_slurm.sh
    # --nodelist= Add the server name of the node that you have entered in the bash file, (e.g., HPC1)