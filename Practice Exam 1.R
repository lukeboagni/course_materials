col1=c(NA,1:9)
col2=seq(from =2, to=20, by= 2)
col3=seq(from=3, to=30, by=3)
col4=seq(from=4,to=40,by=4)
all_col=c(col1,col2,col3,col4)
rows=c("r1","r2","r3","r4","r5","r6","r7","r8","r9","r10")
rows=as.list(rows)
cols=(c("col1","col2","col3","col4"))
cols=as.list(cols)
both=c(rows,cols)
m=matrix(data=all_col, nrow=10,ncol = 4, byrow = F)
row.names(m)=rows
colnames(m)=cols

col1[1]=1




#animals=as.factor(c(1,2,3,4))
#length(animals) = 5
