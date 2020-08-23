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


## Creación de la imagen llamada plot1.png
png("plot1.png", width=480,height=480,units="px")
hist(data2$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)",
)
dev.off()
