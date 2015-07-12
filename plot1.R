## plot1.R
powerConsumption <- read.csv("household_power_consumption.txt", sep=";")
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

## Subset the data
febDates <- subset(powerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
febDates$Global_active_power <- as.numeric(as.character(febDates$Global_active_power))

## Construct the plot and save it to a PNG file named plot1.png with a width of 480 pixels and a height of 480 pixels.
png(file.path("plot1.png"), width = 480, height = 480)
## Create the histogram, set color, x label, and main label
hist(febDates$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()