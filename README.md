# RMD_pipeline

## Step 1: Merge narrowPeak replicates

Generate a tab delimited text file with 3 columns (file, sampid, group) for merging peaks. The file column contains paths to BED files, sampid can be any id, and group is the group name. Files within same group will be merged.

![image](https://user-images.githubusercontent.com/108205199/233177885-ea12aea2-af57-41cc-82f4-b74a6d568407.png)

Usage:
```
cd scripts
git clone https://github.com/Dowell-Lab/mumerge # get mumerge pipeline
sh merge_rep.sh merge ./merge_sample_sheet.txt # the second argument is the location of the txt file.
```


## Step 2: Generate GPS events format with merged summits

Usage:
```
sh merge_rep.sh
```

The final merged GPS events will be at resources/processed_chip.


## Step 3: Generate GPS events directly from narrowPeak if no merging necessary


