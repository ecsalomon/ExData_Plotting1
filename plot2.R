### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Create the histogram
png(file = "plot2.png", width = 480, height = 480) # open a 480 x 480 PNG device
with(power, plot(datetime, Global_active_power, type = "n", # set up an empty plot
                 ylab = "Global Active Power (kilowatts)", # y-axis label
                 xlab="")) # no x-axis label
with(power, lines(datetime, Global_active_power)) # draw lines connecting values
dev.off() # close the device