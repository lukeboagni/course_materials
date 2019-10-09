file = list.files(full.names = T, pattern = ".txt")

#read in file
d = read.table(file='ISIIS201405291242.txt', sep="\t",skip = 10,header = T,fileEncoding = "ISO-8859-1",
                stringsAsFactors = F, quote="\"",check.names= T, encoding="UTF-8", na.strings="9999.99")

#create proper date time format
date = scan(file ='ISIIS201405291242.txt', what = "character", skip = 1,nlines = 1,quiet = T)
date=date[2]
mm = str_sub(string= date,start= 1, end = 2)
dd = str_sub(date,4,5)
dd= as.numeric(dd)
yy= str_sub(date,7,8)
dateNextDay = str_c(mm,as.character(dd+1),yy, sep="/")
date = str_c(mm,dd,yy, sep = "/")

d$hour = as.numeric(str_sub(d$Time,1,2))
d$min = as.numeric(str_sub(d$Time,4,5))
d$sec = as.numeric(str_sub(d$Time,7,11))
d$Time = str_c(d$hour,d$min,d$sec, sep = ":")
d$date = date
d$dateTime = str_c(d$date,d$Time, sep =" ")
d$dateTime = as.POSIXct(strptime(d$dateTime, format = "%m/%d/%y %H:%M:%OS", tz="America/New_York")) 

d$date
d$Time
  