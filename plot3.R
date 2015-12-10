# Store the needed data into hhSubData
householdData <- "household_power_consumption.txt"
hhData <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhSubData <- subset(hhData,Date == '1/2/2007' | Date == '2/2/2007')

# Create a formatted data time variable to use in the graph
datetime <- strptime(paste(hhSubData$Date, hhSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create numeric variables to use in the graph
globalActivePower <- as.numeric(hhSubData$Global_active_power)
subMetering1 <- as.numeric(hhSubData$Sub_metering_1)
subMetering2 <- as.numeric(hhSubData$Sub_metering_2)
subMetering3 <- as.numeric(hhSubData$Sub_metering_3)

# Set device png
png("plot3.png", width=480, height=480)

# Create the graph with sub metering 1
# With options:
# Type="l" for lines
# Ylab to set the label for the y-axis
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# Add sub metering 2 to the graph
lines(datetime, subMetering2, type="l", col="red")
# Add sub metering 3 to the graph
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the device
dev.off()