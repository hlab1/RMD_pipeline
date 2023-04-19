# RMD_pipeline

See dependencies at ```dependencies.txt```.


## Step 1: Merge narrowPeak replicates

Download Mumerge software to ```scripts/```. See https://github.com/Dowell-Lab/mumerge.

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

The final merged GPS events will be at ```resources/processed_chip```.


## Step 3: Generate GPS events directly from narrowPeak if no merging necessary

Generate a tab delimited text file with 2 columns (narrowPeak_file, events_file). The narrowPeak_file column contains paths to BED files, events_file column contains the corresponding GPS output file name.

![image](https://user-images.githubusercontent.com/108205199/233181537-e696d548-5ebe-41d2-8e82-e011067cbe9d.png)

Usage:
```
sh narrowPeak_to_GPSevents.sh <sample sheet location> <output folder>
```


## Step 4: RMD

Download gem.jar at http://groups.csail.mit.edu/cgs/gem/rmd/.

Usage:
```
sh RMD.sh
```
The reults will be at ```resources/processed_chip/``` See http://groups.csail.mit.edu/cgs/gem/rmd/ for more information.


## Step 5: HDP

download hdp software to ```resources```. See instructions at https://github.com/blei-lab/hdp.

Usage:
```
sbatch hdp.s
```

The results will be at ```results/RMD_HDP/```


## Step 6: Post analysis

See ```/analysis/RMD_analysis.rmd```.

It uses 2 files: 1) ```resources/processed_chip/0_BS_clusters.Col_ChIP.Dictioinary.txt```, 2) ```results/RMD_HDP/01900-topics.dat```.
