# Exploratory Data Analysis
# Project 1

getwd()

# Read the data...
# Note, the missing value is '?'.
data<-read.csv('household_power_consumption.txt',sep=';',na.strings=c('?'))
str(data) # Note, check we have nums!

# Add a new variable that contains the Date data converted to the Date class
data$MyDate <- as.Date(strptime(data$Date,"%d/%m/%Y"))

# Only use data from 2007-02-01 and 2007-02-02.
someData <- subset(data,MyDate>='2007-02-01' & MyDate<='2007-02-02')

xLabel<-"Global Active Power (kilowatts)"
title<-"Global Active Power"

png("plot1.png",480,480)

hist(someData$Global_active_power,col="red", xlab=xLabel, main=title)

dev.off()
