printPlot2 <- function(startDate = as.Date("2007/02/01"), endDate = as.Date("2007/02/02"))
{
  #Clear plot area
  dev.off(dev.list()["RStudioGD"])
  
  #Load data
  powerdata <- read.csv("household_power_consumption.txt", sep=";")
  powerdata$Date = as.Date(powerdata$Date, "%d/%m/%Y")
  powerdatatwodays <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]
  powerdatatwodays$DateTime <- strptime(paste(powerdatatwodays$Date, powerdatatwodays$Time, 
    sep=" "), format="%Y-%m-%d %H:%M:%S")
  
  #plot
  plot(powerdatatwodays$DateTime,powerdatatwodays$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(powerdatatwodays$DateTime,powerdatatwodays$Global_active_power, type="l")
  
  #print
  dev.copy(png, file = "plot2.png", width=480, height=480)
  dev.off()
}