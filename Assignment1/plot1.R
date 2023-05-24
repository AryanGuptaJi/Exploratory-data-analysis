file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
reqdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

GAP <- as.numeric(reqdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active power", xlab = "Global Active Power (Kilowatts)")
dev.off()