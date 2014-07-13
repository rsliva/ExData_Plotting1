# plot2.R
# Creates plot2.png - a line plot of global active power for the two days 2/1/2007 - 2/2/2007

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

# create line chart and save as plot2.png
png("plot2.png", width = 480, height = 480)
plot(hpc2$DateTime,hpc2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)" )
dev.off()
