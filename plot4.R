#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_full <- read.table("/Users/shakun pc/Desktop/online classes/exploratory data analysis/data/household_power_consumption.txt",
                        header=T, sep=';', na.strings="?",
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="")

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
head(data_full)
str(data_full)
subset_data=subset(data_full, Date=='2007-2-1' | Date=='2007-2-2')
head(subset_data)
tail(subset_data)

## Converting dates
date_time <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Date_time <- as.POSIXct(date_time)
head(subset_data)
## lets plot
par(mfrow=c(2,2), mar=c(3,4,1,1), oma=c(0.1,0.1,0.1,0.1)) 
plot(subset_data$Global_active_power~subset_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="",cex.lab=0.7)
plot(subset_data$Voltage~subset_data$Date_time, type="l",
     ylab="Voltage", xlab="",cex.lab=0.7)
plot(subset_data$Sub_metering_1 ~ subset_data$Date_time, type='l',
     ylab='Energy sub metering', xlab='',cex.lab=0.7)
lines(subset_data$Sub_metering_2~subset_data$Date_time,col='red')
lines(subset_data$Sub_metering_3~subset_data$Date_time, col='blue')
legend('topright',lty=c(1,1,1),col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=0.6,bty='n')

plot(subset_data$Global_reactive_power~subset_data$Date_time, type="l",
     xlab="",ylab='Global_reactive_power',cex.lab=0.7)
dev.copy(png, file='plot4.png',height=480,width=480)
dev.off()
