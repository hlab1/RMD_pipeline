#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=8:00:00
#SBATCH --mem=64GB
#SBATCH --job-name=merge

module load bedtools/intel/2.29.2
module load python/intel/3.8.6

out=$3$4

python $1 -i $2 -o $out
