# Plot 2

# Read data (only 1 and 2 February 2007)
power <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                    header = F, na.strings = "?", sep = ";", skip = 66636, nrows = 2880,
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                  "Voltage", "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

# create dates and times
power$dtg <- as.character(with(power, paste(Date, Time), sep = " "))
power$dtg2 <- as.POSIXct(power$dtg, format = "%d/%m/%Y %H:%M:%S")

# create plot
with(power, {
  plot(dtg2, Global_active_power, lty = 1, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "n")
  lines(dtg2, Global_active_power)
})

# copy histogram to png device
dev.copy(png, file = "plot2.png")
dev.off()
