# Import the dataset
fullData<- read.csv("./Coursera_DS/4/Week1/hpc.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullData$Date <- as.Date(fullData$Date, format="%d/%m/%Y")

# Subset the dataset
data <- subset(fullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullData)

# Convert the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Export the pic
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()