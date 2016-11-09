printPlot3 <- function(startDate = as.Date("2007/02/01"), endDate = as.Date("2007/02/02"))
{
  #Clear existing plots
  dev.off(dev.list()["RStudioGD"])
  
  #load data and setup date/time columns
  powerdata <- read.csv("household_power_consumption.txt", sep=";")
  powerdata$Date = as.Date(powerdata$Date, "%d/%m/%Y")
  powerdatatwodays <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]
  powerdatatwodays$DateTime <- strptime(paste(powerdatatwodays$Date, powerdatatwodays$Time, 
                                              sep=" "), format="%Y-%m-%d %H:%M:%S")
  
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
         cex=0.85)
  
  #print
  dev.copy(png, file = "plot3.png")
  dev.off()
}