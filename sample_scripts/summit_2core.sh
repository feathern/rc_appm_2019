#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=00:10:00
#SBATCH --qos=testing
#SBATCH --partition=shas
#SBATCH --ntasks=2
#SBATCH --job-name=mpi-hello2
#SBATCH --output=mpi-hello2.%j.out


module purge
module load intel
module load impi

cd ../sample_code

#The SLURM_NTASKS environment variable uses all ntasks specified (in this case 2)
mpiexec -np $SLURM_NTASKS ./hello.out
