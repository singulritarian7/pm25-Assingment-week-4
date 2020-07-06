library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI %>% filter(fips == "24510" & type == "ON-ROAD") %>% group_by(year) %>%
summarize(total_emissions = sum(Emissions))

emissions_by_year
A tibble: 4 x 2
year  total_emissions
<fct>           <dbl>
  1 1999            347. 
2 2002            134. 
3 2005            130. 
4 2008             88.3

emissions_by_year$year <- as.factor(emissions_by_year$year)

ggplot(emissions_by_year, aes(x=year, y=total_emissions)) + geom_point(color="magenta", alpha = 1/3) + 
labs(x="Year", y="Total Emissions (tons)") + ggtitle("Total Annual Vehicle Emissions in Baltimore City")

Totpm_2008 <- emissions_by_year[emissions_by_year$year == 2008, 2]
Totpm_1999 <- emissions_by_year[emissions_by_year$year == 1999, 2]
decrease_Totpm <- Totpm_1999 - Totpm_2008
decrease_Totpm
total_emissions
1        258.5445

dev.copy(png,'plot5.png')
dev.off()
