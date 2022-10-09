# mac_arm_tensorflow_ez_install
---
## Install tensor flow on Apple Silicon (ARM) 
*It's pretty easy, but why not make it easier?*<br><br>
This is just a script that automates the installation outlined on [@sypino](https://twitter.com/svpino)'s excellent [twitter thread.](https://twitter.com/svpino/status/1578354467572838402)  Check that thread out; he also gives clear directions for installing conda, etc.

---
## Installation and Usage
---

### Installation:
This script assumes that you have a working [conda installation](https://docs.conda.io/en/main/miniconda.html) and are using zshell as your default shell (it has been the default for MacOs since circa 2019) installed on your system.  Download the repo's zip file somewhere on your system (e.g. ~/Downloads) and unzip.

### Usage:<br>
Open a terminal and cd to the folder where you saved the script. E.g.<br>
`> cd ~/Downloads/mac_arm_tensorflow_ez_install-main` <br>

Then run it from the terminal:<br>
`> zsh mac_arm_tensorflow_ez_install.zsh`

The script will create a new environment called torch_arm and just run through all of the steps to install pytorch in that environment. No questions or decisions. <br>

If all goes well you should see a bunch of text scroll by, and then see something like:
```bash
Checking installation; this may take a few.
(Taking a while is a good sign.)

Devices available:
 - PhysicalDevice(name='/physical_device:CPU:0', device_type='CPU')
 - PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')

Yay. Tensorflow can see the GPU! We should be good to go.
```


