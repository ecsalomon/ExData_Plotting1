### Coursera Exploratory Data Analysis -- Project 1
### Function to read the power consumption data to a data frame. If the file is
### not present in the working directory, it will download and extract the data.

readData <- function() {
  # Is the file absent? If so, download and unzip the data
  if (!file.exists("household_power_consumption.txt")) {
    URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(URL, "household_power_consumption.zip", method = "curl")
    unzip("household_power_consumption.zip")
  }
  # Read in the data, subset the dates of interest, 
  # and set the date and time data types
  power <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?")
  power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
  power$dateTime <- strptime(paste(power$Date, power$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
  power$Date  <- as.Date(power$Date, format = "%d/%m/%Y")
  return(power)
}




 