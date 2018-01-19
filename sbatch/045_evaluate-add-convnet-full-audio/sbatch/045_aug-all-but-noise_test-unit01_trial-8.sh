# This shell script executes Slurm jobs for thresholding
# predictions of convolutional
# neural network with adaptive threshold on BirdVox-70k full audio
# with logmelspec input.
# Augmentation kind: all-but-noise.
# Test unit: unit01.
# Trial ID: 8.

sbatch 045_aug-all-but-noise_test-unit01_predict-unit01_trial-8.sbatch
sbatch 045_aug-all-but-noise_test-unit01_predict-unit07_trial-8.sbatch
sbatch 045_aug-all-but-noise_test-unit01_predict-unit10_trial-8.sbatch
