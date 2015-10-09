## plot2.R
## No 2 of 4 R Scripts for the first course project
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
png(filename="plot2.png", width=pngsize, height=pngsize)

## Create Plot
with(use_data,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

## Close device
dev.off()