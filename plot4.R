download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ,"household_power_consumption.zip", method = "curl")
energy <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE)
energy$Date<-as.Date(energy$Date, "%d/%m/%Y")
energy$TD<-paste(energy$Date, energy$Time)
energy$TD<-strptime(energy$TD, "%Y-%m-%d %H:%M:%S")

a<-as.Date("01/02/2007", "%d/%m/%Y")
b<-as.Date("02/02/2007", "%d/%m/%Y")
##energy1<-subset(energy, energy$Date>=a)
##energy2<-subset(energy1, energy1$Date<=b)
energy_sub<-subset(energy, (energy$Date>=a & energy$Date<=b))
energy_sub[,3]<-as.numeric(energy_sub[,3])
energy_sub[,4]<-as.numeric(energy_sub[,4])
energy_sub[,4]<-as.numeric(energy_sub[,4])
energy_sub[,5]<-as.numeric(energy_sub[,5])
energy_sub[,6]<-as.numeric(energy_sub[,6])
energy_sub[,7]<-as.numeric(energy_sub[,7])
energy_sub[,8]<-as.numeric(energy_sub[,8])


## Graph 4

par(mfcol = c(2, 2)) 
with(energy_sub, {
  plot(TD, Global_active_power, type="o", ylab="Global active power(kilowatts)", xlab="",pch=".")
  plot(TD, Sub_metering_1,col = "black", pch=".", type="o", ylab="Energy sub metering", xlab="")
  points(TD, Sub_metering_2,col = "red", pch=".", type="o")
  points(TD, Sub_metering_3,col = "blue", pch=".", type="o")
  legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, bty="n")
  plot(TD, Voltage, type="o", ylab="Voltage", xlab="datetime",pch=".")
  plot(TD, Global_reactive_power, type="o", ylab="Global_reactive_power", xlab="datetime",pch=".")     
  
})

dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px")
dev.off()