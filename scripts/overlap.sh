#!/bin/bash

module load bedtools/intel/2.29.2

groups=$(cut -f3 $1 | sed -e '1d' | sort -u)

for group in $groups; do
	merge_file=$3$group"_MUMERGE.bed"
	cat_file=$4$group"_cat.narrowPeak"
	out=$2$group".overlap.out"
	
	bedtools intersect \
		-a $merge_file \
		-b $cat_file \
		-wao | \
		awk -v OFS='\t' '{print $4, $5, $8, $14}' > $out

done
