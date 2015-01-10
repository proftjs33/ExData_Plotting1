# plots of 3 graph on same chart
# set readData to TRUE to read the large data set
readData<-FALSE #don't need to reload every time soursed
if(readData) {
    setwd("C:/Users/tjs/Google Drive/R/coursera/04 Exploratory Data Analysis")
    fileName<-"data/household_power_consumption.txt"
    # column names
    cNames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    # read the data
    allData<-read.table(fileName, sep=";", col.names= cNames, stringsAsFactors = FALSE)
    # extract dates 2007-02-01 (1/2/2007) and 2007-02-02 (2/2/2007)
    myData<-allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
    # combine date and time to get x-values
    library(lubridate)
    d<-dmy(myData[,1])
    t<-hms(myData[,2])
    myData$Date_Time<-d+t
}
# write png file 480x480
png(file= "plot3a.png", width= 480, height= 480)
    with(myData, plot(Date_Time,Sub_metering_1, type= "o", pch=-1, xlab="", ylab="Energy sub metering"))
    with(myData, lines(Date_Time,Sub_metering_2, col="red", type= "o", pch=-1, xlab="", ylab=""))
    with(myData, lines(Date_Time,Sub_metering_3, col="blue", type= "o", pch=-1, xlab="", ylab=""))
    legend("topright", pch = "", lwd = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## adds legend
dev.off()
