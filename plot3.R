library(tidyverse)
library(readr)

## Leemos los datos
data <- read_delim("household_power_consumption.txt", 
                   ";",
                   escape_double = FALSE, 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                    Time = col_time(format = "%H:%M:%S")),
                   trim_ws = TRUE)

## Filtramos las fechas que deseamos
data2 <- data %>% filter(data$Date == "2007-02-01" | data$Date == "2007-02-02")


## Creación de la imagen llamada plot3.png
png("plot3.png", width=480,height=480,units="px")
plot(ts(data2$Sub_metering_1), col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(ts(data2$Sub_metering_2), col = "red")
lines(ts(data2$Sub_metering_3), col = "blue")
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()