# This shell script executes Slurm jobs for training
# Justin Salamon's ICASSP 2017 convolutional neural network
# on BirdVox-70k with PCEN input instead of
# log-mel-spectrogram (logmelspec) input.
# Trial ID: 9.
# Augmentation kind: none.

sbatch 030_aug-none_unit01_trial-9.sbatch
sbatch 030_aug-none_unit02_trial-9.sbatch
sbatch 030_aug-none_unit03_trial-9.sbatch
sbatch 030_aug-none_unit05_trial-9.sbatch
sbatch 030_aug-none_unit07_trial-9.sbatch
sbatch 030_aug-none_unit10_trial-9.sbatch
