library(readr)
library(Hmisc)

smpsdata <- read_csv("C:/Users/kubelova/Desktop/A1 IK Kosetice/AMS and SMPS/KoWi/AMS SMPS.csv")

smpsTD <- cbind(smpsdata[,1:3])
smpsNTD <- cbind(smpsdata[,4:6])

##Graph NTD
xntd<-as.POSIXct(smpsdata$NTD_Time_1,format="%d/%m/%Y %H:%M")

AMSntd=smpsNTD$NTD_Total
SMPSntd=smpsNTD$NTD_SMPS



par(mar = c(5.1, 4.1, 4.1, 4.1)) 
plot(xntd, AMSntd,type="l", col="red",main="KoWi",
     xlab="Date", ylab="Concentration AMS",xaxt = "n")
minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)
axis.Date(side = 1, at=smpsdata$NTD_Time_1, format(smpsdata$NTD_Time_1,"%d/%m/%Y %H:%M"))

minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)

par(new=TRUE)
plot(xntd,SMPSntd,type="l", col="green",yaxt="n",xlab="Date",ylab="")
axis(side = 4)
mtext("Concentration SMPS",side=4,line=3)

legend("topleft", c("NTD_AMS","NTD_SMPS"), 
       
       lty=c(1,1), 
       
       lwd=c(2.5,2.5),col=c("red","green"))

dev.copy(png,'NTD_AMS_SMPS.png',width = 900, height = 480)
dev.off()

##Graph TD
xTD<-as.POSIXct(smpsdata$TD_Time_1,format="%d/%m/%Y %H:%M")

AMSTD=smpsTD$TD_Total
SMPSTD=smpsTD$TD_SMPS



par(mar = c(5.1, 4.1, 4.1, 4.1)) 
plot(xTD, AMSTD,type="l", col="red",main="KoWi",
     xlab="Date", ylab="Concentration AMS",xaxt = "n")
minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)
axis.Date(side = 1, at=smpsdata$TD_Time_1, format(smpsdata$TD_Time_1,"%d/%m/%Y %H:%M"))

minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)

par(new=TRUE)
plot(xTD,SMPSTD,type="l", col="green",yaxt="n",xlab="Date",ylab="")
axis(side = 4)
mtext("Concentration SMPS",side=4,line=3)

legend("topleft", c("TD_AMS","TD_SMPS"), 
       
       lty=c(1,1), 
       
       lwd=c(2.5,2.5),col=c("red","green"))

dev.copy(png,'TD_AMS_SMPS.png',width = 900, height = 480)
dev.off()


##Graph AMS
plot.new()
par(mar = c(5.1, 4.1, 4.1, 4.1)) 
plot(xntd, AMSntd,type="l", col="red",main="KoWi",
     xlab="Date", ylab="Concentration NTD",xaxt = "n")
minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)
axis.Date(side = 1, at=smpsdata$NTD_Time_1, format(smpsdata$NTD_Time_1,"%d/%m/%Y %H:%M"))

minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)

par(new=TRUE)
plot(xTD,AMSTD,type="l", col="green",yaxt="n",xlab="Date",ylab="")
axis(side = 4)
mtext("Concentration TD",side=4,line=3)

legend("topleft", c("NTD_AMS","TD_AMS"), 
       
       lty=c(1,1), 
       
       lwd=c(2.5,2.5),col=c("red","green"))

dev.copy(png,'AMS TD NTD.png',width = 900, height = 480)
dev.off()

##Graph SMPS
plot.new()
par(mar = c(5.1, 4.1, 4.1, 4.1)) 
plot(xntd, SMPSntd,type="l", col="red",main="KoWi",
     xlab="Date", ylab="Concentration NTD",xaxt = "n")
minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)
axis.Date(side = 1, at=smpsdata$NTD_Time_1, format(smpsdata$NTD_Time_1,"%d/%m/%Y %H:%M"))

minor.tick(nx = 1.5,
           ny = 2,
           tick.ratio=0.75)

par(new=TRUE)
plot(xTD,SMPSTD,type="l", col="green",yaxt="n",xlab="Date",ylab="")
axis(side = 4)
mtext("Concentration TD",side=4,line=3)

legend("topleft", c("NTD_SMPS","TD_SMPS"), 
       
       lty=c(1,1), 
       
       lwd=c(2.5,2.5),col=c("red","green"))

dev.copy(png,'SMPS TD NTD.png',width = 900, height = 480)
dev.off()