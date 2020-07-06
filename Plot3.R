getwd()
unzip("exdata_data_NEI_data.zip", exdir = ".")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

tot_emiss_balt_type <- NEI %>% subset(fips == "24510" %>% group_by(year, type) %>% summarise(Total_Emiss_balt_Type = sum(Emissions, na.rm = T))
tot_emiss_balt_type                              

A tibble: 16 x 3
# Groups:   year [4]
year type     Total_Emiss_balt_Type
<int> <chr>                    <dbl>
1  1999 NON-ROAD                 523. 
2  1999 NONPOINT                2108. 
3  1999 ON-ROAD                  347. 
4  1999 POINT                    297. 
5  2002 NON-ROAD                 241. 
6  2002 NONPOINT                1510. 
7  2002 ON-ROAD                  134. 
8  2002 POINT                    569. 
9  2005 NON-ROAD                 249. 
10  2005 NONPOINT                1510. 
11  2005 ON-ROAD                  130. 
12  2005 POINT                   1202. 
13  2008 NON-ROAD                  55.8
14  2008 NONPOINT                1373. 
15  2008 ON-ROAD                   88.3
16  2008 POINT                    345. 

emissions<- ggplot(data = tot_emiss_balt_type, aes(year, Total_Emiss_balt_Type))
emissions <- emissions + geom_point(color = "magenta", alpha = 1/3) + facet_grid(.~ type) + 
xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total Annual Emissions in Baltimore by Year")
emissions

dev.copy(png, "plot3.png")
dev.off()
                                        
# All source types have decreased from 1999 to 2008 in Baltimore, with the exception of of the "point" type source.

