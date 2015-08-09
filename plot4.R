#Script for plot4.png
#read the header column labels

  header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

#read the rows pertaining to data for feb 1 and Feb 2

  df<-read.table("household_power_consumption.txt",sep=";",header=FALSE,na.strings="?",
               colClasses=c(time="character",time="character",rep("numeric",7)),
               skip=66637,nrow=2880)

#add the column names
  colnames( df ) <- unlist(header)

#concatenate date and time columns to a new column datetime

  df$datetime<-strptime(paste(df[,1],df[,2]),format = "%d/ %m/ %Y %H:%M:%S")

#set the height and width for the plot
  windows.options(width=480,height=480)
#set the margins and plot grid as two rows and two columns
  par(mar=c(4,4,2,2),mfrow=c(2,2),oma=c(0,0,2,0))

with(df,{
  #first plot
        plot(datetime,Global_active_power,xlab ="",ylab="Global Active Power",type="n")
        lines(datetime,Global_active_power,col="black",type="l")
  #second plot
        plot(datetime,Voltage,xlab="datetime", ylab="Voltage", type="n")
        lines(datetime,Voltage,col="black",type="l")
  #third plot
         plot(datetime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
          lines(datetime,Sub_metering_1,col="black",type="l")
          lines(datetime,Sub_metering_2,col="red")
          lines(datetime,Sub_metering_3,col="blue")
          legend("topright",lwd=1,col=c("black","red","blue"),
            legend=(c(names(df[7:9]))),cex=0.5)
  #fourth plot
          plot(datetime,Global_reactive_power,type="n")
          lines(datetime,Global_reactive_power,col="black",type="l")
  
})
#send it to the desired file
dev.copy(png,file="plot4.png")
#turn the device off
dev.off()
