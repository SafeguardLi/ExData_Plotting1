##This code would reproduce the plot2
Sys.setlocale("LC_TIME", "US")
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
png(file="plot2.png")
with(plotdata,plot(Global_active_power~Date_and_Time,pch=20,type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.off()