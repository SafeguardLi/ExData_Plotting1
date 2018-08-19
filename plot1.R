##This code would reproduce the plot1
rawdata <- read.table(file="household_power_consumption.txt",header=FALSE,sep=";"
                      ,col.names=c("Date","Time","Global_active_power",
                                   "Global_reactive_power","Voltage","Global_intensity",
                                   "sub_metering_1","sub_metering_2","sub_metering_3"),
                      skip=1,colClasses=c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                      na.strings="?")
plotdata <- subset(rawdata, Date%in%c("1/2/2007","2/2/2007"))
png(file="plot1.png")
hist(plotdata$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()