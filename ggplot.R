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

#facets ----
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) + geom_point() +
  facet_grid(~class)

#smoother - adds best fit ----
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_smooth()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_smooth(method = "lm")
     

#histogram 
ggplot(data = mpg, aes(displ,fill = drv)) +geom_histogram()

ggplot(data = mpg, aes(displ, color = drv)) +geom_freqpoly()


