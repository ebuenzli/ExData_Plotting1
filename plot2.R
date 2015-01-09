# read in data file, required lines only
df <- read.table('household_power_consumption.txt',skip=66637,nrow=2880,sep=";")
names <- read.table('household_power_consumption.txt',nrow=1,header=TRUE,sep=";")
names(df) <- names(names)
df$Datetime <- paste(df$Date,df$Time)
df$Datetime <- strptime(df$Datetime,format="%d/%m/%Y %T")

#plot 2
png(file="plot2.png",width=480,height=480)
plot(df$Datetime,df[,3],ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()


