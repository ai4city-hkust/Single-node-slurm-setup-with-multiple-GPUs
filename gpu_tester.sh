#!/bin/bash

#SBATCH --job-name=mytestjob
#SBATCH --gres=gpu:2

echo "Time: `date`"
sudo nvidia-smi
sleep 30
echo Finished at `date`

