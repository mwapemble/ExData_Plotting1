## common_data_source.R
## Common Data collection script to the
## 4 R Scripts for the first course project
## for the Johns Hopkins "Exploratory Data Analysis"
## Coursera course.
##
## Author: Matthew Pemble
## Github: gothub.com/mwapemble
## Course: exdata-033, 5 Oct 15

## First, initialise variables 

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data.directory <- "data"
zipfile <- "electricconsumption.zip"
datafile <- "household_power_consumption.txt"
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

## Then, load the file

## Check to see if there is a data directory
## If not, create it.
if (!file.exists(data.directory)) {
  dir.create(data.directory)
}

## Fetch file if not already downloaded
tempname <- paste(".", data.directory, zipfile, sep="/")
if (!file.exists(tempname)) 
{
  ## Running on Mac / OSX & target is https, therefore "libcurl" method is required.
  download.file(fileUrl, destfile = tempname, method = "libcurl")
  dateDownloaded.zip <- date()
}

## Extract files from zip archive
datafile <- paste(".", data.directory, datafile, sep="/")
if (!file.exists(datafile))
{
  unzip(tempname, exdir = data.directory)
}

## Then extract & subset to get the relevant data
large_data <- read.table(datafile,header=TRUE,sep=";",na="?")

## Convert date & time fields to POSIX
## Need to add date to time else reads as current date
large_data$Time <- with(large_data,strptime(paste(Date, Time), format="%d/%m/%Y %R"))
large_data$Date <- as.Date(large_data$Date, "%d/%m/%Y")

## Subset and drop very large table
## Of course, you could just assign the result to the original data frame
use_data <- subset(large_data, Date>=startdate & Date <=enddate)
rm(large_data)

## Type assign for relevant variable(s) & convert to required unit(s)

use_data$Global_active_power <- as.numeric(as.character(use_data$Global_active_power))
use_data$Sub_metering_1 <- as.numeric(as.character(use_data$Sub_metering_1))
use_data$Sub_metering_2 <- as.numeric(as.character(use_data$Sub_metering_2))
use_data$Sub_metering_3 <- as.numeric(as.character(use_data$Sub_metering_3))
use_data$Global_reactive_power <- as.numeric(as.character(use_data$Global_reactive_power))
use_data$Voltage <- as.numeric(as.character(use_data$Voltage))
