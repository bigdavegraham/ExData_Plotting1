#read our data in and convert date and time columns to usable Date objects.
#SET YOUR WORKING DIRECTORY to the directory containing the household_power_consumption.txt file first!!! 
dat <-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

obsset <- dat[dat$Date>="2007-02-01" & dat$Date<="2007-02-02",]

#I have no idea why we can't get the day labels on the x axis.
png('plot4.png',width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(obsset$Date, obsset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(obsset$Date, obsset$Voltage, type="l",xlab="", ylab="Voltage")
plot(obsset$Date, obsset$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(obsset$Date, obsset$Sub_metering_2, type="l", col="red")
lines(obsset$Date, obsset$Sub_metering_3, type="l", col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
plot(obsset$Date, obsset$Global_reactive_power, type="l",xlab="", ylab="Global_reactive_power")
dev.off()