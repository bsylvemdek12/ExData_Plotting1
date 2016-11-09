printPlot4 <- function(startDate = as.Date("2007/02/01"), endDate = as.Date("2007/02/02"))
{
  #Clear any existing plots
  dev.off(dev.list()["RStudioGD"])
  
  #setup columns and margins
  par(mfrow = c(2,2), mar=c(3,4,1,1))
  
  #load data and setup date/time columns
  powerdata <- read.csv("household_power_consumption.txt", sep=";")
  powerdata$Date = as.Date(powerdata$Date, "%d/%m/%Y")
  powerdatatwodays <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]
  powerdatatwodays$DateTime <- strptime(paste(powerdatatwodays$Date, powerdatatwodays$Time, 
                                              sep=" "), format="%Y-%m-%d %H:%M:%S")
  
  #Plot global active power
  plot(powerdatatwodays$DateTime,powerdatatwodays$Global_active_power, type="n", xlab="", 
       ylab="Global Active Power")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Global_active_power, type="l")
  
  #Plot voltage
  plot(powerdatatwodays$DateTime,powerdatatwodays$Voltage, type="n", xlab="", ylab="Voltage")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Voltage, type="l")
  
  #Plot sub metering
  plot(powerdatatwodays$DateTime,powerdatatwodays$Sub_metering_1, type="n", xlab="", 
       ylab="Energy sub metering")
  
  lines(powerdatatwodays$DateTime,powerdatatwodays$Sub_metering_1, type="l")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Sub_metering_2, type="l", 
        col="red")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Sub_metering_3, type="l", 
        col="blue")
  
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1),
         lwd=c(2.5,2.5,2.5),
         bty="n",
         cex=0.90)
  
  #plot global reactive power
  plot(powerdatatwodays$DateTime,powerdatatwodays$Global_reactive_power, type="n", xlab="", ylab="Global_reactive_power")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Global_reactive_power, type="l")
  
  #print
  dev.copy(png, file = "plot4.png", width=480, height=480)
  dev.off()
}