##### Plot4
Pdata <- read.table("household_power_consumption.txt", header=T, sep=";")

Pdata$Date <- as.Date(Pdata$Date, format="%d/%m/%Y")

pdf <- Pdata[(Pdata$Date=="2007-02-01") | (Pdata$Date=="2007-02-02"),]

pdf$Global_active_power <- as.numeric(as.character(pdf$Global_active_power))
pdf$Global_reactive_power <- as.numeric(as.character(pdf$Global_reactive_power))
pdf$Voltage <- as.numeric(as.character(pdf$Voltage))
pdf <- transform(pdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
pdf$Sub_metering_1 <- as.numeric(as.character(pdf$Sub_metering_1))
pdf$Sub_metering_2 <- as.numeric(as.character(pdf$Sub_metering_2))
pdf$Sub_metering_3 <- as.numeric(as.character(pdf$Sub_metering_3))

par(mfrow=c(2,2))

## 1
plot(pdf$timestamp,pdf$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## 2
plot(pdf$timestamp,pdf$Voltage, type="l", xlab="datetime", ylab="Voltage")

## 3
plot(pdf$timestamp,pdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pdf$timestamp,pdf$Sub_metering_2,col="red")
lines(pdf$timestamp,pdf$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

## 4
plot(pdf$timestamp,pdf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())
