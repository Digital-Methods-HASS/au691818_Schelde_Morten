library(tidyverse)
library(googlesheets4)
library(leaflet)

Locations <- read_csv("KTJ - Ark1.csv")

glimpse(Locations)

Locations <- separate(Locations, Coordinates, into = c("Latitude", "Longitude"), sep = ",")

Locations$Latitude <- as.numeric(Locations$Latitude)
Locations$Longitude <- as.numeric(Locations$Longitude)

leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(lng = Locations$Longitude,
             lat = Locations$Latitude,
             popup = Locations$Description, clusterOptions = markerClusterOptions(),
             color = "red")






