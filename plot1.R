### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Create the histogram
png(file = "plot1.png", width = 480, height = 480) # open a 480 x 480 PNG device
hist(power$Global_active_power, 
     col = "red", # set the color of the bars to red
     main = "Global Active Power", # give the plot a title
     xlab = "Global Active Power (kilowatts)") # label the x-axis
dev.off() # close the device