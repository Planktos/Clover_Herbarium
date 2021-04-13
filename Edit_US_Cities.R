library(data.table)

d <-  fread(file = "US/US.txt", sep = "\t", encoding = "UTF-8", quote = "")

m <-  read.table(file = "uscities_readme.txt", sep = ":", header = F, skip = 43)

colnames(d)[1] <-  "geonameid"
colnames(d)[2] <-  "name"
colnames(d)[3] <-  "asciiname"
colnames(d)[4] <-  "alternatenames"
colnames(d)[5] <-  "latitude"
colnames(d)[6] <-  "longitude"
colnames(d)[7] <-  "feature_class"
colnames(d)[8] <-  "feature_code "
colnames(d)[9] <-  "country_code"
colnames(d)[10] <-  "cc2"
colnames(d)[11] <-  "admin1_code "
colnames(d)[12] <-  "admin2_code "
colnames(d)[13] <-  "admin3_code "
colnames(d)[14] <-  "admin4_code"
colnames(d)[15] <-  "population"
colnames(d)[16] <-  "elevation"
colnames(d)[17] <-  "dem"
colnames(d)[18] <-  "timezone"
colnames(d)[19] <-  "modification_date"

skls