# Exploratory Data Analysis
# Project 1
# plot 2

getwd()

# Read the data...
# Note, the missing value is '?'.
data<-read.csv('household_power_consumption.txt',sep=';',na.strings=c('?'))
str(data) # Note, check we have nums!

# Add a new variable that contains the Date data converted to the Date class
data$MyDate <- as.Date(strptime(data$Date,"%d/%m/%Y"))

# Only use data from 2007-02-01 and 2007-02-02.
someData <- subset(data,MyDate>='2007-02-01' & MyDate<='2007-02-02')

# Get a true data and time variable by combining the Date and Time fields...
someData$MyDateTime<-strptime(paste(someData$Date,someData$Time),"%d/%m/%Y %H:%M:%S")

yLabel<-"Global Active Power (kilowatts)"

png("plot2.png",480,480)

plot(someData$MyDateTime,someData$Global_active_power,type="l",ylab=yLabel,xlab="")

dev.off()
