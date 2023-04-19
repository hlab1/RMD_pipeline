options(scipen=999)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

args = commandArgs(trailing = TRUE)
sheet_file = args[1]
out_folder = args[2]


df_sheet = read.table(sheet_file, header = TRUE)
df_sheet = df_sheet %>%
	group_by(group)

keys = group_keys(df_sheet)$group

for (key in keys) {
	temp_df = df_sheet %>%
		filter(group == key) %>%
		rename("#file" = "file")
	out_path = paste0(out_folder, key, "_merge_sample_sheet.txt")
	write.table(temp_df, file = out_path, sep = "\t", quote = FALSE, row.names = FALSE)
}