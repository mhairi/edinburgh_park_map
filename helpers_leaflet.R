library(leaflet)
library(dplyr)

# Load in the cleaned park data, in a dataframe called parks
load('park_data.RData')

make_map <- function(){ 
  # Plot all the parks
    
  m <- leaflet() %>%
       addTiles() %>%
       addMarkers(m,
                  lng = parks$location_y,
                  lat = parks$location_x,
                  popup = parks$Name)
  return(m)
}

update_map <- function(subset = rep(TRUE, nrow(parks))){ 
  # Update a leaflet map for a certain subset of the parks
  # by default plot everything
  
  plotted_parks <- parks[subset,]

  m <- leafletProxy("map") %>%
       clearMarkers() %>%
       addMarkers(lng=plotted_parks$location_y,
                  lat=plotted_parks$location_x,
                  popup=plotted_parks$Name)
  return(m)
}

select_subset <- function(option){
  # Take any text string and turn it into a subset of parks
  # 'Anything' is a special case, returns all parks
  
 if (option == 'Anything')  return(rep(TRUE, nrow(parks)))  
 
 grepl(option,
       parks$Facilities ,
       ignore.case=TRUE)  
}

#Some sensible subset options I selected
options <- c('Anything','Seating', 'Play', 'Football', 'Walk',
             'Natural Heritage Service', 'Woodland', 'Wildlife',
             'Garden', 'Interpretation Panels', 'Picnic', 'Playing Fields',
             'Toilet', 'Ball Court', 'Car Park', 'Grassed Areas', 
             'Cricket', 'Skateboard', 'BMX', 'Views', 'Floral Displays', 
             'Monument', 'Games Area', 'River', 'Rugby', 'Teenage', 'Pond',
             'Allotments', 'Bike', 'Cycle', 'Cafe', 'Orienteering')


