library(curl)

if( !file.exists("./data") ) {
  dir.create("./data")
}

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(url, destfile="./data/fid.csv")

fid <- read.csv("./data/fid.csv")

str(fid)

ags <- fid[fid$AGS==6 & !is.na(fid$AGS),]

acr <- fid[fid$ACR==3 & !is.na(fid$ACR),]


agricultureLogical <- fid$AGS==6 & fid$ACR==3
which(agricultureLogical)
