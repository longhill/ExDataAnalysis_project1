#####plot1 - Active Power
Pdata <- read.table("household_power_consumption.txt", header=T, sep=";")

Pdata$Date <- as.Date(Pdata$Date, format="%d/%m/%Y")

pdf <- Pdata[(Pdata$Date=="2007-02-01") | (Pdata$Date=="2007-02-02"),]
pdf$Global_active_power <- as.numeric(as.character(pdf$Global_active_power))

hist(pdf$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())
