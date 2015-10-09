## plot1.R
## No 1 of 4 R Scripts for the first course project
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
png(filename="plot1.png", width=pngsize, height=pngsize)

## Create Plot
hist(use_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Close device
dev.off()