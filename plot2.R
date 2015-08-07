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
plot(f$Date_Time,f$Global_active_power,
     ylab ="Global Active Power (kilowatts)",
     xlab="",type = "s")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
