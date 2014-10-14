## Hello everyone!
## I know something is wrong due to different values on x/y axes, 
## but I couldn't figured out what is wrong. I'll appreciate all sugestions.
##install.packages(lubridate)
setwd("C:/Program_R")
library(datasets)
f1<-read.table("household_power_consumption.txt",sep=";",head=TRUE)
f2<-f1[with(f1,dmy(Date)>=dmy("01/02/2007") & dmy(Date)<= dmy("02/02/2007")),]
f3=as.numeric(f2$Global_active_power)
bins=seq(0,6,by=0.2)
hist(f3/1000, xlab="Global Active Power (kilowats)", col="red", main="Global Active Power", breaks=bins)

plot1=dev.cur()
dev.copy(png, file = "plot1.png",width = 800, height = 600)
dev.off()