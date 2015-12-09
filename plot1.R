## Name: Marcus Ney Mariano
## Exploratory Data Analysis
## Peer Assessments: Course Project 1
## File: plot1.R

## set the working directory
setwd("D:/Marcus/Projetos/R/04 - Exploratory Data Analysis/Course Project 1")

## read the data
data  <- read.csv("data/household_power_consumption.txt", sep = ";", 
                  na.strings="?", header = TRUE, stringsAsFactors = F)

## data from the dates 2007-02-01 and 2007-02-02
dat  <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)

## format the date

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

## Plot a histogram

hist(dat$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

## Creata a png file

dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()
