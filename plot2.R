##### Plot2.R
Pdata <- read.table("household_power_consumption.txt", header=T, sep=";")

Pdata$Date <- as.Date(Pdata$Date, format="%d/%m/%Y")

pdf <- Pdata[(Pdata$Date=="2007-02-01") | (Pdata$Date=="2007-02-02"),]
pdf$Global_active_power <- as.numeric(as.character(pdf$Global_active_power))


pdf <- transform(pdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(pdf$timestamp,pdf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())
