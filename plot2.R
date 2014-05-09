install.packages("sqldf")
require(sqldf)
powerdata<-read.csv.sql("household_power_consumption.txt",
                        sep=";",
                        sql="select * from file where Date in ('1/2/2007','2/2/2007')")
powerdata$datetime<-strptime(paste0(powerdata$Date,powerdata$Time),"%d/%m/%Y%H:%M:%S")


#plot2
reset.par <- par(no.readonly = TRUE)

par(cex=0.7,bg="transparent")

plot(powerdata$datetime,powerdata$Global_active_power,
     type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.copy(png,file="plot2.png")
dev.off()
par(reset.par)