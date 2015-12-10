# Store the needed data into hhSubData
householdData <- "household_power_consumption.txt"
#hhData <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhSubData <- subset(hhData,Date == '1/2/2007' | Date == '2/2/2007')

# Create a formatted data time variable to use in the plot
datetime <- strptime(paste(hhSubData$Date, hhSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create numeric variables to use in the plot
globalActivePower <- as.numeric(hhSubData$Global_active_power)
subMetering1 <- as.numeric(hhSubData$Sub_metering_1)
subMetering2 <- as.numeric(hhSubData$Sub_metering_2)
subMetering3 <- as.numeric(hhSubData$Sub_metering_3)
voltage <- as.numeric(hhSubData$Voltage)
globalReactivePower <- as.numeric(hhSubData$Global_reactive_power)

# Set device png
png("plot4.png", width=480, height=480)

# Set a 2 * 2 format for the graph on the device
par(mfrow = c(2, 2)) 

# Create the different graphs
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()