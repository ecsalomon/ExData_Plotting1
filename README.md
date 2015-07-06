## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which Roger Peng has made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb] (also available as household_power_consumption.zip in this repository)

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. The task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.


For each of the four plots, I have:

* Constructed and saved it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Named as `plot1.png`, `plot2.png`, etc.

* Created a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot.Each code file **includes code for reading
the data** so that the plot can be fully reproduced. I have also
included the code that creates the PNG file.

* Added the PNG file and R code file to this git repository


The four plots that needed to be constructed are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png)

This plot is created by plot1.R. This code file:

1. Reads in the data by sourcing readData.R, which contains a function that:
     + Downloads and/or unzips the data if it not present in the working directory
     + Reads in the data
     + Subsets the data used for these plots
     + Creates a `datetime` variable that contains the date and time in POSIXlt format
     + Sets the Date variable to date format
     + Returns the data frame
2. Opens a PNG device
3. Builds the plot
4. Closes the device, saving the plot as plot1.png


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png)


This plot is created by plot2.R. This code file:

1. Reads in the data by sourcing readData.R, which contains a function that:
     + Downloads and/or unzips the data if it not present in the working directory
     + Reads in the data
     + Subsets the data used for these plots
     + Creates a `datetime` variable that contains the date and time in POSIXlt format
     + Sets the Date variable to date format
     + Returns the data frame
2. Opens a PNG device
3. Sets up an empty plot
4. Draws a line connecting each pair of (`datetime`, `Global_active_power`) values
5. Closes the device, saving the plot as plot2.png

### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png)

This plot is created by plot3.R. This code file:

1. Reads in the data by sourcing readData.R, which contains a function that:
     + Downloads and/or unzips the data if it not present in the working directory
     + Reads in the data
     + Subsets the data used for these plots
     + Creates a `datetime` variable that contains the date and time in POSIXlt format
     + Sets the Date variable to date format
     + Returns the data frame
2. Restructures the data into long form so that all of the sub metering values are in a single column, with a variable indicating whether the value comes from `Sub_metering_1`, `Sub_metering_2`, or `Sub_metering_3`
3. Opens a PNG device
4. Sets up an empty plot
5. Draws a black line connecting each pair of (datetime, submetering) values for `Sub_metering_1`
6. Draws a red line connecting each pair of (datetime, submetering) values for `Sub_metering_2`
7. Draws a blue line connecting each pair of (datetime, submetering) values for `Sub_metering_3`
8. Adds a legend showing what each line represents
9. Closes the device, saving the plot as plot3.png


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

This plot is created by plot4.R. This code file:

1. Reads in the data by sourcing readData.R, which contains a function that:
     + Downloads and/or unzips the data if it not present in the working directory
     + Reads in the data
     + Subsets the data used for these plots
     + Creates a `datetime` variable that contains the date and time in POSIXlt format
     + Sets the Date variable to date format
     + Returns the data frame
2. Creates a second data set in long form so that all of the sub metering values are in a single column, with a variable indicating whether the value comes from `Sub_metering_1`, `Sub_metering_2`, or `Sub_metering_3`
3. Opens a PNG device
4. Sets the `mfrow` parameter so that the device will have 4 plots in 2 columns and 2 rows, filling in by row
5. Creates the first plot using the wide format data:
     + Sets up empty plot
     + Draws a line connecting each pair of (`datetime`, `Global_active_power`) values
6. Creates the second plot using the wide format data:
     + Sets up empty plot
     + Draws a line connecting each pair of (`datetime`, `Voltage`) values
7. Creates the third plot using the long format data:
     + Sets up empty plot
     + Draws a black line connecting each pair of (datetime, submetering) values for Sub_metering_1
     + Draws a red line connecting each pair of (datetime, submetering) values for Sub_metering_2
     + Draws a blue line connecting each pair of (datetime, submetering) values for Sub_metering_3
     + Adds a legend showing what each line represents
8. Creates the fourth plot using the wide format data:
     + Sets up empty plot
     + Draws a line connecting each pair of (`datetime`, `Global_reactive_power`) values
9. Closes the device, saving the plot as plot4.png