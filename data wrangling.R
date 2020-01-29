library(rvest)
url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&oldid=919733895"    # permalink
h <- read_html(url)
class(h)
h
tab <- h %>% html_nodes("table")
tab <- tab[[2]]

tab <- tab %>% html_table
tab <- tab[[2]]
tab
