# plot1.R
# Creates plot1.png - a frequency histogram of global active power for the days 2/1/2007 - 2/2/2007

options(StringsAsFactors=F)

# load the source data - it is n the parent directory
hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# create a subset using just two days - 2/1/2007 and 2/2/2007
hpc2 <- hpc[(hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"),]

# remove original data.frame from memory
rm(hpc)

# create histogram and save as plot1.png using png driver
png(filename=paste(getwd(),"/plot1.png",sep=""), width = 480, height = 480)
hist(hpc2$Global_active_power, main="Global Active Power",  
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

