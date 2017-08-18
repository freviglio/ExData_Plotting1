##Read into R the HPC data 
inptab <-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)
##Filter the two dates to be analyzed
filtered <- subset(inptab, Date=="1/2/2007" | Date=="2/2/2007")
##Convert Global active power to numeric
Global_active_power <- as.numeric(filtered$Global_active_power)
##Change Local settings to EN
Sys.setlocale("LC_TIME", "en_US");
##Extract Weekday from Date
datetime <- with(filtered, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
#Direct output to PNG device
png("plot2.png", width=480, height=480)
#Run Plot
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close PNG device
dev.off()
