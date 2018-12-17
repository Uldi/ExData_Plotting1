plot2 <- function(){
    #laad needed libraries
    library(dplyr)
    library(hms)
    
    #read and prepare data
    data <- read.table("household_power_consumption.txt", na.strings = c("?"), header=TRUE, sep=";")
    data <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
    data <- mutate(data, Date=as.POSIXct(strptime(paste(as.character(Date), as.character(Time),sep=" "), "%d/%m/%Y %H:%M:%S")))
    
    #generate plot 
    plot(data$Date, data$Global_active_power, type="l", xlab=NA, ylab = "Global Active Power (kilowatts)")
    
    #save plot to png file
    dev.copy(png, file="plot2.png", width=480, height=480)
    dev.off()
}