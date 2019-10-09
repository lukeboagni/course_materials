#load tidyverse and fish data
library(tidyverse)
load("fish_data.Rdata")
f = fish;rm(fish)

#mean of pd
mean.pd = tapply(f$parcel.density.m3, list(f$transect.id), FUN = mean)
mean.pd.df = as.data.frame(mean.pd)
colnames(mean.pd.df) = "pd mean"

transect = rownames(mean.pd.df)
row.names(mean.pd.df) = NULL
mean.pd.df1 = cbind(transect,mean.pd.df)

#sd of pd
sd.pd = tapply(f$parcel.density.m3, list(f$transect.id), FUN = sd)
sd.pd.df = as.data.frame(sd.pd)
colnames(sd.pd.df) = "pd sd"

transect = rownames(sd.pd.df)
row.names(sd.pd.df) = NULL
sd.pd.df1 = cbind(transect,sd.pd.df)

#merge1
pd.merge = merge(mean.pd.df1,sd.pd.df1, by = "transect")
pd.merge


#count
count.pd = tapply(f$parcel.density.m3, list(f$transect.id), FUN = length)
count.pd.df = as.data.frame(count.pd)
colnames(count.pd.df) = "pd count"

transect = rownames(count.pd.df)
row.names(count.pd.df) = NULL
count.pd.df1 = cbind(transect,count.pd.df)

#merge2
pd.merge2 = merge(pd.merge,count.pd.df1,"transect")


#group mean
group.mean = f %>% group_by(transect.id) %>% 
summarise(parcel.density.m3 = mean(parcel.density.m3))

group.mean.df = as.data.frame(group.mean)
colnames(group.mean.df)[1] = "transect"
colnames(group.mean.df)[2] = "pd mean"

#group sd
group.sd = f %>% group_by(transect.id) %>% 
  summarise(parcel.density.m3 = sd(parcel.density.m3))

group.sd.df = as.data.frame(group.sd)
colnames(group.sd.df)[1] = "transect"
colnames(group.sd.df)[2] = "sd mean"

#join
join.group = full_join(group.mean.df,group.sd.df, by = "transect")
join.group

#group count
group.count = f %>% group_by(transect.id) %>% 
  summarise(parcel.density.m3 = length(parcel.density.m3))
group.count.df = as.data.frame(group.count)
colnames(group.count.df)[1] = "transect"
colnames(group.count.df)[2] = "count"

#join2
join.group2 = full_join(join.group,group.count.df, by = "transect")

#freestyle
freestyle1 = tapply(f$parcel.length.m, list(f$tow.depth), FUN = fivenum)
freestyle2 = tapply(f$parcel.length.m, list(f$region), FUN = fivenum)

