#Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Grab only data that we are interested in
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert to numeric
mydata <- as.numeric(mydata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, mydata, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()