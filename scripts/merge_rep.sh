#!/bin/bash

cd ..
export WD=$PWD
cd $WD/scripts

module load r/gcc/4.1.0

sample_sheet_bygroup_path=$WD/scripts/sample_sheet_bygroup/
mkdir -p $sample_sheet_bygroup_path
merged_chip_path=$WD/resources/merged_chip/
mkdir -p $merged_chip_path
merged_chip_with_id_path=$WD/resources/merged_chip_with_id/
mkdir -p $merged_chip_with_id_path
cat_chip_path=$WD/resources/cat_chip/
mkdir -p $cat_chip_path
overlap_chip_path=$WD/resources/overlap_chip/
mkdir -p $overlap_chip_path
processed_chip_path=$WD/resources/processed_chip/
mkdir -p $processed_chip_path


if [[ $1 == "merge" ]]; then
Rscript $WD/scripts/split_sample_group.r \
	$2 \
	$sample_sheet_bygroup_path


for file in $sample_sheet_bygroup_path*merge_sample_sheet.txt; do
	id="$(echo ${file} | sed -e 's/_merge.*//' -e 's/^.*\///')"

	sbatch $WD/scripts/merge_peak.s \
		$WD/scripts/mumerge/mumerge/mumerge.py \
		$file \
		$merged_chip_path \
		$id
done


else
#for file in $merged_chip_path*MUMERGE.bed; do
#	Rscript $WD/scripts/add_id.r $file $merged_chip_path $merged_chip_with_id_path
#	wait
#done


#for file in $sample_sheet_bygroup_path*merge_sample_sheet.txt; do
#	sh $WD/scripts/concatenate_rep.sh $file $cat_chip_path
#	wait
#done


#sh $WD/scripts/overlap.sh $WD/scripts/merge_sample_sheet.txt $overlap_chip_path $merged_chip_with_id_path $cat_chip_path

Rscript $WD/scripts/avg_summit.r $overlap_chip_path $processed_chip_path

fi
