library(curl)


gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpURL, destfile="./data/gdp.csv")
gdp <- read.csv("./data/gdp.csv", header=TRUE, blank.lines.skip=TRUE, row.names=NULL)
gdp <- gdp[gdp[,2] %in% 1:190,] #取出有排名的数据



educationURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(educationURL, destfile="./data/education.csv")
education <- read.csv("./data/education.csv", header=TRUE, blank.lines.skip=TRUE)


mergedData <- merge(gdp, education, by.x="X", by.y="CountryCode")
sort(as.numeric(mergedData[,"X.3"]), decreasing=TRUE)[13]

#找出不在mergedData的国家
gdp[!(gdp[,1] %in% mergedData[,1]),]
gdp[is.na(match(gdp[,1], mergedData[,1])),]


1:190 %in% gdp[,2]
duplicated(gdp[,2])

sort(as.numeric(gdp[,"X.3"]),decreasing=TRUE)
length(sort(as.numeric(gdp[,"X.3"]),decreasing=TRUE))
s <- sort(as.numeric(gdp[,"X.3"]),decreasing=TRUE)[13]
gdp[gdp[,2]==s,]


