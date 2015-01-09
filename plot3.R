# read in data file, required lines only
df <- read.table('household_power_consumption.txt',skip=66637,nrow=2880,sep=";")
names <- read.table('household_power_consumption.txt',nrow=1,header=TRUE,sep=";")
names(df) <- names(names)
df$Datetime <- paste(df$Date,df$Time)
df$Datetime <- strptime(df$Datetime,format="%d/%m/%Y %T")

#plot 3
png(file="plot3.png",width=480,height=480)
plot(df$Datetime,df[,7],ylab="Energy sub metering",xlab="",type="l")
lines(df$Datetime,df[,8],col='red')
lines(df$Datetime,df[,9],col='blue')
legend("topright",names(df[,7:9]),col=c('black','red','blue'),lty=1)
dev.off()


