
fwf <- read.fwf("getdata-wksst8110.for", skip=4,
                widths=c(-1, 9, rep( c(-5, 4, 4), times=4 ) ) )

names(fwf) <- c("Week", rep( c("SST", "SSTA"), times=4 ) )

total <- sum(fwf[,4])