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
with(power, plot(datetime, Global_active_power, type = "n",
                 ylab = "Global Active Power",
                 xlab=""))
with(power, lines(datetime, Global_active_power))

## Create the second plot
with(power, plot(datetime, Voltage, type = "n"))
with(power, lines(datetime, Voltage))


## Create the third plot
with(powerLong, plot(datetime, submetering, type = "n",
                     ylab = "Energy sub metering",
                     xlab=""))
with(subset(powerLong, type == "Sub_metering_1"), lines(datetime, submetering))
with(subset(powerLong, type == "Sub_metering_2"), lines(datetime, submetering,
                                                        col = "red"))
with(subset(powerLong, type == "Sub_metering_3"), lines(datetime, submetering,
                                                        col = "blue"))
legend("topright", lwd = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")

## Create the fourth plot
with(power, plot(datetime, Global_reactive_power, type = "n"))
with(power, lines(datetime, Global_reactive_power))

dev.off()