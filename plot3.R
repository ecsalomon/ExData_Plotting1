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
names(power) <- c("dateTime", "type", "submetering")


## Create the histogram
png(file = "plot3.png", width = 480, height = 480)
with(power, plot(dateTime, submetering, type = "n",
                 ylab = "Energy sub metering",
                 xlab=""))
with(subset(power, type == "Sub_metering_1"), lines(dateTime, submetering))
with(subset(power, type == "Sub_metering_2"), lines(dateTime, submetering, 
                                                    col = "red"))
with(subset(power, type == "Sub_metering_3"), lines(dateTime, submetering, 
                                                    col = "blue"))
legend("topright", lwd = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()