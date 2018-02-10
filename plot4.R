# PROGRAM NAME  : plot4.R 
# DESCRIPTION   : For Coursera's JHU Exploratory Data Analysis Project Week 1 
# AUTHOR        : Alvinjohn Escoro
# DATE CREATED  : 20180210
#==========================================================================================================

#=============== START OF THE PROGRAM ===============#
getwd()
gc()

# Load the input file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Date conversion
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Will only be using data from the dates 2007-02-01 and 2007-02-02
working_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Manipulate datetime
working_data$DateTime <- strptime(paste(working_data$Date, working_data$Time), "%Y-%m-%d %H:%M:%S")
working_data$DateTime <- as.POSIXct(working_data$DateTime)

# Plot 
par(mfrow= c(2, 2))
attach(working_data)
  plot(Global_active_power ~ DateTime, type="l", ylab="Global Active Power", xlab="")
  
  plot(Voltage ~ DateTime, type="l")
  
  plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ DateTime, col="red")
  lines(Sub_metering_3 ~ DateTime, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         ,bty='n', lty=1, col=c("black", "red", "blue"), cex=0.7)
  
  plot(Global_reactive_power ~ DateTime, type="l")
  
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
detach(working_data)

rm(list=ls())
#=============== END OF THE PROGRAM ===============#