#!/bin/bash

#BATCH --job-name=051_aug-none_test-unit02_trial-7_predict-unit10
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=96:00:00
#SBATCH --mem=1GB
#SBATCH --output=../slurm/051_aug-none_test-unit02_trial-7_predict-unit10_%j.out

module purge

# The first argument is the kind of augmentation.
# The second argument is the name of the test unit.
# The third argument is name of trial.
# The fourth argument is the name of the prediction unit.
python ../../../src/051_predict-pcen-ntt-convnet-full-audio.py none unit02 trial-7 unit10