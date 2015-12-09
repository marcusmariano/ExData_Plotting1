## Name: Marcus Ney Mariano
## Exploratory Data Analysis
## Peer Assessments: Course Project 1
## File: plot2.R

## set the working directory
setwd("D:/Marcus/Projetos/R/04 - Exploratory Data Analysis/Course Project 1")

## read the data
data  <- read.table("data/household_power_consumption.txt", sep = ";", 
                  na.strings="?", header = TRUE, stringsAsFactors = F)

## data from the dates 2007-02-01 and 2007-02-02
dat  <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)

## format the date

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

plot(dat$Global_active_power, type = "l", xlab = " ", xaxt = "n",
     ylab = "Global Active Power (Kilowatts)")

## format x axis

axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

## Creat a png file

dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()
