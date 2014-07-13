setwd("~/Data/datasciencecoursera/DataAnalysis/Assignment 1/ExData_Plotting1")


if ( !file.exists("data")) {
        dir.create("data")
}



fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


download.file(fileurl, destfile = "./data/Power.zip", method = "curl")
unzip("./data/Power.zip", exdir = "./data")



powerdata<- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", nrows = 70000, colClasses = "character")

powerdata[, 1] <- as.Date(powerdata[, 1],format = "%d/%m/%Y")

powerdata[, 3] <- as.numeric(powerdata[, 3])

SelectedData <- subset(powerdata, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 

png(file = "plot1.png")
hist(SelectedData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

