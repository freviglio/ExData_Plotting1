##Unzip dowloaded file
unzip("household_power_consumption.zip")
##Load file in a data frame
inptab <-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)
##Filter the two dates to be analyzed
filtered <- subset(inptab, Date=="1/2/2007" | Date=="2/2/2007")
##Convert Global active power to numeric
filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
##Copy graph to a PNG file
png("plot1.png", width=480, height=480)
##Create Histogram with annotations
hist(filtered$Global_active_power, xlab = "Global active power (kilowatts)", main="Global Active Power", col="red")
##Close PNG device
dev.off()
