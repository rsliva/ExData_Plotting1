# plot3.R
# Creates plot3.png - a multi-variable line plot of Sub metering values 
# during the 2 days 2/1/2007 - 2/2/2007

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

# list of colors to use for plot/legend
colList <- c("black","red", "blue")

# create line chart and save as plot2.png
png("plot3.png", width = 480, height = 480)

#plot the three line plots with legend
plot(hpc2$DateTime,hpc2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering" )
lines(hpc2$DateTime,hpc2$Sub_metering_2,type="l",col=colList[2])
lines(hpc2$DateTime,hpc2$Sub_metering_3,type="l",col=colList[3])

legend("topright", lty = 1, col = colList, legend = names(hpc2)[7:9])

dev.off()