options(scipen=999)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

args = commandArgs(trailing = TRUE)
sheet_file = args[1]
out_folder = args[2]

df_sheet = read.table(sheet_file, header = TRUE)

for (i in 1:nrow(df_sheet)) {
	input_file = df_sheet[i, "narrowPeak_file"]
	output_file = paste0(out_folder, df_sheet[i, "events_file"])
	
	df = read.table(input_file, header = FALSE)
	df = df %>%
		filter(V1 != "chrM" & V1 != "chrC") %>%
		mutate(V10 = V2 + V10, Position = paste0(V1, ":", V10),
			IP = rep("10"), Control = rep("1"), Fold = rep("10"), Expectd = rep("10"), "Q_-lg10" = V9, "P_-lg10" = V8, P_poiss = rep("1"), IPvsEMP = rep("-0.4"), Noise = rep("0")) %>%
		select(Position, IP, Control, Fold, Expectd, "Q_-lg10", "P_-lg10", P_poiss, IPvsEMP, Noise)
	write.table(df, output_file, quote = FALSE, sep = '\t', row.names = FALSE)
}