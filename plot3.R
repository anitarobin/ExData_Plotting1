#Script for plot3.png
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
#set the margins
par(mar=c(3,4,2,2))

with(df,{
#setup the plot
      plot(datetime,Sub_metering_1,ylab="Energy sub metering",type="n")  
#add the lineplot for the first variable      
      lines(datetime,Sub_metering_1,col="black",type="l")
#add the lineplot for the second variable    
      lines(datetime,Sub_metering_2,col="red")
#add the lineplot for the third variable    
      lines(datetime,Sub_metering_3,col="blue")
##add the legend  
      legend("topright",lwd=1,col=c("black","red","blue"),
           legend=(c(names(df[7:9]))),cex=0.75)
    
})
#send it to the desired file
dev.copy(png,file="plot3.png")
#turn the device off
dev.off()
