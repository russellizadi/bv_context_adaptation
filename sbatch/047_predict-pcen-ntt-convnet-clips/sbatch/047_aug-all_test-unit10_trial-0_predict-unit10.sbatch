#!/bin/bash

#BATCH --job-name=047_aug-all_test-unit10_trial-0_predict-unit10
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:20:00
#SBATCH --mem=500MB
#SBATCH --output=../slurm/slurm_047_aug-all_test-unit10_trial-0_predict-unit10_%j.out

module purge

# The first argument is the kind of augmentation.
# The second argument is the name of the test unit.
# The third argument is name of trial.
# The fourth argument is the name of the prediction unit.
python ../../../src/047_predict-pcen-ntt-convnet-clips.py all unit10 trial-0 unit10