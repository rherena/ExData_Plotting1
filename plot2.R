setwd("~/Documents/Assignment-1-exdata-004/ExData_Plotting1")


if ( !file.exists("data")) {
        dir.create("data")
}

### if the files have not been downloaded bring them in and unzip
if ( !file.exists("./data/household_power_consumption.txt")){
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./data/Power.zip", method = "curl")
unzip("./data/Power.zip", exdir = "./data")
}

columnval <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

powerdata<- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", nrows = 70000, colClasses = columnval, na.string = "?")

powerdata[, 1] <- as.Date(powerdata[, 1],format = "%d/%m/%Y")




## Subsets the data required
SelectedData <- subset(powerdata, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 

### Need to alter the data incorporate the time in the date and change the date to thur friday sat. 
time <- as.character(SelectedData$Time)
date <- as.character(SelectedData$Date)
datetime <- paste(date, time)
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")


## Create plots
png(file = "plot2.png", width=480,height=480,units='px')

### Creates the plot specific that is being saved.
plot(datetime,SelectedData$Global_active_power, ylab= "Global Active Power (kilowatts)", xlab = "", type= "l")

dev.off()

