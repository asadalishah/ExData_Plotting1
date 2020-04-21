# plot3
# checking if achieve already exist
courseFile <- "Electric Power Consumption.zip"
if(!file.exists(courseFile)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, courseFile)
}

# checking if folder exists
if (!file.exists("EPC")) { #EPC stands for Electric Power Consumption 
  unzip(courseFile) 
}

# reading the data
library(readr)
df_raw <- read_delim("household_power_consumption.txt", delim = ";")

df <- subset(df_raw, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
globalReactivePower <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

# plot 3 creation
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()