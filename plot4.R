setwd("c:/Users/et89142/Desktop/Coursera/4_Exploratory_Data_Analysis/Course Project 1")
electric_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

electric_data$Date <- as.Date(electric_data$Date, format="%d/%m/%Y")

df <- electric_data[which(electric_data$Date == '2007-02-01' | electric_data$Date == '2007-02-02'),]

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
#View(df)

par(mfrow = c(2,2))

plot4 <- function(){
  with(df,{
    plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.7)
    plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.7)
    plot(df$DateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7)
    lines(df$DateTime, df$Sub_metering_2, col = "red")
    lines(df$DateTime, df$Sub_metering_3, col = "blue")
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty='n', cex=0.5)
    plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.7)
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()
  })
}
plot4()