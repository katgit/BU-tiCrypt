#!/bin/bash -l

#SBATCH --job-name=test_r_module
#SBATCH --time=00:10:00
#SBATCH --output=test_r_module_%j.output

module load R/4.5.2

echo "Hello from ${HOSTNAME} ${SLURM_JOB_ID}"
Rscript test_r_module.R
