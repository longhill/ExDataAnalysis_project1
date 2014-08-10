##### Plot3
Pdata <- read.table("household_power_consumption.txt", header=T, sep=";")

Pdata$Date <- as.Date(Pdata$Date, format="%d/%m/%Y")

pdf <- Pdata[(Pdata$Date=="2007-02-01") | (Pdata$Date=="2007-02-02"),]

pdf <- transform(pdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

pdf$Sub_metering_1 <- as.numeric(as.character(pdf$Sub_metering_1))
pdf$Sub_metering_2 <- as.numeric(as.character(pdf$Sub_metering_2))
pdf$Sub_metering_3 <- as.numeric(as.character(pdf$Sub_metering_3))

plot(pdf$timestamp,pdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pdf$timestamp,pdf$Sub_metering_2,col="red")
lines(pdf$timestamp,pdf$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())
