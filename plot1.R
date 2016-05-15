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
str(power.2years)
#power.2days$Time <- strptime(power.2days$Time,format="%H:%M:%S")

# Plot1
png("plot1.png",width = 480, height = 480,units = "px")
with(power.2years,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()


