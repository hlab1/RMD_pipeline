options(scipen=999)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

args = commandArgs(trailing = TRUE)
input_folder = args[1]
output_folder = args[2]

list.file = list.files(input_folder)

for (file in list.file) {
	input_file = paste0(input_folder, file)
	output_file = paste0(output_folder, gsub("overlap.out", "processed_GPS_events.txt", file))
	
	df = read.table(input_file, header = FALSE)
	df = df %>%
		group_by(V1) %>%
		mutate(V5 = round(mean(V4), digits = 0)) %>%
		ungroup() %>%
		filter(V2 != "ChrM" & V2 != "ChrC") %>%
		select(c(V2, V5)) %>%
		mutate(Position = paste0(gsub("Chr", "chr", V2), ":", V5)) %>%
		select(Position) %>%
		mutate(IP = rep("10"), Control = rep("1"), Fold = rep("10"), Expectd = rep("10"), "Q_-lg10" = rep("1"), "P_-lg10" = rep("1"), P_poiss = rep("1"), IPvsEMP = rep("-0.4"), Noise = rep("0"))
	write.table(df, output_file, quote = FALSE, sep = '\t', row.names = FALSE)
}