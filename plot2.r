## Exploratory Data Analysis
## Course Project 1, Plot 2

plot2 <- function() {
 
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
 png(filename="plot2.png", width =480, height = 480, units = "px", type="cairo-png")
 
 ## Create plot of dateTime and Global_active_power
 plot(data_sub$dateTime, data_sub$Global_active_power, type="l", 
		main = "", xlab="", ylab="Global Active Power (kilowatts)")
 
 ## Close graphic device
 dev.off()
}
		