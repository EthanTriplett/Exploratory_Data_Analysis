setwd("c:/Users/et89142/Desktop/Coursera/4_Exploratory_Data_Analysis/Course Project 1")
electric_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

electric_data$Date <- as.Date(electric_data$Date, format="%d/%m/%Y")

df <- electric_data[which(electric_data$Date == '2007-02-01' | electric_data$Date == '2007-02-02'),]

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
#View(df)

plot2 <- function() {
  plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}
plot2()