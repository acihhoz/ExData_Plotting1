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
with(f,plot(x,y,type = "n"))

plot(f$Date_Time,f$Sub_metering_1,type = "s",
     ylab="Energy sub meeting",xlab="")
points(f$Date_Time,f$Sub_metering_2,col="red",type = "s")
points(f$Date_Time,f$Sub_metering_3,col="blue",type = "s")
legend("topright",lwd = 1,cex=0.8,x.intersp=1,
       col = c("black","red","blue"),
      legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

