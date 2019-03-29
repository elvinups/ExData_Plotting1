# plot3.R

# Get dataset and load it into the variable data (data table)
source("get_and_load_dataset.R")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
houseHoldPowerConsSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create separate variables with content and format used to create the plot
dateAndTime <- strptime(paste(houseHoldPowerConsSubSet$Date, 
                              houseHoldPowerConsSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_1)
Sub_metering_2 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_2)
Sub_metering_3 <- as.numeric(houseHoldPowerConsSubSet$Sub_metering_3)

Sys.setlocale("LC_TIME", "English") # Make sure weekdays are in English

# Draw the plot on the screen
plot(dateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(dateAndTime, Sub_metering_2, col="red")
lines(dateAndTime, Sub_metering_3, col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot to pdf-file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()