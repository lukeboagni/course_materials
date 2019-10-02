#summarizing data
#----------

#load packages
library(tidyverse)
library(nutshell)

#data we'll be using 
data("batting.2008")
d = batting.2008

#tapply (tidyverse function) ----
##find sum of all hr
hr = tapply(d$HR, list(d$teamID), FUN = sum)

##find quantlie values for hr by team
###fivenum gives you: nim, lower hinge, median, upper hinge, max
hr.q = tapply(d$HR, list(d$teamID), FUN = fivenum)

## one category summarized
lg.q = tapply((d$H/d$AB),INDEX =  list(d$lgID), FUN = fivenum)

summary(d[d$lgID=="AL",]$H/d[d$lgID=="AL",]$AB)
## same thing creating multiple objects

##two categories
bats = tapply(d$HR, INDEX = list(d$lgID, d$bats), FUN = mean)
##three categories
bats.team = tapply(d$HR, INDEX = list(d$lgID, d$HR, d$bats), FUN = mean)




#aggregate ----

team.stats.sum = aggregate(d[,c("AB","H", "BB", "2B", "HR")], by = list(d$teamID), FUN = sum)
team.stats.mean = aggregate(d[,c("AB","H", "BB", "2B", "HR")], by = list(d$teamID), FUN = mean)

#summarise ----
## %>% is pipe that pases one function to the next
team.sum = d %>% group_by(teamID) %>% summarise(ABsum = sum(AB), ABmean = mean(AB), 
                                                ABsd = sd(AB), ABcount = n())
#add another column to sort by
team.sum.lg = d %>% group_by(lgID, teamID) %>% summarise(ABsum = sum(AB), ABmean = mean(AB), 
                                                ABsd = sd(AB), ABcount = n())

#rowsum ----

rs = rowsum(d[,c("AB", "H", "HR", "2B", "3B")], group = d$teamID)


#counting variables ----
#tabulate

HR.cnts = tabulate(d$HR)
names(HR.cnts) = 0:(length(HR.cnts) - 1)

#aside ab name function
m = matrix(nrow = 4, ncol = 3)
colnames(m) = c(1,2,3) 
rownames(m) = c("A","B","C","D")

#table ----
table(d$bats)
table (d[,c("bats", "throws")])

#reshaping your data ----
n = matrix (1:10, nrow = 5)
t(n)

v = 1:10
t(v)
str(v)

#stack and unstack (didn't work)
s = d[,c("lgID","teamID","AB","HR","throws")]
s.un = unstack(x = s, form = teamID ~ HR)


#cast and melt ----
library(reshape2)

#use cast to change df from long to wide (didn't work)

s.wide = dcast(data = s, value.var = "HR", formula = lgID ~ teamID, fun.aggregate = mean)











