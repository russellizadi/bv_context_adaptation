#!/bin/bash

#BATCH --job-name=045_aug-all-but-noise_test-unit07_predict-unit03_trial-0
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=1GB
#SBATCH --output=../slurm/slurm_045_aug-all-but-noise_test-unit07_predict-unit03_trial-0_%j.out

module purge

# The first argument is the kind of data augmentation.
# The second argument is the test unit.
# The third argument is the prediction unit.
# The fourth argument is the trial index.
python ../../../src/045_evaluate-add-convnet-full-audio.py all-but-noise unit07 unit03 0