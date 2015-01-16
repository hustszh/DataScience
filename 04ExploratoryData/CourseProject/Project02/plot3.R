library(dplyr)
library(ggplot2)

# read data
NEI <- readRDS("summarySCC_PM25.rds")

# group date by year
emissions_by_year <- NEI %>% 
                 filter( fips=="24510" )  %>% 
                 group_by( year ) %>% 
                 summarize( sum(Emissions) )
names(emissions_by_year) <- c("year","emissions")

# open device
png(filename="plot2.PNG", width=480, height=480, units="px")

# plot data
with( emissions_by_year,
      plot(year, emissions, xaxt="n", main="Baltimore Total Emissions by Year") )
axis( side=1, at=emissions_by_year$year ) # add X axis

# add linear regression line
model <- lm( emissions ~ year, emissions_by_year )
abline( model, lwd=2, col="red" )

#close device
dev.off()

