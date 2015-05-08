library(sqldf)
df <- read.csv.sql("household_power_consumption.txt", sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";")
datetime <- strptime(paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfcol = c(2,2))

plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 3, lty = 1)

plot(datetime, df$Voltage, ylab="Voltage", type="l")

plot(datetime, df$Global_reactive_power, ylab="Global_reactive_power", type="l")

dev.off()
