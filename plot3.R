plot3 <- function(){
    #laad needed libraries
    library(dplyr)
    library(hms)
    
    #read and prepare data
    data <- read.table("household_power_consumption.txt", na.strings = c("?"), header=TRUE, sep=";")
    data <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
    data <- mutate(data, Date=as.POSIXct(strptime(paste(as.character(Date), as.character(Time),sep=" "), "%d/%m/%Y %H:%M:%S")))
    
    #generate plot 
    plot(data$Date, data$Sub_metering_1, type="l", xlab=NA, ylab = "Energy sub metering", col="black")
    lines(data$Date, data$Sub_metering_2, type="l", col="red")
    lines(data$Date, data$Sub_metering_3, type="l", col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"))
    
    #save plot to png file
    dev.copy(png, file="plot3.png", width=480, height=480)
    dev.off()
}