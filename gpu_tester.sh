#!/bin/bash

#SBATCH --job-name=mytestjob
#SBATCH --gres=gpu:2

echo "Time: `date`"
module purge
module load conda
module load torch
eval "$(conda shell.bash hook)"
conda activate base
which python3
conda env config vars list
python3 simple_torch.py
echo Finished at `date`
