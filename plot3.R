## plot3.R
## No 3 of 4 R Scripts for the first course project
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
png(filename="plot3.png", width=pngsize, height=pngsize)

## Create Plot
with(use_data, {
  plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(Time,Sub_metering_2,type="l",col="red")
  lines(Time,Sub_metering_3,type="l",col="blue")
})
## Legend extracting names from the table header. 
  legend("topright", lty=1, lwd=2, col=c("black","red","blue"), legend = names(use_data[7:9]))

## Close device
dev.off()
