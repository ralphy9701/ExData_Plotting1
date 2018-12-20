# Plot 4

# Read data (only 1 and 2 February 2007)
power <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                    header = F, na.strings = "?", sep = ";", skip = 66636, nrows = 2880,
                    col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                  "Voltage", "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

# create dates and times
power$dtg <- as.character(with(power, paste(Date, Time), sep = " "))
power$dtg2 <- as.POSIXct(power$dtg, format = "%d/%m/%Y %H:%M:%S")

# set map area
par(mfrow = c(2, 2))
# 
# with(airquality, {
#   plot(Wind, Ozone, main = "Ozone and Wind")
#   plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
#   mtext("Ozone and Weather in New York City", outer = TRUE)
# })

# create plots
with(power, {
  # Plot 1
  plot(dtg2, Global_active_power, lty = 1, 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "", type = "n")
  lines(dtg2, Global_active_power)
  
  # Plot 2
  plot(dtg2, Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
  lines(dtg2, Voltage)
  
  # Plot 3
  plot(dtg2, Sub_metering_1, lty = 1, 
       ylab = "Energy sub metering", 
       xlab = "", type = "n")
  lines(dtg2, Sub_metering_1)
  lines(dtg2, Sub_metering_2, col = "red")
  lines(dtg2, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)
  
  # Plot 4
  plot(dtg2, Global_reactive_power, xlab = "datetime", 
       ylab = "Global_reactive_power", type = "n")
  lines(dtg2, Global_reactive_power)
})

# copy histogram to png device
dev.copy(png, file = "plot4.png")
dev.off()
