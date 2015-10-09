## plot4.R
## No 4 of 4 R Scripts for the first course project
## for the Johns Hopkins "Exploratory Data Analysis"
## Coursera course.
##
## Author: Matthew Pemble
## Github: gothub.com/mwapemble
## Course: exdata-033, 5 Oct 15

## First, initialise variables 
pngsize = 480

## Then use the common data source to output use-data
source("common_data_source.R")

## Format output device
png(filename="plot4.png", width=pngsize, height=pngsize)

## Create Plot Layout
par(mfrow=c(2,2))

## Create Plots

with(use_data,{
  ## From plot2.R
  plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  ## First new plot 
  ## Note - because we haven't created a new "datetime" variable, we need to
  ## explicitly label this.
  plot(Time,Voltage,type="l",xlab="datetime")
  
  ## From plot3.R
  plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(Time,Sub_metering_2,type="l",col="red")
  lines(Time,Sub_metering_3,type="l",col="blue")
  ## The selection from the table headers still works within the with() function
  ## And note the sneaky change - no box around the legend!
  legend("topright", lty=1, lwd=2, bty="n",col=c("black","red","blue"), legend = names(use_data[7:9]))
  
  ## Second new plot
  plot(Time,Global_reactive_power,type="l",xlab="datetime")
})

## Close device
dev.off()
