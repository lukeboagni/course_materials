#aurelia text file
install.packages("data.table")
library(data.table)
d1 = fread("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)

d2 = read.csv("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)

d3 = read.table(("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)
                
library(tidyverse)
d4 = read_excel("Lab 4/import_datasets/Aurelia_SEAMAP_2012-2018_30minCell.xlsx")
d4

#my data file
AT = read_csv(file = "AT590-18B (1).csv")
AT



