# url to zip file with raw data, unzip and download
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempdata <- tempfile()
download.file(url, tempdata)

# read the file, and insert it into a table
data <- read.csv(unzip(tempdata), sep=";", header=TRUE, dec='.', stringsAsFactors=FALSE)
library(data.table)
dt <- data.table(date={as.Date(data[,1], format="%d/%m/%Y")},gpower=as.numeric(data[,3]))
dtdates <- dt[date == "2007-02-01" | date == "2007-02-02"]
dt3 <- dtdates[[2]]

## Create plot in screen device, and copy to the png file
window()
hist(dt3, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()