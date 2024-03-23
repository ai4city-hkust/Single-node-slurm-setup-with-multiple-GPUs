# A Quick Slurm Guide for Beginners

## Introduction
Slurm commands could be confusing at first. If you check [slurm documentation](https://slurm.schedmd.com/man_index.html) one could easily be overwhelmed as there are hundreds of commands + options. This guide goes through one of the key commands and options that most people would need to complete their daily tasks.


## Submit, Cancel and Check status of a job

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
```
sbatch gpu_tester.sh
```

To cancel a run, simply run `scancel {jobId}`

There is plenty of guides to more slurm commands, eg,https://svante.mit.edu/use_slurm.html


## Troubleshooting commands
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

