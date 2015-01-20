library(jpeg)
library(curl)

if( !file.exists("./data") ) {
  dir.create("./data")
}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(url, destfile="./data/jeff.jpg", mode="wb" )

jpg <- readJPEG("./data/jeff.jpg", native=TRUE)

quantile(jpg, probs=c(0.3, 0.8))
