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
world_coordinates <-map_data("world")
#this also creates a dataframe called world_coordinates with 99K lines


# call ggplot to plot it and give ggplot arguments
map1<-ggplot() +
  geom_map(
    data = world_coordinates, map = world_coordinates,
    aes(long, lat, map_id = region), 
    color = "black", fill = "lightgreen", linewidth = 0.2)

#plot the map
map1

#this produces a political map of the world with countries outlined in black and filled in lime green. 

#let's make a cleaned up map. 

map2<-ggplot() + 
  geom_map(
    data = world_coordinates, map = world_coordinates,
    aes(long, lat, map_id = region), 
    color = "black", fill = "lightgreen", linewidth = 0.2)

map2 + theme(panel.background = element_rect(fill = "lightblue"),
        panel.grid.minor = element_line(color="lightblue"),
        panel.grid.major = element_line(color="lightblue"),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
  )


roller_rinks_ma <- rio::import("/Users/lisawilliams/code/roller_hockey_rinks/roller_hockey_rinks.csv")

is.data.frame(roller_rinks_ma)

View(roller_rinks_ma)

map3 <- map2 + 
  geom_point(
    data = roller_rinks_ma, 
    aes(x = Longitude, y = Latitude), color = "red", 
    size = .5, alpha = 1)

map3 + theme(panel.background = element_rect(fill = "lightblue"),
             panel.grid.minor = element_line(color="lightblue"),
             panel.grid.major = element_line(color="lightblue"),
             axis.title.x = element_blank(),
             axis.text.x = element_blank(),
             axis.ticks.x = element_blank(),
             axis.title.y = element_blank(),
             axis.text.y = element_blank())

# this produces a world map with some dots in the right place, but it's a map of the whole world
# so not too useful for our purposes

# need to find a way to show the region we want, zoomed in 
# might try this 
# `https://map-rfun.library.duke.edu/01_georeference.html`      

roller_rinks_ma_map <- mapview(roller_rinks_ma, xcol = "Longitude", ycol = "Latitude", crs = 4269, grid = FALSE)

#this makes a readable, interactive map which is pretty cool for one line o' code

#display map
roller_rinks_ma_map

# when I put in the new data I get the following error message: 
# Error in data[[y]] * aspect : non-numeric argument to binary operator

# let's check the classes 

sapply(roller_rinks_ma, class)

# OK I see the problem, Latitude column now reads as "character" while
# Longitude is numeric 

# this is how I did it w the MA Contractors data
# veteran_owned_contractors_ma$Actual_Spend <-parse_number(veteran_owned_contractors_ma$Actual_Spend)

roller_rinks_ma$Latitude <- parse_number(roller_rinks_ma$Latitude)

#let's see if that works

sapply(roller_rinks_ma, class)

#OK now Latitude and Longitude are both numeric so let's try plotting again 

roller_rinks_ma_map <- mapview(roller_rinks_ma, xcol = "Longitude", ycol = "Latitude", crs = 4269, grid = FALSE)


roller_rinks_ma_map

# this works 


