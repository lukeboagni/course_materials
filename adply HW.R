#adply HW
library(tidyverse)
library(plyr)

beach_data = list.files("Beach data", full = T)

beachply = adply(beach_data, .margins = 1, function(file){
  
  #read the data
  d = read_csv(file)
  
  #create proper date time
  d$`Measurement Timestamp` = as.character.POSIXt(strptime(d$`Measurement Timestamp`, format="%m/%d/%Y %H:%M:%OS %p", 
                                            tz="America/Chicago"))
  return(d)
}, .inform = T)


save(beachply,file = "Chicago Beach Data 2014-2017")

