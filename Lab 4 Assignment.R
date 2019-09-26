#load packages
library(data.table)
library(tidyverse)
library(readxl)

#aurelia Rdata
load("~/Desktop/R class/R scripts/course_materials/Lab 4/import_datasets/aurelia_15minCell_statareas.Rdata")
a

#aurelia txt
read.csv("Lab 4/import_datasets/aurelia_15minCell_statareas.txt",header = T,sep = ",",stringsAsFactors = F)

#aurelia excel
read_excel("Lab 4/import_datasets/Aurelia_SEAMAP_2012-2018_30minCell.xlsx")

#ENVREC csv
read.csv("Lab 4/import_datasets/ENVREC.csv")
