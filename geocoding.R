library(tidyverse)
library(ggmap)


g <- read.csv("Nevada_Geocode.csv")
t <- g[1,4]

s <-  d[1,c("state")]

m <-  regexpr(pattern,t)


l <- regmatches(t, gregexpr("\\b[A-Z]\\w+",t))


l$locality[3]

x <- paste(l$locality[3], s, sep = ",")

g$results[[1]]$geometery$bound$southwest$lat

g$results[[1]]$geometery$bound$southwest$lng


pattern <-  "\\b[A-z]\\w+"


geocodeQueryCheck(userType = "free")

install.packages("RVerbalExpressions")
library(RVerbalExpressions)
strings = c('US 110','LA 690','la. 22', 'I10')

expr =  rx_alpha() 
stringr::str_extract_all(strings,expr)  

expr =  rx_digit() 
stringr::str_extract_all(strings,expr)  


expr =  rx_alpha()  %>%  rx_word() %>% rx_alpha() 
stringr::str_extract_all(strings,expr) 

expr

"[A-z]\\d+"

sksks
