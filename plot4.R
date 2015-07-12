## plot4.R
powerConsumption <- read.csv("household_power_consumption.txt", sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

## Subset the data
febDates <- subset(powerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
febDates$DateTime <- as.POSIXct(paste(febDates$Date, febDates$Time), format = "%Y-%m-%d %H:%M:%S")

## Make sure the data is in the correct format 
febDates$Global_active_power <- as.numeric(as.character(febDates$Global_active_power))
febDates$Global_reactive_power <- as.numeric(as.character(febDates$Global_reactive_power))
febDates$Voltage <- as.numeric(as.character(febDates$Voltage))
febDates$Sub_metering_1 <- as.numeric(as.character(febDates$Sub_metering_1))
febDates$Sub_metering_2 <- as.numeric(as.character(febDates$Sub_metering_2))
febDates$Sub_metering_3 <- as.numeric(as.character(febDates$Sub_metering_3))

## Construct the plot and save it to a PNG file named plot1.png with a width of 480 pixels and a height of 480 pixels.
png(file.path("plot4.png"), width = 480, height = 480)
par(mfrow = c(2, 2))
with(febDates, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
with(febDates, plot(DateTime, Voltage, type = "l", xlab = "datetime"))
with(febDates, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(febDates, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(febDates, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty= c(1,1),  col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(febDates, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()

