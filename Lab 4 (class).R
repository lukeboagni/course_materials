#aurelia text file
install.packages("data.table")
library(data.table)
d1 = fread("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)

d2 = read.csv("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)

d3 = read.table("Lab 4/import_datasets/aurelia_15minCell_statareas.txt", sep = ",",header = T,stringsAsFactors = F)
                
library(tidyverse)
d4 = read_excel("Lab 4/import_datasets/Aurelia_SEAMAP_2012-2018_30minCell.xlsx")
d4

#my data file
AT = read_csv(file = "AT590-18B (1).csv")
AT

#subsetting
#indexing by conditon
load("fish_data.Rdata")
unique(fish$depth_fac)
fish_deep = fish[fish$depth_fac == "Deep",]
fish_deep2 = subset(x = fish, depth_fac == "Deep")

#shallow
fish_shallow = fish[fish$depth_fac == "Shallow",]
#East
fish_east = fish[fish$area_fac == "East",]
#patchs
fish_patch = fish[fish$type_fac == "Patch",]

#pull out certain categories
fish_deep3 = subset(x = fish, depth_fac == "Deep", select = c("transect.id", "area_fac"))

library(dplyr)
fish_deep4 = filter(.data = fish, depth_fac == "Deep")

#subset and combine
fish_deep5 = fish[which(fish$depth_fac == "Deep" & fish$area_fac == "East"),]
fish_deep6 = fish[which(fish$depth_fac == "Shallow" & fish$area_fac == "West"),]

fish_deepC = rbind(fish_deep5,fish_deep6)

#combine df wiht seperate columns into a singlw df
c1 = subset(x = fish, depth_fac == "Deep", select = c("transect.id", "area_fac"))
nrow()
c2 = subset(x = fish, depth_fac == "Deep", select = c("depth_fac", "parcel.length.m","group"))

c3 = cbind(c1,c2)

#merging 2 df, making sure the observations match
m1 = subset(x = fish, depth_fac == "Deep", select = c("transect.id", "area_fac"))
m1$seq = seq(1,nrow(m1),1)
m2 = subset(x = fish, depth_fac == "Deep", select = c("transect.id","depth_fac","group"))
m2$seq = seq(1,nrow(m2),1)
#merge
m3 = merge(x = m1,y = m2,by = "seq")
