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
png(filename='plots/plot3.png',width=480,height=480,units='px')

# Plot data
plot(power.consumption$DateTime,power.consumption$Sub_Metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$Sub_Metering_2,col='red')
lines(power.consumption$DateTime,power.consumption$Sub_Metering_3,col='blue')

#Legend
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty='solid')

# Turn off graphics device
x<-dev.off()