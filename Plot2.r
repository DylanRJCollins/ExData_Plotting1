#Load Household Power Data
power<- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#Subset only the required dates: 2007-02-01 and 2007-02-02
power_plots<- power[(power$Date == "2007-02-01" | power$Date== "2007-02-02"),]

#Plot 
png("Plot2.png")
power_plots$Time <- gsub(":", "-", power_plots$Time)
power_plots$datetime <- strptime(paste(power_plots$Date, power_plots$Time, sep="-"), "%Y-%m-%d-%H-%M-%S")
power_plots$Day<-weekdays(as.Date(power_plots$Date,'%d-%m-%Y'))
plot(x=power_plots$datetime, y=power_plots$Global_active_power, xlab="", ylab= "Global Active Power (kilowatts)", type="l")
dev.off()
