# plot4.R

# Get dataset and load it into the variable data (data table)
source("get_and_load_dataset.R")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
houseHoldPowerConsSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Sys.setlocale("LC_TIME", "English") # Make sure weekdays are in English

# Create separate variables with content and format used to create the plot
dateAndTime <- strptime(paste(houseHoldPowerConsSubSet$Date, 
                              houseHoldPowerConsSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Set global mfrow to show multiple plots at the same time
par(mfrow = c(2,2))

# Set global mar to increase marigns around the plots
par(mar = c(4,4,4,4))

## Draw plots on the screen

# First plot (similar to plot 2)
globalActivePower <- as.numeric(houseHoldPowerConsSubSet$Global_active_power)
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Second plot
voltage <- as.numeric(houseHoldPowerConsSubSet$Voltage)
plot(dateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Third plot (similar to plot 3)
Sub_metering_1 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_1)
Sub_metering_2 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_2)
Sub_metering_3 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_3)

plot(dateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(dateAndTime, Sub_metering_2, col="red")
lines(dateAndTime, Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot
globalReactivePower <- as.numeric(houseHoldPowerConsSubSet$Global_reactive_power)
plot(dateAndTime, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

# Save plots to pdf-file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
