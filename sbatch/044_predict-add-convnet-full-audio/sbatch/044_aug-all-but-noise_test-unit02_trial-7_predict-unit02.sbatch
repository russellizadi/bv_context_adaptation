#!/bin/bash

#BATCH --job-name=044_aug-all-but-noise_test-unit02_trial-7_predict-unit02
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=96:00:00
#SBATCH --mem=1GB
#SBATCH --output=../slurm/044_aug-all-but-noise_test-unit02_trial-7_predict-unit02_%j.out

module purge

# The first argument is the kind of augmentation.
# The second argument is the name of the test unit.
# The third argument is name of trial.
# The fourth argument is the name of the prediction unit.
python ../../../src/044_predict-add-convnet-full-audio.py all-but-noise unit02 trial-7 unit02