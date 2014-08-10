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
## Plot 2
plot(subset_data$Global_active_power~subset_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
