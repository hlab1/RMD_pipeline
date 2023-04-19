#!/bin/bash

cd ..
export WD=$PWD
cd $WD/scripts

module load r/gcc/4.1.0

mkdir -p $2

Rscript $WD/scripts/narrowpeak_to_GPSevents.r $1 $2
