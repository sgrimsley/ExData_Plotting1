## Exploratory Data Analysis
## Course Project 1, Plot 3

plot3 <- function() {

 ## Read in data
 data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
		na.strings="?", stringsAsFactors=FALSE)
		
 ## Subset data for 2/1/07 and 2/2/07		
 data$Date <- as.Date(data$Date, "%d/%m/%Y")
 data_sub <- subset(data, Date == "2007-02-01" | Date =="2007-02-02") 
 
 ## Create and format dateTime variable 
 data_sub$dateTime <- paste(data_sub$Date, data_sub$Time)
 data_sub$dateTime <- strptime(data_sub$dateTime, "%Y-%m-%d %H:%M:%S")
 
 ## Open png graphic device
 png(filename="plot3.png", width =480, height = 480, units = "px", 
		type="cairo-png", bg="transparent")
 
 ## Create plot of dateTime and Sub metering 1, 2, and 3
 with(data_sub, plot(dateTime, Sub_metering_1, type="n", xlab="", 
		ylab="Energy sub metering"))
 with(data_sub, lines(dateTime, Sub_metering_1, col="black"))
 with(data_sub, lines(dateTime, Sub_metering_2, col="red"))
 with(data_sub, lines(dateTime, Sub_metering_3, col="blue"))
 legend("topright", lwd=1, col=c("black","red","blue"), 
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

 ## Close graphic device		
 dev.off()
}
		