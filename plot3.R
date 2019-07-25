#plot3
library(dplyr) 

# get data
dat <- tbl_df(read.table("data/household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

# create truncated dataset by subsetting specified dates
data <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

# remove dat from environment to free up RAM
rm(dat)

# convert date and time to proper formats
data$Date     <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)

data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")


# create plot 

png(file = "plot3.png", width = 480, height = 480)
plot(x = data$Time, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x = data$Time, y = data$Sub_metering_2 , type ="l" , col ="red" )
lines(x = data$Time, y = data$Sub_metering_3 , type = "l" , col ="blue" )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = 20 , col = c("Black","red","Blue"))
dev.off()