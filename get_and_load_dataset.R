######################################################################################
# Getting the dataset
######################################################################################

# install.packages("downloader")  # Get package for easier downloading from the Internet
library(downloader) # Load library

# Download and unzip the file
if (!dir.exists("dataset")){
        dir.create("dataset")
}
fileName <- "dataset.zip"

if(!file.exists(fileName)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download(url, dest=fileName, mode="wb") 
}

unzip("dataset.zip", exdir = "dataset")

######################################################################################
# Load dataset with relevant date range into R
######################################################################################

# The dataset has 2,075,259 rows and 9 columns
# We asume that all data is numeric and say that there is 8 bytes/numeric
# By multiplicating 2,075,259 * 9 * 8 = 149 418 648. Approximately 149 MB.
# Concluded that we have enough memory to load the entire data set

data <- read.table("dataset/household_power_consumption.txt", 
                   header=TRUE, 
                   stringsAsFactors = FALSE,
                   sep=";",
                   dec=".")