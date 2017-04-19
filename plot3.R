library(sqldf)
library(lubridate)
raw_data <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";")

clean_data <- transform(houseEnergy, timestamp = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480)

plot(clean_data$timestamp, clean_data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab= "")

with(clean_data, points(timestamp, Sub_metering_1,type = "l", col="black"))
with(clean_data, points(timestamp, Sub_metering_2,type = "l", col="red"))
with(clean_data, points(timestamp, Sub_metering_3,type = "l", col="blue"))

legend("topright", lty=1, col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()