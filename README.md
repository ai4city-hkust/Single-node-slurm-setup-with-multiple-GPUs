# A Quick Guide for Beginners

## Setup your account and workspace
The AI4City lab has bought linux servers to be used in scientific research, mainly for the staff and PhD students. 

### Step 1. Acquire ssh account and passcode from admin
Ask admin to create an account for you.

Account creation and maintenance:
Juran, juranzhang at hkust-gz.edu.cn

### Step 2. Ssh
Ssh into the server by {your account}@10.120.17.95 and key in the initial password
```
ssh {your account}@10.120.17.95
```
Key in the initial password that admin shared with you.

### Step 3. (Optional) Reset password
Reset the password:
```
passwd {your account}
```

### Step 4. (Optional) Check status of the server
```
top
nvidia-smi
```

### Step 5. (Optional) GPU computing readiness
The server has cuda drivers installed, but for DL work you need to install your own virtual environments with the appropriate packages (as some codes require specific versions of the cuda and other libraries). This is assumed to be common knowledge and expected to be done by the user (aided by his/her thesis supervisor). For beginners, it is advised to stick to the common and 'ready' solutions, e.g. pytorch stable releases.

### Step 6. Move your work from your laptop to the server
Use scp
```
scp your_account@10.120.17.95:home/{your account}/foobar.txt /some/local/directory
```
Or install and use syncthing on your laptop
TODO: [install syncthing on server](https://github.com/ai4city-hkust/Single-node-slurm-setup-with-multiple-GPUs/issues/5)

### Step 7. (Optional) Install git on your laptop
This enables your to version your work and share with coworkers.

### Step 8. Run your code with Slurm

Slurm commands could be confusing at first. If you check [slurm documentation](https://slurm.schedmd.com/man_index.html) you could easily be overwhelmed as there are hundreds of commands + options. We go through one of the key commands and options that most people would need to complete their daily tasks.

#### Submit, Cancel and Check status of a job

In the repo, we've included a *simple_torch.py* script that does some simple GPU computing.
Usually, we can run `python3 simple_torch.py` to do the job.

However, to facilitate GPU resources better, we will need to submit the job through slurm.

TODO: prevent all non-slurm GPU usage. Issue https://github.com/ai4city-hkust/Single-node-slurm-setup-with-multiple-GPUs/issues/1

To run *simple_torch.py* with slurm, create a script.
In our sample, the script is named `gpu_tester.sh`

To submit the job to slurm
```
sbatch gpu_tester.sh
```

Notice a GPU is allocated with `nvidia-smi`

To check status of CPU, Mem, and GPU usage on a node
```
sinfo -o "%10c  %20m  %30G"
```

Script output would be under the same folder - eg,`slurm-36.out`

To check what's queued in slurm, run `squeue`

Run sbatch multiple times, you will see multiple GPUs in use.


To cancel a run, simply run `scancel {jobId}`

There is plenty of guides to more slurm commands, eg,https://svante.mit.edu/use_slurm.html


#### Troubleshooting commands
These are useful when `sinfo` does not work or respond.

`sinfo -R` shows debug information.

This command debugs the slurm controller.
```
sudo slurmctld -D
```
This command debugs the slurm client. Note in our scenario both client and the controller resides in the same node/server.
```
sudo slurmd -D
```

Sample output of `sinfo` when everything is up
```
(base) bld@bld:~$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1   idle bld
```

Sample output of `sinfo` when some tasks are running
```
(base) bld@bld:~$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug*       up   infinite      1    mix bld
```

This command helps you to restart the node when a node is drained (underresourced or else).
```
sudo scontrol update nodename=bld state=idle
```


