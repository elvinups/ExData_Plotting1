# plot1.R

# Get dataset and load it into the variable data (data table)
source("get_and_load_dataset.R")

houseHoldPowerCons <- data

# Convert the columns to date and time objects
houseHoldPowerCons$Date <- as.Date(houseHoldPowerCons$Date, "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# Subset the dataset to work with to one between these dates
fromDate <- as.Date("2007-02-01")
toDate <- as.Date("2007-02-02")

# creating a data range with the start and end date:
dates <- seq(fromDate, toDate, by="days")

houseHoldPowerConsSubSet <- subset(houseHoldPowerCons, Date %in% dates)

# Draw the plot on the screen
hist(as.numeric(as.character(houseHoldPowerConsSubSet$Global_active_power)), col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Save plot to pdf-file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()