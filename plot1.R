if (!file.exists("data/UC Irvine Machine Learning Repository")) {
        # download the data
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile="data/UC_Irvine_Machine_Learning.zip"
        message("Downloading data")
        download.file(fileURL, destfile=zipfile, method="curl")
        unzip(zipfile, exdir="data")
}

# Read in the data 

  test.data <- read.table( 'data/household_power_consumption.txt', header = TRUE, sep = ";")

 realdata <- transform(subset(test.data, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%y"),"%Y-%m-%d"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
 GACTP<- as.numeric(as.character(realdata$Global_active_power))
 
 # create hist
 png(file = "plot1.png", width = 480, height = 480)
 hist(GACTP, xlab = "Global Active Power (Kilowats)", col="Red", main = "Global Active Power", font=3)
 dev.off()

