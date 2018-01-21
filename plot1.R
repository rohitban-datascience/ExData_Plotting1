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
hist(energy_new$Global_active_power,main = "Global_Active_Power",xlab = "Global_Active_Power(Killowatts)",ylab = "Frequency",col = "Red")

#Copying the histogram to a png file
dev.copy(png,file = "plot1.png",height = 500, width = 500)

#closing off the connection 
dev.off()