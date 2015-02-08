#read our data in and convert date and time columns to usable Date objects.
#SET YOUR WORKING DIRECTORY to the directory containing the household_power_consumption.txt file first!!! 
dat <-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

obsset <- dat[dat$Date>="2007-02-01" & dat$Date<="2007-02-02",]

#I have no idea why we can't get the day labels on the x axis.
png('plot2.png',width = 480, height = 480, units = "px")
plot(obsset$Date, obsset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()