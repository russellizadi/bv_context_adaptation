import datetime
import h5py
import numpy as np
import os
import time

import localmodule


# Define constants
data_dir = localmodule.get_data_dir()
dataset_name = localmodule.get_dataset_name()
models_dir = localmodule.get_models_dir()
sample_rate = localmodule.get_sample_rate()
args = ["unit01", "thrush", "00:09"] #                          DISABLE
#args = sys.argv[1:]                                            ENABLE
unit_str = args[0]
odf_str = args[1]
threshold_id_start = int(args[2][:2])
threshold_id_stop = int(args[2][-2:])
threshold_id_range = range(threshold_id_start, threshold_id_stop)


# Print header.
start_time = int(time.time())
print(str(datetime.datetime.now()) + " Start.")
print("Running Old Bird onset detection functions (Thrush and Tseep) on " +
    dataset_name + ", " + unit_str + ".")
print('h5py version: {:s}.'.format(h5py.__version__))
print('numpy version: {:s}'.format(np.__version__))
print("")


# Load onset detection function.
oldbird_name = "_".join([dataset_name, "oldbird"])
oldbird_dir = os.path.join(data_dir, oldbird_name)
odf_path = os.path.join(data_dir, unit_str + ".hdf5")
odf_file = h5py.File(odf_path, "r")
odf_dataset = odf_str + "_odf"
odf = odf_file[odf_dataset]
odf_length = len(odf)

# Define array of thresholds.
# TODO.
# up_thresholds
# down_thresholds


# Create directory for Old Bird in models_dir.
model_dir = os.path.join(models_dir, "Old Bird")
os.makedirs(model_dir, exist_ok=True)
out_unit_dir = os.path.join(model_dir, unit_str)
os.makedirs(out_unit_dir, exist_ok=True)
predictions_dir = os.path.join(out_unit_dir, "predictions")
os.makedirs(predictions_dir, exist_ok=True)


# Loop over thresholds in group.
for threshold_id in threshold_id_range:
    up_threshold = up_thresholds[threshold_id]
    down_threshold = down_thresholds[threshold_id]

    # Define CSV file for given threshold.
    # TODO.

    # Loop over timestamps.
    # TODO


# Print elapsed time.
print(str(datetime.datetime.now()) + " Finish.")
elapsed_time = time.time() - int(start_time)
elapsed_hours = int(elapsed_time / (60 * 60))
elapsed_minutes = int((elapsed_time % (60 * 60)) / 60)
elapsed_seconds = elapsed_time % 60.
elapsed_str = "{:>02}:{:>02}:{:>05.2f}".format(elapsed_hours,
                                               elapsed_minutes,
                                               elapsed_seconds)
print("Total elapsed time: " + elapsed_str + ".")
