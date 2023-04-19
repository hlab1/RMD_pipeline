#!/bin/bash

group=$(cut -f3 $1 | head -2 | tail -1)
out=$2$group"_cat.narrowPeak"

for file in $(cut -f1 $1 | sed -e '1d'); do
	cat $file | awk -v OFS='\t' '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10 + $2}' >> temp
done

mv temp $out
