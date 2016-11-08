printPlot1 <- function()
{
  colors = c("red")
  powerdata <- read.csv("household_power_consumption.txt", sep=";")
  powerdata$Date = as.Date(powerdata$Date, "%d/%m/%Y")
  powerdatatwodays <- powerdata[powerdata$Date >= startDate & powerdata$Date <= endDate,]
  hist(as.numeric(powerdatatwodays$Global_active_power),col=colors,xlab="Global Active Power (kilowatts)",main="Global Active Power")
}
