import datetime
import jams
import librosa
import muda
import glob
import os
import sys
import time

import localmodule


# Define constants.
data_dir = localmodule.get_data_dir()
units = localmodule.get_units()
args = sys.argv[1:]
unit = int(args[0])
aug_str = args[1]
instance_str = str(int(args[2]))


# Print header.
start_time = int(time.time())
print(str(datetime.datetime.now()) + " Start")
print("Augmenting BirdVox-70k clips for unit " + str(unit).zfill(2))
print("with augmentation " + aug_str + " and instance " + instance_str)
print("jams version: {:s}'.format(jams.__version__)")
print("librosa version: {:s}'.format(librosa.__version__)")
print("muda version: {:s}'.format(muda.__version__)")
print("numpy version: {:s}'.format(numpy.__version__)")
print("")


# Create directory for augmented clips.
clips_dir = os.path.join(data_dir, "BirdVox-70k")
if not os.path.exists(clips_dir):
    os.makedirs(clips_dir)
original_clips_dir = os.path.join(clips_dir, "original")
aug_clips_dir = os.path.join(clips_dir, aug_str)
if not os.path.exists(aug_clips_dir):
    os.makedirs(aug_clips_dir)


# Create directory corresponding to the recording unit.
unit_str = "unit" + str(unit).zfill(2)
in_unit_dir = os.path.join(original_clips_dir, unit_str)
out_unit_dir = os.path.join(aug_clips_dir, unit_str)
if not os.path.exists(out_unit_dir):
    os.makedirs(out_unit_dir)


# Define deformers.
if aug_str[:5] == "noise":
    # Background noise deformers.
    noise_unit = int(aug_str[10:])

    # For each recording unit, we create a deformer which adds a negative
    # example (i.e. containing no flight call) to the current clip, weighted
    # by a randomized amplitude factor ranging between 0.1 and 0.5.
    # This does not change the label because
    # negative + negative = negative
    # and
    # positive + negative = positive.
    noise_unit_str = str(noise_unit).zfill(2)
    noise_unit_dir = os.path.join(original_clips_dir, unit_str)

    # This regular expression selects only negative, non-augmented examples
    # for background noise.
    regexp = "*_0_original.wav"
    names = sorted(glob.glob(os.path.join(noise_unit_dir, regexp)))
    noise_paths = [os.path.join(noise_unit_dir, name) for name in names]
    deformer = muda.deformers.BackgroundNoise(
        n_samples=1, files=noise_paths, weight_min=0.1, weight_max=0.5)
elif aug_str == "pitch":
    # Pitch shift deformer
    # For every clip to be augmented, we apply a pitch shift whose interval
    # is sampled from a normal distribution with null mean and unit variance,
    # as measured in semitones according to the 12-tone equal temperament.
    deformer = muda.deformers.RandomPitchShift(
        n_samples=1, mean=0.0, sigma=1.0)
elif aug_str == "stretch":
    # Time stretching deformer
    # For every clip to be augmented, we apply a time stretching whose factor
    # are sampled from a log-normal distribution with mu=0.0 and sigma=1.0.
    deformer = muda.deformers.RandomTimeStretch(
        n_samples=1, location=0.0, scale=0.1)


# Extract WAV and JAMS files corresponding to recording unit.
wav_paths = sorted(glob.glob(os.path.join(in_unit_dir, "*.wav")))
jam_paths = sorted(glob.glob(os.path.join(in_unit_dir, "*.jams")))


# Loop over examples.
for (wav_path, jam_path) in zip(wav_paths, jam_paths):
    # Load WAV and JAMS files into muda object.
    jam_original = muda.load_jam_audio(ja_path, wav_path)

    # Apply data augmentation.
    jam_transformer = transformer.transform(jam_original)

    # Get jam from jam iterator. The iterator has only one element.
    jam = next(jam_transformer)

    # Split name of WAV path to remove the "_original.wav" suffix
    original_wav_name = os.path.split(wav_path)[-1]
    original_wav_split = original_wav_name.split("_")
    suffix = "-".join(aug_str, instance_str)

    # Generate path of augmented WAV file
    wav_suffix = suffix + ".wav"
    augmented_wav_split = original_wav_split[-1] + [wav_suffix]
    augmented_wav_name = "_".join(augmented_wav_split)
    augmented_wav_path = os.path.join(out_unit_dir, augmented_wav_name)

    # Generate path of augmented JAMS file
    jam_suffix = suffix + ".jam"
    augmented_jam_split = original_wav_split[-1] + [jam_suffix]
    augmented_jam_name = "_".join(augmented_jam_split)
    augmented_jam_path = os.path.join(out_unit_dir, augmented_jam_name)

    # Export augmented audio and metadata
    muda.save(augmented_wav_path, augmented_jam_path, jam)


# Print elapsed time.
print(str(datetime.datetime.now()) + " Finish")
elapsed_time = time.time() - int(start_time)
elapsed_hours = int(elapsed_time / (60 * 60))
elapsed_minutes = int((elapsed_time % (60 * 60)) / 60)
elapsed_seconds = elapsed_time % 60.
elapsed_str = "{:>02}:{:>02}:{:>05.2f}".format(elapsed_hours,
                                               elapsed_minutes,
                                               elapsed_seconds)
print("Total elapsed time: " + elapsed_str)
