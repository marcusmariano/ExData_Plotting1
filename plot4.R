## plot4.R
## By Marcus Ney Mariano

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

par(mfrow = c(2, 2))
##par(mar = rep(2, 2))

##Plot 1
par(mar = c(4, 4, 2, 2))
plot(dat$Global_active_power, type = "l", xaxt = "n", xlab = " ",
     ylab = "Global Active Power (Kilowatts)")

axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

##Plot 2

par(mar = c(4, 4, 2, 2))
plot(dat$Voltage, type = "l", xaxt = "n", xlab = "datetime",
     ylab = "Voltage")

axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

##Plot 3

par(mar = c(4, 4, 1, 1))

plot(dat$Sub_metering_1, type = "n", xaxt = "n", xlab = " ",
     ylab = "Energy sub metering")

axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

points(dat$Sub_metering_1,type = "l", col = "black")
points(dat$Sub_metering_2,type = "l", col = "red")
points(dat$Sub_metering_3,type = "l", col = "blue")


##Sys.setlocale("LC_TIME", "Portuguese_Brazil.1252")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid", 
      x.intersp = 2, y.intersp = 0.5, text.width = 1550,  bty = "n")

##Plot 4

par(mar = c(4, 4, 2, 2))
plot(dat$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime",
     ylab = "Global_reactive_power")

axis(1, at = c( 1, length(dat$Date) / 2, length(dat$Date)), labels = c("thur", 
    "fri", "sat"), las = 0)

## Creat a png file

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

