#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=8:00:00
#SBATCH --mem=64GB
#SBATCH --job-name=HDP
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yz8868@nyu.edu
#SBATCH --output=slurm_HDP.out
#SBATCH --error=slurm_HDP.err

echo "start"
cd ..
export WD=$PWD
export LD_LIBRARY_PATH="/home/yz8868/gsl/lib"
mkdir -p $WD/results/RMD_HDP
module load gsl/intel/2.6

cd $WD/resources/processed_chip/
$WD/resources/hdp/hdp/hdp --algorithm train --data 0_BS_clusters.Col_ChIP.d50.min3.HDP.txt --eta 0.1 --directory $WD/results/RMD_HDP --random_seed 0 --init_topics 50 --max_iter 2000
echo "end"