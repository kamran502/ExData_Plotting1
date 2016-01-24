#Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Grab only data that we are interested in
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#convert to numeric
mydata <- as.numeric(mydata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(mydata, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()