##Read into R the HPC data 
inptab <-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)
##Filter the two dates to be analyzed
filtered <- subset(inptab, Date=="1/2/2007" | Date=="2/2/2007")
##Change Local settings to EN
Sys.setlocale("LC_TIME", "en_US")
##Extract Weekday from Date
datetime <- with(filtered, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
##Convert metrics to numeric
Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)
Global_active_power <- as.numeric(filtered$Global_active_power)
Global_reactive_power <- as.numeric(filtered$Global_reactive_power)
Voltage <- as.numeric(filtered$Voltage)
#Direct output to PNG device
png("plot4.png", width=480, height=480)
#Define output grid
par(mfrow = c(2, 2))
#Run Plot TopLeft
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Run Plot TopRight
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
#Run Plot BottomLeft
plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
##Add lines Plot BottomLeft
lines(datetime, Sub_metering_1, col = "black")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
#Add legend Plot BottomLeft
legend("topright", lty = 1, cex=0.8, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Run Plot BottomRight
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global reactive power")
#Close PNG device
dev.off()
