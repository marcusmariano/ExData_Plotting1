## Name: Marcus Ney Mariano
## Exploratory Data Analysis
## Peer Assessments: Course Project 1
## File: plot3.R

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

par(mar = c(2, 4, 2, 2), oma = c(0, 0, 2, 0))


plot(dat$Sub_metering_1, type = "n", xaxt = "n", xlab = " ",
     ylab = "Energy sub metering")

## format x axis
axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

points(dat$Sub_metering_1,type = "l", col = "black")
points(dat$Sub_metering_2,type = "l", col = "red")
points(dat$Sub_metering_3,type = "l", col = "blue")


legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
    "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")

## Creat a png file

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()
