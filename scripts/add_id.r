options(scipen=999)

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

args = commandArgs(trailing = TRUE)
input_file = args[1]
input_folder = args[2]
out_folder = args[3]


df = read.table(input_file, header = FALSE)
df$V4 = 1:nrow(df)
df$V2 = pmax(df$V2, 0)
out_path = gsub(input_folder, out_folder, input_file)
write.table(df, out_path, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)