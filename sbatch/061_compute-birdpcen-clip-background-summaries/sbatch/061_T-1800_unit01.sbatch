#!/bin/bash

#BATCH --job-name=061_T-1800_unit01
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=96:00:00
#SBATCH --mem=8GB
#SBATCH --output=../slurm/slurm_061_T-1800_unit01_%j.out

module purge

# The first argument is the name of the recording unit.
# The second argument is the duration of background.
python ../../../src/061_compute-birdpcen-clip-background-summaries.py 1800 unit01