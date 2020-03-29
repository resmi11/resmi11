temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), dec=".", na.strings="?")
unlink(temp)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %X")
data <- data[,c(ncol(data), 3:(ncol(data)-1))]
data <- data[!is.na(data$DateTime) & data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime < as.POSIXct("2007-02-03"), ]

png("plot2.png")
with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off() 
