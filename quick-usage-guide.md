# A Quick Slurm Guide for Beginners

## Introduction
Slurm commands could be confusing at first. If you check [slurm documentation](https://slurm.schedmd.com/man_index.html) one could easily be overwhelmed as there are hundreds of commands + options. This guide goes through one of the key commands and options that most people would need to complete their daily tasks.

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


## Submit, Cancel and Check status of a job

TODO: add these commands with options for GPU
