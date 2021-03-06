#Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Grab only data that we are interested in
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
set1 <- as.numeric(mydata$Sub_metering_1)
set2 <- as.numeric(mydata$Sub_metering_2)
set3 <- as.numeric(mydata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, set1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, set2, type="l", col="red")
lines(datetime, set3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()