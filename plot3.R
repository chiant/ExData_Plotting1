install.packages("sqldf")
require(sqldf)
powerdata<-read.csv.sql("household_power_consumption.txt",
                        sep=";",
                        sql="select * from file where Date in ('1/2/2007','2/2/2007')")
powerdata$datetime<-strptime(paste0(powerdata$Date,powerdata$Time),"%d/%m/%Y%H:%M:%S")


#plot3
reset.par <- par(no.readonly = TRUE)

par(pin=c(5,5),
    cex=0.7,
    bg="transparent")
plot(powerdata$datetime,powerdata$Sub_metering_1,
     type='n',ylab='Energy sub metering',xlab='')
lines(powerdata$datetime,powerdata$Sub_metering_1)
lines(powerdata$datetime,powerdata$Sub_metering_2,col='red')
lines(powerdata$datetime,powerdata$Sub_metering_3,col='blue')
legend("topright",lty=1,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()
par(reset.par)