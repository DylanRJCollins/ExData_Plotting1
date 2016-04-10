#Load Household Power Data
power<- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#Subset only the required dates: 2007-02-01 and 2007-02-02
power_plots<- power[(power$Date == "2007-02-01" | power$Date== "2007-02-02"),]

#Plot 
png("Plot3.png")

power_plots$Time <- gsub(":", "-", power_plots$Time)
power_plots$datetime <- strptime(paste(power_plots$Date, power_plots$Time, sep="-"), "%Y-%m-%d-%H-%M-%S")

power_plots$Sub_metering_1<-as.numeric(as.character(power_plots$Sub_metering_1))
power_plots$Sub_metering_2<-as.numeric(as.character(power_plots$Sub_metering_2))
power_plots$Sub_metering_3<-as.numeric(as.character(power_plots$Sub_metering_3))

plot(x=power_plots$datetime, y=power_plots$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering (watt-hours)")
lines(x=power_plots$datetime, y=power_plots$Sub_metering_2, col="red")
lines(x=power_plots$datetime, y=power_plots$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black","red","blue"))

dev.off()
