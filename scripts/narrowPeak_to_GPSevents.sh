#!/bin/bash

cd ..
export WD=$PWD
cd $WD/scripts

module load r/gcc/4.1.0

mkdir -p $WD/resources/processed_chip/

Rscript $WD/scripts/narrowpeak_to_GPSevents.r \
	$WD/scripts/narrowPeak_to_event.txt \
	$WD/resources/processed_chip/