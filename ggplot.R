library(ggplot2)
load("fish_data.Rdata")

#non-ggplot functions ----
plot(x = fish$parcel.start.lon, y = fish$parcel.start.lat)
hist(log10(fish$parcel.density.m3))
boxplot(x = fish$parcel.density.m3)

#ggplot2 functions ----

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "blue")

ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) + geom_line() +
  scale_color_manual(values = c("red","blue","darkgreen","goldenrod","black","blueviolet","chocolate2")) 

#facets 
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) + geom_point() +
  facet_grid(~class)

#smoother - adds best fit 
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_smooth()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_smooth(method = "lm")
     

#histogram 
ggplot(data = mpg, aes(displ,fill = drv)) +geom_histogram()

ggplot(data = mpg, aes(displ, color = drv)) +geom_freqpoly()

#economics example ----
##one geom
data("economics")
unemploy = ggplot(data = e, aes(x = date, y = unemploy)) + geom_line()
unemploy

##multiple geoms
data("presidential")
pres = presidential;rm(presidential)

caption = paste(strwrap("Unemployment rates in the US have varied a lot over the years",40), collapse = "\n")
yrng = range(e$unemploy)
xrng = range(e$date)
date = as.Date("1960-01-01")

ggplot(e) +
  geom_line(aes(x = date, y = unemploy)) +
  geom_rect(data = pres, aes(xmin = start, xmax = end, fill = party),
            ymin = -Inf, ymax = Inf, alpha = .2) + 
  scale_fill_manual(values = c("dodgerblue","firebrick3")) +
  geom_vline(data = pres, aes(xintercept = as.numeric(start)),colour="grey50", alpha = .5) +
  geom_text (data = pres, aes(x = start, y = 2500, label = name), size = 3, vjust = 0, hjust = 0, nudge_x = 100) +
  annotate("text", x = date,y = yrng[2],label = caption,hjust = 0,vjust = 1,size =4 )
 
#special request
library(tidyverse)
load("fish_data.Rdata")
f = fish;rm(fish)

fs = f %>% group_by(area_fac,depth_fac,yr_fac) %>% summarize(parcel.count = length(parcel.id))

ggplot(data = fs) +
  geom_bar(aes(x = yr_fac, y = parcel.count, fill = depth_fac), position = "stack" ,stat = "identity") +
  facet_wrap(.~area_fac)

#using ddply to plot multiple objects ----
library(plyr)

ggplot(f,aes(parcel.length.m, parcel.density.m3, color = depth_fac)) +geom_point() + 
  xlab("Parcel Length (m)") +
  ylab(expression(paste("Parcel Density (",m^3,")")))


ddply(.data = f, .variables = "depth_fac", function(x){
  name = unique(x$depth_fac)
  pl = ggplot(f,aes(parcel.length.m, parcel.density.m3)) + geom_point() +
    xlab("parcel length (m)") +
    ylab(expression(paste("Parcel Density (",m^3,")"))) +
    ggtitle(name)
 
  
  
  ggsave(filename = paste0(name,".tiff"), plot = pl, width = 4, height = 3, 
         units = 'in', dpi = 600)
         
}, .progress = "text")

#break up by transect id
ddply(.data = f, .variables = "transect.id", function(x){
  name = unique(x$transect.id)
  pl = ggplot(f,aes(parcel.length.m, parcel.density.m3)) + geom_point() +
    xlab("parcel length (m)") +
    ylab(expression(paste("Parcel Density (",m^3,")"))) +
    ggtitle(name)
  
  
  
  ggsave(filename = paste0(name,".tiff"), plot = pl, width = 4, height = 3, 
         units = 'in', dpi = 600)
  
}, .progress = "text")


#plotting 3 variables
data(mtcars)
mt = mtcars;rm(mtcars)

ggplot(mt, aes(vs, cyl, fill = mpg)) + geom_tile()

ggplot(mt, aes(wt,mpg)) + geom_point(aes(size = cyl)) + theme_get() 








