library(curl)
library(plyr)

gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpURL, destfile="./data/gdp.csv")
gdp <- read.csv("./data/gdp.csv", header=TRUE, blank.lines.skip=TRUE,
                row.names=NULL, stringsAsFactors=FALSE )
gdp <- gdp[gdp[,2] %in% 1:190,] #取出有排名的数据
gdp <- gdp[,c(1,2,5)]
names(gdp) <- c("id", "rank","gdp")
row.names(gdp) <- NULL

educationURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(educationURL, destfile="./data/education.csv")
education <- read.csv("./data/education.csv", header=TRUE,
                      blank.lines.skip=TRUE, stringsAsFactors=FALSE)
education <- education[,c("CountryCode","Long.Name","Income.Group")]
names(education) <- c("id","country","income")

joinData <- join(gdp, education, by="id", type="inner")
joinData$gdp <- gsub("[, ]", "", joinData$gdp)
joinData$gdp <- as.numeric(joinData$gdp)
joinData$income <- factor(joinData$income)

#对income进行分组，求出每组的平均值
income_mean <- tapply(joinData$gdp, joinData$income, mean)
# "High income: OECD" group
sum(income_mean[2] < joinData$gdp)

#"High income: nonOECD" group
sum(income_mean[1] < joinData$gdp)
