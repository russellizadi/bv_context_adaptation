# This shell script executes Slurm jobs for thresholding
# Justin Salamon's ICASSP 2017 predictions of convolutional
# neural network on BirdVox-70k full audio
# with PCEN input.
# Augmentation kind: none.
# Test unit: unit10.
# Trial ID: 8.

sbatch 034_aug-none_test-unit10_predict-unit10_trial-8.sbatch
sbatch 034_aug-none_test-unit10_predict-unit05_trial-8.sbatch
sbatch 034_aug-none_test-unit10_predict-unit07_trial-8.sbatch
