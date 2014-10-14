
##install.packages(lubridate)
setwd("C:/Program_R")
library(datasets)
library(lubridate)

##read as chracters - not factors
options( StringsAsFactors=F ) 
f1<-read.table("household_power_consumption.txt",sep=";",head=TRUE, as.is=T )

##subset f1
f2<-f1[with(f1,dmy(Date)>=dmy("01/02/2007") & dmy(Date)<= dmy("02/02/2007")),]

## prepare y variable
f3<-as.numeric(f2$Sub_metering_1)
f4<-as.numeric(f2$Sub_metering_2)
f5<-as.numeric(f2$Sub_metering_3)

##prepare x variable
f6<-paste(f2$Date,f2$Time)

f7<-strptime(f6, "%d/%m/%Y %H:%M:%S") 

##plot
plot(f7,f3,type="l",col="black", xlab="", ylab="Energy sub metering")
lines(f7,f4,col="red")
lines(f7,f5,col="blue")
legend("topright",lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##save as .png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
plot(f7,f3,type="l",col="black", xlab="", ylab="Energy sub metering")
lines(f7,f4,col="red")
lines(f7,f5,col="blue")
legend("topright",lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()