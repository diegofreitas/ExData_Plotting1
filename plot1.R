library(sqldf)
library(lubridate)
houseEnergy <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";")

png(filename = "plot1.png", width = 480, height = 480)

hist(x=clean_data$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()