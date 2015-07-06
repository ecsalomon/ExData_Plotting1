### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Load required packages
library(reshape)

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Restucture the data to long form with submetering type as a factor, but first
# just take the subset of data needed for the third plot
powerLong <- power[, 7:10]
powerLong <- melt(powerLong, measure.vars = names(powerLong)[1:3])
names(powerLong) <- c("datetime", "type", "submetering")




## Set up the device
png(file = "plot4.png", width = 480, height = 480)


## Set up the canvas for 2 plots x 2 plots, filling by rows
par(mfrow = c(2, 2))


## Create the first plot
with(power, plot(datetime, Global_active_power, type = "n", # set up empty plot
                 ylab = "Global Active Power", # y-axis label
                 xlab="")) # no x-axis label
with(power, lines(datetime, Global_active_power)) # add line

## Create the second plot
with(power, plot(datetime, Voltage, type = "n")) # set up empty plot
with(power, lines(datetime, Voltage)) # add line


## Create the third plot
with(powerLong, plot(datetime, submetering, type = "n", # set up empty plot
                     ylab = "Energy sub metering", # y-axis label
                     xlab="")) # no x-axis label

# Draw a black line connecting each pair of (datetime, submetering) values for
# Sub_metering_1
with(subset(powerLong, type == "Sub_metering_1"), lines(datetime, submetering))

# Draw a red line connecting each pair of (datetime, submetering) values for
# Sub_metering_2
with(subset(powerLong, type == "Sub_metering_2"), lines(datetime, submetering,
                                                        col = "red"))

# Draw a blue line connecting each pair of (datetime, submetering) values for
# Sub_metering_3
with(subset(powerLong, type == "Sub_metering_3"), lines(datetime, submetering,
                                                        col = "blue"))

# Make a legend
legend("topright", # position it in the top right
       lwd = c(1, 1, 1), # three lines of width one
       col = c("black", "red", "blue"), # set their colors
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n") # no border

## Create the fourth plot
with(power, plot(datetime, Global_reactive_power, type = "n")) # set up empty plot
with(power, lines(datetime, Global_reactive_power))

dev.off()