library(stringr)

#Load in data
parks <- read.csv('parksandgardens.csv', stringsAsFactors=FALSE)

#Change location from string to two vectors
location <- str_split(parks$Location, ',')
location <- sapply(location, as.numeric)

parks$location_x <- location[1, ]
parks$location_y <- location[2, ]

save(parks, file='park_data.RData')
