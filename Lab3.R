fish.e = fish[fish$area_fac =="East",]
e.lat = fish[fish$area_fac == "East",]$parcel.start.lat
e.lat [6]
fish_west = fish[fish$area_fac !="East" & fish$area_fac != "Central",]
fish_lg_patch = fish[fish$parcel.length.m >=20]
v = c(1,1,0,2,2,3,3,4)
2%in%v
c(1,2,3) %in% c(3,2,1)
v[4]= 6
v[c(1,3,5)]=c(2,4,6)

n = c(NA, 1:50)
n.a = is.na(n)

names(fish)
unique(fish$year)
fish$year[6]=NA
head(fish$year)
fish.no.na=fish[!is.na(fish$year)]
unique(fish.no.na)

file = list.files(full.names=TRUE, pattern = ".txt")
d = read.table(file,skip=10) 
