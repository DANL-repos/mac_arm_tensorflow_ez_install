# mac_arm_tensorflow_ez_install
==
## Install tensor flow on Apple Silicon (ARM) 
*It's pretty easy, but why not make it easier?*

==
## Installation and Usage
---

### Installation:
This script assumes that you have a working conda installation and zshell (default for newer MacOs versions) installed on your system.  Download the file somewhere on your system (e.g. ~/Downloads).

### Usage:
**Terminal:**<br>
Open a terminal and cd to the folder where you saved the script. E.g.<br>
`> cd ~/Downloads` <br>

Then run it from the terminal:<br>
`> zsh mac_arm_tensorflow_ez_install.zsh`

**Finder:**<br>
If you download as a zip file and unpack it, the file should show up in Finder as a "Unix Executable".  If so, you can just double-click it, or right-click and select Open With --> Terminal. <br>
A terminal window should pop up and run the script for you. 

==
### The whole script:
--
```bash
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
```
