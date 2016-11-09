printPlot1 <- function(startDate = as.Date("2007/02/01"), endDate = as.Date("2007/02/02"))
{
  #clear plots
  dev.off(dev.list()["RStudioGD"])
  
  #set color
  colors = c("red")
  
  #load data
  powerdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
  powerdata$Date = as.Date(powerdata$Date, "%d/%m/%Y")
  powerdatatwodays <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]
  
  #create histogram
  hist(as.numeric(powerdatatwodays$Global_active_power),
       col=colors,xlab="Global Active Power (kilowatts)",
       main="Global Active Power")
  
  #print
  dev.copy(png, file = "plot1.png", width=480, height=480)
  dev.off()
}