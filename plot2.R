library(sqldf)
library(lubridate)
raw_data <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";")

clean_data <- transform(houseEnergy, timestamp = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)

plot(clean_data$timestamp, clean_data$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab = "")

dev.off()