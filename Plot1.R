# Plot 1

# Read data (only 1 and 2 February 2007)
power <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                    header = F, na.strings = "?", sep = ";", skip = 66636, nrows = 2880,
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                  "Voltage", "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

# create histogram
hist(power$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# copy histogram to png device
dev.copy(png, file = "plot1.png")
dev.off()

