# This shell script executes Slurm jobs for running predictions
# with adaptive threshold convolutional neural network
# on BirdVox-70k, full audio.
# Trial ID: 6.
# Augmentation kind: all-but-noise.

sbatch 044_aug-all-but-noise_test-unit01_trial-6_predict-unit07.sbatch
sbatch 044_aug-all-but-noise_test-unit01_trial-6_predict-unit10.sbatch
sbatch 044_aug-all-but-noise_test-unit01_trial-6_predict-unit01.sbatch

sbatch 044_aug-all-but-noise_test-unit02_trial-6_predict-unit10.sbatch
sbatch 044_aug-all-but-noise_test-unit02_trial-6_predict-unit01.sbatch
sbatch 044_aug-all-but-noise_test-unit02_trial-6_predict-unit02.sbatch

sbatch 044_aug-all-but-noise_test-unit03_trial-6_predict-unit01.sbatch
sbatch 044_aug-all-but-noise_test-unit03_trial-6_predict-unit02.sbatch
sbatch 044_aug-all-but-noise_test-unit03_trial-6_predict-unit03.sbatch

sbatch 044_aug-all-but-noise_test-unit05_trial-6_predict-unit02.sbatch
sbatch 044_aug-all-but-noise_test-unit05_trial-6_predict-unit03.sbatch
sbatch 044_aug-all-but-noise_test-unit05_trial-6_predict-unit05.sbatch

sbatch 044_aug-all-but-noise_test-unit07_trial-6_predict-unit03.sbatch
sbatch 044_aug-all-but-noise_test-unit07_trial-6_predict-unit05.sbatch
sbatch 044_aug-all-but-noise_test-unit07_trial-6_predict-unit07.sbatch

sbatch 044_aug-all-but-noise_test-unit10_trial-6_predict-unit05.sbatch
sbatch 044_aug-all-but-noise_test-unit10_trial-6_predict-unit07.sbatch
sbatch 044_aug-all-but-noise_test-unit10_trial-6_predict-unit10.sbatch

