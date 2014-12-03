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

# open graphics device
png(filename='plots/plot4.png',width=480,height=480,units='px')

#4 plots
par(mfrow=c(2,2))

#Plot number 1
plot(power.consumption$DateTime,power.consumption$Global_Active_Power,xlab='', ylab='Global Active Power (kilowatts)', type = 'l')

#Plot number 2
plot(power.consumption$DateTime, power.consumption$Voltage, xlab='datetime', ylab='Voltage', type='l')

# plot number 3
plot(power.consumption$DateTime,power.consumption$Sub_Metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$Sub_Metering_2,col='red')
lines(power.consumption$DateTime,power.consumption$Sub_Metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'), lty='solid', bty='n')

#Plot number 4
plot(power.consumption$DateTime, power.consumption$Global_Reactive_Power, xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off graphics device
x<-dev.off()