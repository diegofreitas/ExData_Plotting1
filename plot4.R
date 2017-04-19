library(sqldf)
library(lubridate)
raw_data <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";")

clean_data <- transform(houseEnergy, timestamp = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow= c(2,2), mar= c(5,5,1,1))

with(clean_data,{
  plot(timestamp, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
  
  plot(timestamp, Voltage, type="l", ylab = "Voltage", xlab = "datetime")
  
  
  plot(timestamp, clean_data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab= "")
  points(timestamp, Sub_metering_1,type = "l", col="black")
  points(timestamp, Sub_metering_2,type = "l", col="red")
  points(timestamp, Sub_metering_3,type = "l", col="blue")
  legend("topright", lty=1, col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty  ="n" )
  
  plot(timestamp, Global_reactive_power, type="l", xlab = "datetime")
})

dev.off()