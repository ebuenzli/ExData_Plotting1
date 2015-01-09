# read in data file, required lines only
df <- read.table('household_power_consumption.txt',skip=66637,nrow=2880,sep=";")
names <- read.table('household_power_consumption.txt',nrow=1,header=TRUE,sep=";")
names(df) <- names(names)
df$Datetime <- paste(df$Date,df$Time)
df$Datetime <- strptime(df$Datetime,format="%d/%m/%Y %T")

#plot 1
png(file="plot1.png",width=480,height=480)
hist(df[,3],col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


