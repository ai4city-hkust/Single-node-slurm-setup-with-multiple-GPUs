# Single-node-slurm-setup-with-multiple-GPUs
Single node slurm setup with multiple GPUs, with Ubuntu 20.04.5 


### General guidance

reference https://blog.llandsmeer.com/tech/2020/03/02/slurm-single-instance.html

xdg-open did not work for me. I had to scp `configurator.html` into my laptop and modify the input.

TODO: update `slurm.conf` into the repo. 

### Permission issues
I had to modify permission or create new directories throughout the process, particularly when running
```
slurmctld -D
slurmd -D
```

### Content of /etc/hosts 
{hostname} is the output of `hostname -s`
x.x.x.x is the ip address of your host

```
x.x.x.x {hostname}
```
