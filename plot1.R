# Store the needed data into hhSubData
householdData <- "household_power_consumption.txt"
hhData <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhSubData <- subset(hhData,Date == '1/2/2007' | Date == '2/2/2007')

# Create a numeric variable to plot
globalActivePower <- as.numeric(hhSubData$Global_active_power)

# Set device png
png("plot1.png", width=480, height=480)

# Create the histogram
# Used Options:
# col='red' to fill the bars
# xlab to set the label of the x-as
# main to set the title
hist(globalActivePower, col='red', xlab='Global Active power (Kilowatts)', main=paste('Global Active Power'))

# Close the device
dev.off()


