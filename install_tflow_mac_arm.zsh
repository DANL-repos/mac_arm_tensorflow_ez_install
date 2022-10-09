#!/usr/bin/env zsh -i
# Invoking a new interactive zshell; loads necessary env vars

conda create -y --name tflow_arm python=3.8
conda activate tflow_arm
# make sure we are in the tflow_arm environment
# We don't want to install into the wrong env.
if [[ "$(basename $CONDA_PREFIX)" == "tflow_arm" ]]
then
   echo "Activated tflow_arm"
else
   echo "\nSomething went wrong.\ntflow_arm not activated\nexiting.\n"
   exit 0
fi

conda install -y -c apple tensorflow-deps
pip install tensorflow-macos
pip install tensorflow-metal
conda install -y jupyterlab numpy matplotlib

echo """Checking installation; this may take a few.
(Taking a while is a good sign.)

Devices available:"

# test for tf GPU detection in our new environment
quickcheck=$(cat << EOF
import tensorflow as tf
success=False
for device in tf.config.list_physical_devices():
    print(f' - {device}')
    if device.device_type == 'GPU':
    	success=True
if success is True:
    print("\nYay. Tensorflow can see the GPU! We should be good to go.\n")
else:
    print("\nDang. Tensorflow cannot see the GPU. Something went wrong.\n")
EOF
)

python -c $quickcheck

