pacman::p_load(dplyr, tidyr, janitor, tidyr, ggplot2, rio, here, geofacet, DT, RColorBrewer, ggiraph, readr, forcats)
pacman::p_load(leaflet, glue, sf, tmap, tmaptools, tidycensus, ggmap, htmltools, htmlwidgets, maps, mapview)
pacman::p_load_gh(c("walkerke/tigris", "bhaskarvk/leaflet.extras")) 

library(ggplot2)
library(maps)

setwd("/Users/lisawilliams/code/roller_hockey_rinks")
getwd()

# The following code is from a tutorial at this address: 
# https://youtu.be/iai4iXIM7xs?si=1N1jJC1AOeq9-NLk

#let's add a base map of the world
#world_coordinates <-map_data("world")
#this also creates a dataframe called world_coordinates with 99K lines

roller_rinks_ma <- rio::import("/Users/lisawilliams/code/roller_hockey_rinks/roller_hockey_rinks.csv")

is.data.frame(roller_rinks_ma)

# View(roller_rinks_ma)

roller_rinks_ma_map <- mapview(roller_rinks_ma, xcol = "Longitude", ycol = "Latitude", crs = 4269, grid = FALSE)

roller_rinks_ma_map

# this works 


