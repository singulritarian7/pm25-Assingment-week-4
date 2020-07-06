getwd()
unzip("exdata_data_NEI_data.zip", exdir = ".")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

Totpm_Baltimore <- NEI %>% subset(fips == "24510" %>% group_by(year) %>% summarise(Totalpm25Balt = sum(Emissions, na.rm = T))
Totpm_Baltimore

A tibble: 4 x 2
year Totalpm25Balt
<int>         <dbl>
1  1999         3274.
2  2002         2454.
3  2005         3091.
4  2008         1862.

with(Totpm_Baltimore, plot(year, Totalpm25Balt, pch = 3 , col = "magenta", xlab = "Year",
ylab = "Total Emissions (tons)", main = " Total Anual Emissions in Baltimore by year"))
with (Totpm_Baltimore , abline(h = median(Totalpm25Balt))

Totpm_2008 <- Totpm_Baltimore[Totpm_Baltimore$year == 2008, 2]
Totpm_1999 <- Totpm_Baltimore[Totpm_Baltimore$year == 1999, 2]
decrease_Totpm <- Totpm_1999 - Totpm_2008
decrease_Totpm

Totalpm25Balt
1      1411.898

dev.copy(png, "plot2.png")
dev.off()

