# Global Active Power vs time plot
# set readData to TRUE to read the large data set
readData<-FALSE #don't need to reload every time soursed
if(readData) {
    fileName<-"data/household_power_consumption.txt"
# column names
    cNames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# read the data
    allData<-read.table(fileName, sep=";", col.names= cNames, stringsAsFactors = FALSE)
# extract dates 2007-02-01 (1/2/2007) and 2007-02-02 (2/2/2007)
    myData<-allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
# varable name "Global_active_power"
    plotData<-myData[,c("Date","Time","Global_active_power")]
}
# combine date and time to get x-values
library(lubridate)
d<-dmy(plotData[,1])
t<-hms(plotData[,2])
plotData$Date_Time<-d+t
# write png file 480x480
png(file= "plot2.png", width= 480, height= 480)
plot(plotData$Date_Time,plotData$Global_active_power, type= "o", pch=-1, xlab="", ylab="Global Active Power (kilowats)")
dev.off()