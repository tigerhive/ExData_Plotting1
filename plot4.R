# Exploratory Data Analysis
# Project 1
# plot 4

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

png("plot4.png",480,480)

par(mfcol=c(2,2))
yLabel<-"Global Active Power"
plot( someData$MyDateTime, someData$Global_active_power, type="l", ylab=yLabel, xlab="")

yLabel<-"Energy Sub Metering"
legendText<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legendColours<-c("black","red","blue")

plot(someData$MyDateTime,  someData$Sub_metering_1,type="l",ylab=yLabel,xlab="")
lines(someData$MyDateTime, someData$Sub_metering_2,type="l",col="red")
lines(someData$MyDateTime, someData$Sub_metering_3,type="l",col="blue")
legend("topright", legendText, col=legendColours, lty=1,lwd=1,bty="n")

yLabel<-"Voltage"
xLabel<-"datetime"
plot( someData$MyDateTime, someData$Voltage, type="l", ylab=yLabel, xlab=xLabel)

yLabel<-"Global_reactive_power"
plot( someData$MyDateTime, someData$Global_reactive_power, type="l", ylab=yLabel, xlab=xLabel)
dev.off()


