### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Load required packages
library(reshape)

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Restucture the data to long form with submetering type as a factor, but first
# just take the subset of data needed for this plot
power <- power[, 7:10]
power <- melt(power, measure.vars = names(power)[1:3])
names(power) <- c("datetime", "type", "submetering")


## Create the histogram
png(file = "plot3.png", width = 480, height = 480) # open a 480 x 480 PNG device
with(power, plot(datetime, submetering, type = "n", # set up empty plot
                 ylab = "Energy sub metering", # y-axis label
                 xlab="")) # no x-axis label

# Draw a black line connecting each pair of (datetime, submetering) values for
# Sub_metering_1
with(subset(power, type == "Sub_metering_1"), lines(datetime, submetering))

# Draw a red line connecting each pair of (datetime, submetering) values for
# Sub_metering_2
with(subset(power, type == "Sub_metering_2"), lines(datetime, submetering, 
                                                    col = "red"))

# Draw a blue line connecting each pair of (datetime, submetering) values for
# Sub_metering_3
with(subset(power, type == "Sub_metering_3"), lines(datetime, submetering, 
                                                    col = "blue"))

# Add a legend
legend("topright", # put it in the top right corner
       lwd = c(1, 1, 1), # three lines of width 1
       col = c("black", "red", "blue"), # lines are black, red, and blue
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off() # close the device