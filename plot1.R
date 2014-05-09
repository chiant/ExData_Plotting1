install.packages("sqldf")
require(sqldf)
powerdata<-read.csv.sql("household_power_consumption.txt",
                        sep=";",
                        sql="select * from file where Date in ('1/2/2007','2/2/2007')")
powerdata$datetime<-strptime(paste0(powerdata$Date,powerdata$Time),"%d/%m/%Y%H:%M:%S")

#plot 1
reset.par <- par(no.readonly = TRUE)

par(cex=0.7,bg="transparent")

hist(powerdata$Global_active_power,col='red',
     xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.copy(png,file="plot1.png")
dev.off()
par(reset.par)