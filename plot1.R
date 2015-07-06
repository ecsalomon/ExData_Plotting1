### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Create the histogram
png(file = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()