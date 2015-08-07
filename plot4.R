z<-read.table("household_power_consumption.txt",header=T, 
              nrow=2,sep=";")
a<-read.table("household_power_consumption.txt",header=F,
              skip=66500,nrow=3500,comment.char = "",sep=";")
colnames(a)<-names(z)
b<-subset(a,Date=="1/2/2007")
c<-subset(a,Date=="2/2/2007")
d<-rbind(b,c)
e<-paste(d$Date,d$Time)
Date_Time<-strptime(e,"%d/%m/%Y %H:%M:%S")
f<-cbind(d,Date_Time)
par(mfrow=c(2,2))
par("mar")
par(mar=c(4.1,4.1,3.1,2.1))
plot(f$Date_Time,f$Global_active_power,
    ylab ="Global Active Power", 
    xlab="", type = "s")
plot(f$Date_Time,f$Voltage, ylab ="Voltage", 
    xlab="datetime", type = "s")
plot(f$Date_Time,f$Sub_metering_1,type = "s",
    ylab="Energy sub meeting",xlab="")
points(f$Date_Time,f$Sub_metering_2,col="red",type = "s")
points(f$Date_Time,f$Sub_metering_3,col="blue",type = "s")
legend("topright",lwd = 1,cex=0.8,x.intersp=1,bty = "n",
    col = c("black","red","blue"),
 legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(f$Date_Time,f$Global_reactive_power,
ylab ="Global_reactive_power", 
xlab="datetime", type = "s")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()


?legend
names(f)
