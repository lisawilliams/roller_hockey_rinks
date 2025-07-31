pacman::p_load(dplyr, tidyr, janitor, tidyr, ggplot2, rio, here, geofacet, DT, RColorBrewer, ggiraph, readr, forcats)
pacman::p_load(leaflet, glue, sf, tmap, tmaptools, tidycensus, ggmap, htmltools, htmlwidgets, maps, mapview)
pacman::p_load_gh(c("walkerke/tigris", "bhaskarvk/leaflet.extras")) 

library(ggplot2)
library(maps)

setwd("/Users/lisawilliams/code/roller_hockey_rinks")
getwd()

roller_rinks_ma <- rio::import("/Users/lisawilliams/code/roller_hockey_rinks/roller_hockey_rinks.csv")

is.data.frame(roller_rinks_ma)

# In case I want to view the dataframe 
# View(roller_rinks_ma)

# `found the idea for this approach here -- great for my purposes as it lets 
# me generate an interactive map with a single line of code 
# https://map-rfun.library.duke.edu/01_georeference.html`  

roller_rinks_ma_map <- mapview(roller_rinks_ma, xcol = "Longitude", ycol = "Latitude", crs = 4269, grid = FALSE)

# display map 
roller_rinks_ma_map

# this works 


