library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI %>% filter(fips %in% c("24510", "06037") & type == "ON-ROAD") %>%
group_by(year, fips) %>% summarize(total_emissions = sum(Emissions))

emissions_by_year
A tibble: 8 x 3
# Groups:   year [4]
year fips  total_emissions
<int> <chr>           <dbl>
1  1999 06037          3931. 
2  1999 24510           347. 
3  2002 06037          4274. 
4  2002 24510           134. 
5  2005 06037          4601. 
6  2005 24510           130. 
7  2008 06037          4101. 
8  2008 24510            88.3

emissions_by_year$year <- as.factor(emissions_by_year$year)
emissions_by_year$county_name <- factor(emissions_by_year$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City")) 

ggplot(emissions_by_year, aes(x=year, y=total_emissions, col = county_name)) + 
geom_point(alpha= 1/3) + labs(x="Year", y="Total Emissions (tons)") +
ggtitle("Comparison of Total Annual Vehicle Emissions in Baltimore and Los Angeles") 

# The city LA seems to have greatest change in vehicle emissions during 1999-2008

dev.copy(png,'plot6.png')
dev.off()
