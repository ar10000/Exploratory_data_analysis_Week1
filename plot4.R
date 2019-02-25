data <- read.table("~/Desktop/RProgramming/ExplDatAn_W1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
UsefulData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste (UsefulData$Date, UsefulData$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(UsefulData$Global_active_power)
GlobalReactivePower <- as.numeric(UsefulData$Global_reactive_power)
voltage <- as.numeric((UsefulData$Voltage))
sub1 <- as.numeric(UsefulData$Sub_metering_1)
sub2 <- as.numeric(UsefulData$Sub_metering_2)
sub3 <- as.numeric(UsefulData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()