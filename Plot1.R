
# First script :dev.copy(png, "plot1.png")
getwd()
"C:/Users/pruebas/Documents"
# I save the zip file in my working directory with name exdata_data_NEI_data 
# Unzip it. (I have two rds files)
unzip("exdata_data_NEI_data.zip", exdir = ".")

dir()
[233] "summarySCC_PM25.rds"    
[223] "Source_Classification_Code.rds"     

# I read and examine the files with readRDS () and head() in RStudio.
NEI <- readRDS("summarySCC_PM25.rds")

head(NEI,3)
fips      SCC Pollutant Emissions  type year
4  09001 10100401  PM25-PRI    15.714 POINT 1999
8  09001 10100404  PM25-PRI   234.178 POINT 1999
12 09001 10100501  PM25-PRI     0.128 POINT 1999

SCC <- readRDS("Source_Classification_Code.rds")
head(SSC,3)

SCC Data.Category
1 10100101         Point
2 10100102         Point
3 10100201         Point
Short.Name
1                   Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal
2 Ext Comb /Electric Gen /Anthracite Coal /Traveling Grate (Overfeed) Stoker
3       Ext Comb /Electric Gen /Bituminous Coal /Pulverized Coal: Wet Bottom
...etc.

library(dplyr)

NEI <- as_tibble(NEI)

A tibble: 6,497,651 x 6
fips  SCC      Pollutant Emissions type   year
<chr> <chr>    <chr>         <dbl> <chr> <int>
1 09001 10100401 PM25-PRI     15.7   POINT  1999
2 09001 10100404 PM25-PRI     234.   POINT  1999
3 09001 10100501 PM25-PRI      0.128 POINT  1999
4 09001 10200401 PM25-PRI      2.04  POINT  1999
5 09001 10200504 PM25-PRI      0.388 POINT  1999
6 09001 10200602 PM25-PRI      1.49  POINT  1999
7 09001 10200603 PM25-PRI      0.2   POINT  1999
8 09001 10300401 PM25-PRI      0.081 POINT  1999
9 09001 10300501 PM25-PRI      0.184 POINT  1999
10 09001 10300504 PM25-PRI     0.273 POINT  1999
# ... with 6,497,641 more rows

class(NEI)
[1] "tbl_df"     "tbl"        "data.frame"

# I want to know how many types of years i have in year column

table(NEI$year)
1999    2002    2005    2008 
1108469 1698677 1713850 1976655 

Totpm_by_year <- NEI %>% group_by(year) %>% summarise(Totalpm25 = sum(Emissions, na.rm = T))
Totpm_by_year

A tibble: 4 x 2
year Totalpm25
<int>     <dbl>
1  1999  7332967.
2  2002  5635780.
3  2005  5454703.
4  2008  3464206.

with(Totpm_by_year, plot(year, Totalpm25, pch = 3 , col = "magenta", xlab = "Year", 
ylab = "Total Emissions (tons)", main = " Total Anual Emissions by year"))

# The horizontal line is only informative
abline(h = median(Totpm_by_year$Totalpm25))

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
Totpm_2008 <- Totpm_by_year[Totpm_by_year$year == 2008, 2]
Totpm_1999 <- Totpm_by_year[Totpm_by_year$year == 1999, 2]
decrease_Totpm <- Totpm_1999 - Totpm_2008
decrease_Totpm

Totalpm25
1   3868761

dev.copy(png, "plot1.png")
dev.off()



