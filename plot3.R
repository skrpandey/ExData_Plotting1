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
png("plot3.png",width=480,height=480)
with(feb_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

