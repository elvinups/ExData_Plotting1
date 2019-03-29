# plot2.R

# Get dataset and load it into the variable data (data table)
source("get_and_load_dataset.R")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
houseHoldPowerConsSubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create separate variables with content and format used to create the plot
dateAndTime <- strptime(paste(houseHoldPowerConsSubSet$Date, 
                              houseHoldPowerConsSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(houseHoldPowerConsSubSet$Global_active_power)

Sys.setlocale("LC_TIME", "English") # Make sure weekdays are in English

# Draw the plot on the screen
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save plot to pdf-file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()