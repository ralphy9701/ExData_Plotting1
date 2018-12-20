# Plot 3

# Read data (only 1 and 2 February 2007)
power <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                    header = F, na.strings = "?", sep = ";", skip = 66636, nrows = 2880,
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                  "Voltage", "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

# create dates and times
power$dtg <- as.character(with(power, paste(Date, Time), sep = " "))
power$dtg2 <- as.POSIXct(power$dtg, format = "%d/%m/%Y %H:%M:%S")

# create plots
with(power, {
  plot(dtg2, Sub_metering_1, lty = 1, 
       ylab = "Energy sub metering", 
       xlab = "", type = "n")
  lines(dtg2, Sub_metering_1)
  lines(dtg2, Sub_metering_2, col = "red")
  lines(dtg2, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)
})

# copy histogram to png device
dev.copy(png, file = "plot3.png")
dev.off()
