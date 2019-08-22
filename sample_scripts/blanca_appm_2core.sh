#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=00:10:00
#SBATCH --partition=blanca-sol
#SBATCH --account=blanca-sol
#SBATCH --qos=blanca-sol
#SBATCH --ntasks=2
#SBATCH --job-name=mpi-hello2
#SBATCH --output=mpi-hello2.%j.out

#NOTE:  This should be submitted from a login node
#NOTE:  You must first run  "module load slurm/blanca" to submit

module purge
module load intel
module load impi

cd ../sample_code 

export I_MPI_FABRICS=shm   # This presently has to be done on blanca nodes for Intel MPI to work

#The SLURM_NTASKS environment variable uses all ntasks specified (in this case 2)
mpiexec -np $SLURM_NTASKS ./hello.out
