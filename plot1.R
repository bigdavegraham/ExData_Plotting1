#read our data in and convert date and time columns to usable Date objects.
#SET YOUR WORKING DIRECTORY to the directory containing the household_power_consumption.txt file first!!! 
dat <-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')

dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

#Get only the days we are interested in
obsset <- dat[dat$Date>="2007-02-01" & dat$Date<="2007-02-02",]

#Build our plot
png('plot1.png',width = 480, height = 480, units = "px")
hist(obsset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()