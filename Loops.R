#load tidyverse and fish data ----
library(tidyverse)
library(plyr)
load("fish_data.Rdata")

#ddply ----
nd = ddply(.data = fish, .variables = "depth_fac", function(x){
  
  z = unique(x$depth_fac) 
  
  #ifelse(test = z == "Deep", yes = 50, no =25)
  
  depth_condition = function(y){
    if(y=="Deep")
    q = 50
    else if(y=="Mid")
    q = 25
    else
    q = 15
  }
  
  x$depth_z = depth_condition(y = z)
  
  return(x)
  
}, .inform = T, .progress = "test")

#Test if depth_condition works 
test = depth_condition(y = "Mid")
test

#Test return of correct values
unique(nd$depth_z)
print(depth_condition(y="Deep"))



#adply ----
batch_data = list.files("batch_data", full = T, pattern = "ISIIS")

phy = adply(batch_data, .margins = 1, function(file){
  
  #read the data
  d = read.table(file, sep = "\t", skip = 10, header = T, fileEncoding = "ISO-8859-1",
                 stringsAsFactors = F, quote = "\"", check.names = F, encoding = "UTF-8",
                 na.strings = 9999)
  
    #clean names 
    ## removes unwanted symbols, trim spaces, make lowercase, etc.
    head = names(d)
    head = str_replace(head, "\\(.*\\)", "")
    head = str_trim(head)
    head = make.names(head)
    head = tolower(head)
    head = str_replace(head, fixed(".."), ".")
    
    #assign names
    names(d) = head
    
    #create proper date time
    date = scan(file, what = "character", skip = 1, nlines = 1, quiet = T)
    
    d$date = date[2]
    
    d$dateTime = str_c(d$date, d$time, sep = " ")
    
    d$dateTime = as.character.POSIXt(strptime(d$dateTime, format="%m/%d/%y %H:%M:%OS", 
                                              tz="America/New_York"))
  return(d)
}, .inform = T)
