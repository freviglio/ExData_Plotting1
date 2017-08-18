##Read into R the HPC data 
inptab <-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)
##Filter the two dates to be analyzed
filtered <- subset(inptab, Date=="1/2/2007" | Date=="2/2/2007")
##Change Local settings to EN
Sys.setlocale("LC_TIME", "en_US");
##Extract Weekday from Date
datetime <- with(filtered, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
##Convert Sub_meterings to numeric
Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)
#Direct output to PNG device
png("plot3.png", width=480, height=480)
##Create blank plot
plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
##Add lines
lines(datetime, Sub_metering_1, col = "black")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
#Add legend
legend("topright", lty = 1, cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Close PNG device
dev.off()
