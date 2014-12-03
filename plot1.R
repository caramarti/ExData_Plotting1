#Set current work directory
setwd('/media/cara-marti/Data/Coursera/04_ExploratoryDataAnalysis/Projects/Week_1')

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('Data.R')

# open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# plot data
hist(power.consumption$Global_Active_Power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()