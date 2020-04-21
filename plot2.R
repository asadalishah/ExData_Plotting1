# plot2
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
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$datetime <- as.POSIXct(datetime)

# plot 2 creation
with(df, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


# saving plot2 as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()