#Load Household Power Data
power<- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#Subset only the required dates: 2007-02-01 and 2007-02-02
power_plots<- power[(power$Date == "2007-02-01" | power$Date== "2007-02-02"),]

#Plot 1
png("Plot1.png")
power_plots$Global_active_power<-as.numeric(as.character(power_plots$Global_active_power)) #needs to be numeric
hist(power_plots$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
