#!/bin/bash

#BATCH --job-name=020_noise-unit01_2_unit01
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --mem=1GB
#SBATCH --output=../slurm/slurm_020_noise-unit01_2_unit01_%j.out

module purge

# The first argument is the name of the augmentation.
# The second argument is the instance ID of the augmentation.
# The third argument is the name of the recording unit.
python ../../../src/020_compute-skm-logmelspec.py noise-unit01 2 unit01