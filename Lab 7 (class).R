load("fish_data.Rdata")
f = fish; rm(fish)
names(f)

fs = f[,c("transect.id", "area_fac", "depth_fac", 
          "parcel.id","parcel.density.m3","parcel.length.m")]

#rename a field or column ----
library(tidyverse)
fs = rename(.data = fs, tid = transect.id)
fs = rename(.data = fs, area = area_fac)
fs = rename(.data = fs, depth = depth_fac)
fs = rename(.data = fs, pid = parcel.id)
fs = rename(.data = fs, pl = parcel.length.m)
fs = rename(.data = fs, pd = parcel.density.m3)
names(fs)

#using melt (reshape2) to change your data frame from wide to long format ----
library(reshape2)

fs.melt = melt(data = fs, id.vars = c("tid", "pid", "area", "depth"),
               measure.vars = c("pl","pd"),value.name = c("numbers"))

# using dcast to transform data frame from long to wide format ----
fs.cast = dcast(data = fs.melt, formula = tid~variable,
                fun.aggregate = mean,value.var = "numbers")

#spread and gather (tidyverse) ----
fs.gather = fs %>% group_by(tid, area, depth, pid) %>% 
  gather(key ='variable', value = 'value',pd,pl)

#removing duplicates ----
o1 = fs[1,]
o2 = fs[1,]
o3 = fs[1,]
o4 = fs[2:10,]

#bind objects using rbind
o = rbind(o1,o2,o3,o4)

no.dups = o[!duplicated(o),]
dups = o[duplicated(o),]

# complete.cases indentifies columns with NAs
fs[2,]$pd = NA
fs[4,]$pl = NA

fs.complete = fs[complete.cases(fs)]
  
#sort ----
attach(mtcars)
nd = mtcars[order(mpg),]

nd.arrange = arrange(.data = mtcars, desc(mpg))
nd.m.c = arrange(.data = mtcars, mpg, desc(cyl))
