#reading in the csv file
energy_dat <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE,comment.char = "",quote = '\"')

#Converting the dates in the file into DATE format
energy_dat$Date <- as.Date(energy_dat$Date,format = "%d/%m/%Y")

#subsetting out the required data
energy_new <-subset(energy_dat,subset = (Date >="2007-02-01" & Date <= "2007-02-02"))

#Formatting Date and time
energy_new$DateTime <- paste(energy_new$Date , energy_new$Time)
energy_new$DateTime <- as.POSIXct(energy_new$DateTime)

#plotting the data

with(energy_new, {
     plot(Sub_metering_1~DateTime, type="l",
                 ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~DateTime,col='Red')
     lines(Sub_metering_3~DateTime,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png",height = 500 ,width = 500)
dev.off()