# Maintainance guide
Single node slurm setup with multiple GPUs, with Ubuntu 20.04.5 


### General guidance

reference https://blog.llandsmeer.com/tech/2020/03/02/slurm-single-instance.html

xdg-open did not work for me. I had to scp `configurator.html` into my laptop and modify the input.

### GPU support
To add GPU support for slurm, there are additional changes needed in slurm.conf.
We also need to create a gres.conf file under the same folder. In our case, it's /etc/slurm

Uploaded both slurm.conf and gres.conf 

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