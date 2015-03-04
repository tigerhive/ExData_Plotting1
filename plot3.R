# Exploratory Data Analysis
# Project 1
# plot 3

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

yLabel<-"Energy Sub Metering"
legendText<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legendColours<-c("black","red","blue")

png("plot3.png",480,480)

par(mfcol=c(1,1))
plot(someData$MyDateTime, someData$Sub_metering_1,type="l",ylab=yLabel,xlab="")
lines(someData$MyDateTime, someData$Sub_metering_2,type="l",col="red")
lines(someData$MyDateTime, someData$Sub_metering_3,type="l",col="blue")
legend("topright", legendText, col=legendColours, lty=1,lwd=1)

dev.off()

