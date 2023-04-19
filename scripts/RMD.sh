#!/bin/bash

cd ..
export WD=$PWD
cd $WD/resources/processed_chip

module load jdk/1.8.0_271
module load gem/3.3
java -Xmx15G -jar $WD/resources/gem.jar RMD --g $WD/resources/Col_genome.chrom.sizes --tf_peak_file $WD/resources/processed_chip/peak_file.txt --distance 50 --min_site 3 --out Col_ChIP