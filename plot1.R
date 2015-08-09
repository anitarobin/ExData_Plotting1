#Script for plot1
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
  
  par(mar=c(4,4,2,2))
  
#call the fn to plot the histogram
  
  hist(df$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
 
#send it to the desired file
  
dev.copy(png,file="plot1.png")

#turn the device off
dev.off()
