#Set current work directory
setwd('/media/cara-marti/Data/Coursera/04_ExploratoryDataAnalysis/Projects/Week_1')

#Load the required packages
library(data.table)
library(lubridate)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

#Check that data folder exists
if (!file.exists('source_data')) {
  dir.create('source_data')
}

#Check if data set exists, if not create it from downloaded and unzipped file
if (!file.exists('source_data/Power_Consumption.txt')) {
  file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url, destfile = 'source_data/Power_Consumption.zip', method='wget')
  unzip('source_data/Power_Consumption.zip', exdir = 'source_data', overwrite = TRUE)

#Read table and limit to dates 2007-02-01 and 2007-02-02
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('source_data/household_power_consumption.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]

#Define column names
cols<-c('Date','Time','Global_Active_Power','Global_Reactive_Power','Voltage','Global_Intensity',
        'Sub_Metering_1','Sub_Metering_2','Sub_Metering_3')
colnames(power.consumption)<-cols

#Convert time and date variables to classes
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]

#Write file with reduced data set
write.table(power.consumption,file='source_data/power_consumption.txt',sep='|',row.names=FALSE)
} else {
  
  power.consumption<-read.table('source_data/power_consumption.txt',header=TRUE,sep='|')
  power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  
}

# remove the large txt file 
if (file.exists('source_data/household_power_consumption.txt')) {
  x<-file.remove('source_data/household_power_consumption.txt')
}
