# This shell script executes Slurm jobs for thresholding
# Justin Salamon's ICASSP 2017 predictions of convolutional
# neural network on BirdVox-70k full audio
# with PCEN input.
# Augmentation kind: all.
# Test unit: unit05.
# Trial ID: 2.

sbatch 034_aug-all_test-unit05_predict-unit05_trial-2.sbatch
sbatch 034_aug-all_test-unit05_predict-unit02_trial-2.sbatch
sbatch 034_aug-all_test-unit05_predict-unit03_trial-2.sbatch
