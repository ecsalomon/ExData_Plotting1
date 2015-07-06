### Coursera Exploratory Data Analysis -- Project 1
### Function to create Plot 1

## Read in the data
source("readData.R")
power <- data.frame(readData())


## Create the histogram
png(file = "plot2.png", width = 480, height = 480)
with(power, plot(datetime, Global_active_power, type = "n",
                 ylab = "Global Active Power (kilowatts)",
                 xlab=""))
with(power, lines(datetime, Global_active_power))
dev.off()