install.packages("sqldf")
require(sqldf)
powerdata<-read.csv.sql("household_power_consumption.txt",
                        sep=";",
                        sql="select * from file where Date in ('1/2/2007','2/2/2007')")
powerdata$datetime<-strptime(paste0(powerdata$Date,powerdata$Time),"%d/%m/%Y%H:%M:%S")

#plot4

reset.par <- par(no.readonly = TRUE)

par(mfrow=c(2,2),
    mar=c(0.5,0.2,0.5,0.2),
    pin=c(2.1,1.7),
    cex=0.8,
    cex.axis=0.9,
    cex.lab=0.9)

plot(powerdata$datetime,powerdata$Global_active_power,
     type='l',xlab='',ylab='Global Active Power')

plot(powerdata$datetime,powerdata$Voltage,
     type='l',xlab='datetime',ylab='Voltage')

plot(powerdata$datetime,powerdata$Sub_metering_1,
     type='n',ylab='Energy sub metering',xlab='')
lines(powerdata$datetime,powerdata$Sub_metering_1)
lines(powerdata$datetime,powerdata$Sub_metering_2,col='red')
lines(powerdata$datetime,powerdata$Sub_metering_3,col='blue')
legend("topright",lty=1,
       col=c("black","red","blue"),
       bty='n',cex=0.8,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(powerdata$datetime,powerdata$Global_reactive_power,
     type='l',xlab='datetime',ylab='Global_reactive_power')
dev.copy(png,file="plot4.png")
dev.off()
par(reset.par)