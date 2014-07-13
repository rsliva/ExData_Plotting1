# plot4.R
# Creates plot4.png - a 4 panel plot forthe two days 2/1/2007 - 2/2/2007
#   Global Active Power
#   Voltage
#   Energy sub metering
#   Global reactive power


options(StringsAsFactors=F)

# load the source data - it is n the parent directory
hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# create a subset using just two days - 2/1/2007 and 2/2/2007
hpc2 <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]

# remove original data.frame from memory
rm(hpc)

# fix the dates 
hpc2$Date <- as.Date(hpc2$Date,format="%d/%m/%Y")
hpc2$DateTime <- as.POSIXct(paste(hpc2$Date, as.character(hpc2$Time)))

# list of colors to use for sub metering line plot
colList <- c("black","red", "blue")

# create a 4-panel plot
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 4, 4), oma = c(1, 1, 1, 1)) 
with(hpc2, {
    #Global active power
    plot(hpc2$DateTime,hpc2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)" )

    # Voltage
    plot(hpc2$DateTime,hpc2$Voltage,type="l", xlab="datetime", ylab="Voltage")

    #plot the three Sub metering line plots with legend
    plot(hpc2$DateTime,hpc2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering" )
    lines(hpc2$DateTime,hpc2$Sub_metering_2,type="l",col=colList[2])
    lines(hpc2$DateTime,hpc2$Sub_metering_3,type="l",col=colList[3])
    legend("topright", lty = 1, col = colList, legend = names(hpc2)[7:9], bty="n")

    # plot Global reactive power
    plot(hpc2$DateTime,hpc2$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()

