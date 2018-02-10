# PROGRAM NAME  : plot1.R 
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

# Plot 
attach(working_data)
  hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
detach(working_data)

rm(list=ls())
#=============== END OF THE PROGRAM ===============#