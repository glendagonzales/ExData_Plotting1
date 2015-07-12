## plot2.R
powerConsumption <- read.csv("household_power_consumption.txt", sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

## Subset the data
febDates <- subset(powerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
febDates$DateTime <- as.POSIXct(paste(febDates$Date, febDates$Time), format = "%Y-%m-%d %H:%M:%S")

## Make sure the data is in the correct format 
febDates$Global_active_power <- as.numeric(as.character(febDates$Global_active_power))

## Construct the plot and save it to a PNG file named plot1.png with a width of 480 pixels and a height of 480 pixels.
png(file.path("plot2.png"), width = 480, height = 480)
## Create the line plot and y label
with(febDates, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()