#reading in the csv file
energy_dat <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE,comment.char = "",quote = '\"')

#Converting the dates in the file into DATE format
energy_dat$Date <- as.Date(energy_dat$Date,format = "%d/%m/%Y")

#subsetting out the required data
energy_new <-subset(energy_dat,subset = (Date >="2007-02-01" & Date <= "2007-02-02"))

#Formatting Date and time
energy_new$DateTime <- paste(energy_new$Date , energy_new$Time)
energy_new$DateTime <- as.POSIXct(energy_new$DateTime)

#Plotting the histogram of Global Active Power
with(energy_new,plot(Global_active_power~DateTime, type = "S", xlab = "",ylab = "Global Active power(Kilowatts"))

#saving it to a  file
dev.copy(png,"plot2.png",height = 500 ,width = 500)
dev.off()