library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_SCCs <- SCC %>% filter(grepl("coal", EI.Sector, ignore.case=TRUE)) %>% select(SCC)

emissions_by_year <- NEI %>% filter(SCC %in% coal_SCCs$SCC) %>% 
group_by(year) %>% summarize(total_emissions = sum(Emissions))

emissions_by_year$year <- as.factor(emissions_by_year$year)

ggplot(emissions_by_year, aes(x=year, y=total_emissions)) + geom_point(color="magenta", alpha = 1/3) +
labs(x="Year", y="Total Emissions (tons)") + ggtitle("Total Annual Coal Combustion Emissions")

Totpm_2008 <- emissions_by_year[emissions_by_year$year == 2008, 2]
Totpm_1999 <- emissions_by_year[emissions_by_year$year == 1999, 2]
decrease_Totpm <- Totpm_1999 - Totpm_2008
decrease_Totpm
total_emissions
1        228694.3

dev.copy(png,'plot4.png')
dev.off()
