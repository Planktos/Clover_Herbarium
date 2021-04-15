library(tidyverse)
library(ggmap)
library(plyr)


g <- read.csv("Nevada_Geocode.csv", stringsAsFactors = F)
colnames(g) <- tolower(colnames(g))
g$x <- NULL


#Match text string in object 'l' from Locallity filed to town/city names in 'USA' file
load("US.Rdata")
head(d)
la <- d[d$`admin1_code `== "LA",]
rm(d)

las <- la[,c("name","latitude","longitude")]


#loop through the herbarium sample list row by row and see if the locality matches with the us cities/towns data
geo.code.list = list()

for (i in 1:nrow(g)) {
  
  x <- g[i,]
  
  locallity <- x$locallity
  
  #m <-  regexpr(pattern = pattern,t)
  
  #extracts text strings with capitalized letters
  upper.strings <- regmatches(locallity, gregexpr("\\b[A-Z]\\w+", locallity))
  upper.strings <- as.data.frame(upper.strings)
  colnames(upper.strings) <- c("locallity")
  upper.strings$locallity <- as.character(upper.strings$locallity)

  match.df <- ddply(.data = upper.strings, .variables = c("locallity"), function(m){
    
    #change 'upper.strings' to 'm')
  
    match <- la[grepl(pattern = paste("^", m,"$", sep=""), x = la$name),]
    
    match.geo <- match[,c("name","latitude","longitude")]
    
    match.geo.sample <- cbind(match.geo, x)
    match.geo.sample <- match.geo.sample[,c(4:17,1:3)]
    
    return(match.geo.sample)
    
  }, .inform = T, .progress = "text")
  
  match.df <- match.df[!is.na(match.df$name),]
  geo.code.list[[i]] <- as.list(match.df)

  }
  
  big_data <- data.table::rbindlist(geo.code.list)
  
  big_data = big_data[!duplicated(big_data$cpingsample.),]

  save(big_data, file="LA_Herb_GeoCode_Cities.Rdata")
  