if(!dir.exists("~/Documents/Yonathan/Courera/Exploratory")){
  dir.create("~/Documents/Yonathan/Courera/Exploratory")
}
setwd("/Users/ybrhane/Documents/Yonathan/Courera/Exploratory")
getwd()
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,
              destfile = "/Users/ybrhane/Documents/Yonathan/Courera/Exploratory/household_power_consumption.zip",
              method = "curl")
unzip("household_power_consumption.zip")
list.files()

power = read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power.2years <- subset(power,Date >= "2007-02-01" & Date <= "2007-02-02")
power.2years$DateTime <- paste(power.2years$Date, power.2years$Time)
power.2years$DateTime <- as.POSIXct(power.2years$DateTime)

# Plot4
png("plot4.png",width = 480, height = 480,units = "px")
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(power.2years,{
  plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
  plot(DateTime,Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
  points(DateTime,Sub_metering_2,type="l",col="red")
  points(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, lwd=2.5)
  plot(DateTime,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
})
dev.off()


