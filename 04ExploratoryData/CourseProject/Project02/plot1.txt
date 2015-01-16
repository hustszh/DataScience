library(dplyr)

# read data
NEI <- readRDS("summarySCC_PM25.rds")

# group date by year
total_by_year <- NEI %>% group_by( year ) %>% summarize( sum(Emissions) )
names(total_by_year) <- c("year","emissions")

# open device
png(filename="plot1.PNG", width=480, height=480, units="px")

# plot data
with( total_by_year,
      plot(year, emissions, xaxt="n", main="Total Emissions by Year") )
axis( side=1, at=total_by_year$year ) # add X axis

# add linear regression line
model <- lm( emissions ~ year, total_by_year )
abline( model, lwd=2, col="red" )

#close device
dev.off()

