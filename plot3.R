# PROGRAM NAME  : plot3.R 
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
attach(working_data)
  plot(Sub_metering_1 ~ DateTime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ DateTime, col="Red")
  lines(Sub_metering_3 ~ DateTime, col="Blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
detach(working_data)

rm(list=ls())
#=============== END OF THE PROGRAM ===============#