##These codes would reproduce the plot4
Sys.setlocale("LC_TIME","US")
rawdata <- read.table(file="household_power_consumption.txt",header=FALSE,sep=";"
                      ,col.names=c("Date","Time","Global_active_power",
                                   "Global_reactive_power","Voltage","Global_intensity",
                                   "sub_metering_1","sub_metering_2","sub_metering_3"),
                      skip=1,colClasses=c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                      na.strings="?")
plotdata <- subset(rawdata, Date%in%c("1/2/2007","2/2/2007"))
library(dplyr)
plotdata <- mutate(plotdata, Date_and_Time = paste(Date,Time,sep = " "))
plotdata$Date_and_Time <- strptime(plotdata$Date_and_Time,format = "%d/%m/%Y %H:%M:%S",tz="GMT")
plotdata$Date_and_Time <- as.POSIXct(plotdata$Date_and_Time)

png(file="plot4.png")
par(mfcol=c(2,2),mar=c(4,4,1,1))
with(plotdata,plot(Global_active_power~Date_and_Time,pch=20,type="l",ylab="Global Active Power(kilowatts)",xlab=""))

with(plotdata,plot(Date_and_Time,sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(plotdata,lines(Date_and_Time,sub_metering_1,type="l"))
with(plotdata,lines(Date_and_Time,sub_metering_2,type="l",col="red"))
with(plotdata,lines(Date_and_Time,sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("tan","red","blue"),bty="n",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

with(plotdata,plot(Date_and_Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))

with(plotdata,plot(Date_and_Time,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime"))
dev.off()
