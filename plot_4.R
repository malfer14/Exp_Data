
##install.packages(lubridate)
setwd("C:/Program_R")
library(datasets)
library(lubridate)

##read as characters - not factors
options( StringsAsFactors=F ) 
f1<-read.table("household_power_consumption.txt",sep=";",head=TRUE, as.is=T )

##subset f1
f2<-f1[with(f1,dmy(Date)>=dmy("01/02/2007") & dmy(Date)<= dmy("02/02/2007")),]

## prepare y variables
f3<-as.numeric(f2$Sub_metering_1)
f4<-as.numeric(f2$Sub_metering_2)
f5<-as.numeric(f2$Sub_metering_3)
f6<-as.numeric(f2$Global_active_power)
f7<-as.numeric(f2$Voltage)
f8<-as.numeric(f2$Global_reactive_power)

##prepare x variable
f9<-paste(f2$Date,f2$Time)
f10<-strptime(f9, "%d/%m/%Y %H:%M:%S") 


##create multiplot
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(f10, f6, xlab="", ylab = "Global Active Power", type = "l")
lines(f10, f6)
plot(f10,f7, xlab="datetime", ylab = "Voltage", type = "l")
plot(f10,f3,type="l",col="black", xlab="", ylab="Energy sub metering")
lines(f10,f4,col="red")
lines(f10,f5,col="blue")
legend("topright", lty = c(1, 1, 1) , pt.cex=1, cex=0.7, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(f10,f8, ylim=c(0,0.5), xlab="datetime", ylab = "Global_reactive_power", type = "l")


##save as .png file

dev.copy(png, file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(f10, f6, xlab="", ylab = "Global Active Power", type = "l")
lines(f10, f6)
plot(f10,f7, xlab="datetime", ylab = "Voltage", type = "l")
plot(f10,f3,type="l",col="black", xlab="", ylab="Energy sub metering")
lines(f10,f4,col="red")
lines(f10,f5,col="blue")
legend("topright", lty = c(1, 1, 1) , pt.cex=1, cex=0.7, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(f10,f8, ylim=c(0,0.5), xlab="datetime", ylab = "Global_reactive_power", type = "l")

dev.off()