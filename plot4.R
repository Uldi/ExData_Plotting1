plot4 <- function(){
    #laad needed libraries
    library(dplyr)
    library(hms)
    
    #read and prepare data
    data <- read.table("household_power_consumption.txt", na.strings = c("?"), header=TRUE, sep=";")
    data <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
    data <- mutate(data, datetime=as.POSIXct(strptime(paste(as.character(Date), as.character(Time),sep=" "), "%d/%m/%Y %H:%M:%S")))
    
    #set 2 x 2 plot layout
    par(mfrow=c(2,2))
    
    #generate plot top-left
    plot(data$datetime, data$Global_active_power, type="l", xlab=NA, ylab = "Global Active Power (kilowatts)")
    
    #generate plot top-right
    with(data, plot(datetime, Voltage, type="l"))
    
    #generate plot bottom-left
    plot(data$datetime, data$Sub_metering_1, type="l", xlab=NA, ylab = "Energy sub metering", col="black")
    lines(data$datetime, data$Sub_metering_2, type="l", col="red")
    lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"), bty="n", cex=0.7, inset=0)
    
    #generate plot bottom-right
    with(data, plot(datetime, Global_reactive_power, type="l"))
    
    #save plot to png file
    dev.copy(png, file="plot4.png", width=480, height=480)
    dev.off()
}