#Set current work directory
setwd('/media/cara-marti/Data/Coursera/04_ExploratoryDataAnalysis/Projects/Week_1')

#Set system time to english
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Control that folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# Load data
source('Data.R')

# Open graphics device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# Plot data
plot(power.consumption$DateTime,power.consumption$Global_Active_Power,xlab='', ylab='Global Active Power (kilowatts)', type = 'l')

# Turn off graphics device
x<-dev.off()