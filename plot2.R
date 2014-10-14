
##install.packages(lubridate)
setwd("C:/Program_R")
library(datasets)
library(lubridate)

##read as characters - not factors
options( StringsAsFactors=F ) 
f1<-read.table("household_power_consumption.txt",sep=";",head=TRUE, as.is=T )

##subset f1
f2<-f1[with(f1,dmy(Date)>=dmy("01/02/2007") & dmy(Date)<= dmy("02/02/2007")),]

## prepare y variable
f3<-as.numeric(f2$Global_active_power)

##prepare x variable
f4<-paste(f2$Date,f2$Time)

f5<-strptime(f4, "%d/%m/%Y %H:%M:%S") 

##plot
plot(f5, f3, xlab=""  ,ylab = "Global Active Power (kilowatts)", type = "l")
lines(f5, f3)

##save as .png file
plot2=dev.cur()
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()