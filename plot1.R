## Reading the data 
## Due to size of the data it is not uploaed in github
df <- read.csv("data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
head(df)

## Filter requied data
feb_data <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert the Date and Time variables to Date/Time classes in R 
concat_dateTime <- paste(as.Date(feb_data$Date), feb_data$Time)
feb_data$Datetime <- as.POSIXct(concat_dateTime)
head(feb_data)


##Plotting above data
png("plot1.png",width=480,height=480)
hist(feb_data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()
