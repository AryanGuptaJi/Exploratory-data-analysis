file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(reqdata$Global_active_power)
GRP <- as.numeric(reqdata$Global_reactive_power)
Voltage <- as.numeric(reqdata$Voltage)
subMet1 <- as.numeric(reqdata$Sub_metering_1)
subMet2 <- as.numeric(reqdata$Sub_metering_2)
subMet3 <- as.numeric(reqdata$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, GAP, type = "l",xlab = "", ylab = "Global Active Power")

plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMet1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= , lwd=2.5, col=c("black", "red", "blue"),bty="n")

plot(datetime, GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()