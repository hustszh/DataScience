
url <- "http://biostat.jhsph.edu/~jleek/contact.html"

con <- url(url)
htmlCode <- readLines(con, 10)
nchar(htmlCode)

htmlCode <- readLines(con, 20)
nchar(htmlCode)

htmlCode <- readLines(con, 30)
nchar(htmlCode)

htmlCode <- readLines(con, 100)
nchar(htmlCode)
