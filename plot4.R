## Reading the data 
## Due to size of the data it is not uploaed in github
df <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

## Filter requied data
feb_data <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##convert the Date and Time variables to Date/Time classes in R 
concat_dateTime <- paste(as.Date(feb_data$Date), feb_data$Time)
feb_data$Datetime <- as.POSIXct(concat_dateTime)
head(feb_data)

##Plotting required graph
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(feb_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Rective_Power",xlab="datetime")
})
dev.off()
