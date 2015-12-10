# Store the needed data into hhSubData
householdData <- "household_power_consumption.txt"
hhData <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhSubData <- subset(hhData,Date == '1/2/2007' | Date == '2/2/2007')

# Create a formatted data time variable to use in the plot
datetime <- strptime(paste(hhSubData$Date, hhSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create a numeric variable to use in the plot
globalActivePower <- as.numeric(hhSubData$Global_active_power)

# Set device png
png("plot2.png", width=480, height=480)

# Create the plot
# With options:
# Type="l" for lines
# Ylab to set the label for the y-axis
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device
dev.off()