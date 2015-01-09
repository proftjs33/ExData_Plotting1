# Global Active Power Histogram
fileName<-"data/household_power_consumption.txt"
# column names
cNames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# read the data
allData<-read.table(fileName, sep=";", col.names= cNames, stringsAsFactors = FALSE)
# extract dates 2007-02-01 (1/2/2007) and 2007-02-02 (2/2/2007)
myData<-allData[allData$Date=="1/2/2007" | allData$Date=="2/2/2007",]
# varable name "Global_active_power"
histData<-as.numeric(myData$Global_active_power)
hist(histData, col= "red", main="Global_active_power", xlab = "Global Active Power (kilowats)")
# write png file 480x480
png(file= "plot1a.png", width= 480, height= 480)
hist(histData, col= "red", main="Global_active_power", xlab = "Global Active Power (kilowats)")
dev.off()
