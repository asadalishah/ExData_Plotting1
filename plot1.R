# plot1
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

# substting the data
library(dplyr)
library(lubridate)
df <- df_raw %>% mutate(Date = dmy(Date)) %>% 
  mutate(Time = hms(Time)) %>% 
  filter(Date == "2007-02-01" | Date == "2007-02-02")

# plot
hist(df$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")

# to png
png("plot1.png", width=480, height=480)
dev.off()