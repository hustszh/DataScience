library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# select data from baltimore
baltimore_emissions <- NEI %>% 
                       filter( fips=="24510" ) %>%
                       select( Emissions, type, year ) %>%
                       group_by( year, type ) %>%
                       summarize( sum(Emissions) )
names(baltimore_emissions) <- c("year","type", "emissions")

# open device
png(filename="plot3.PNG", width=760, height=460, units="px")

# plot data
q <- qplot(year, emissions, data=baltimore_emissions, color=type,
           geom=c("point","smooth"), method="lm", facets=.~type) +
     ggtitle("Baltimore Emissions") 
print( q )

#close device
dev.off()

