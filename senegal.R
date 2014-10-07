closeAllConnections()
rm(list=ls())
setwd("C:/Users/Andrew/Desktop/D4D_Senegal")

library(maps)
library(rgdal) #this lets you handle shape files with readOGR()
library(maptools)
#library(gpclib) 
#gpclibPermit() #needs to be true - load maptools before gpclib
library(ggplot2)
library(plyr)
library(RColorBrewer)
library(scales)

#admin files go from lowest detail (0) to most detail (3)
admin = readShapeSpatial('senegal_shapefiles/SEN_adm0.shp')
roads = readShapeSpatial('senegal_shapefiles/SEN_roads.shp')
waterfills = readShapeSpatial('senegal_shapefiles/SEN_water_areas_dcw.shp')
waterways = readShapeSpatial('senegal_shapefiles/SEN_water_lines_dcw.shp')
rails = readShapeSpatial('senegal_shapefiles/SEN_rails.shp')

cities = read.csv("city_location_population.csv")
  
plot(roads, col="grey")
#plot(waterfills, add=TRUE, col="lightblue", border="NA")
plot(waterways, add=TRUE, col="blue")
plot(rails, add=TRUE, col="red", lty=6)
plot(admin, add=TRUE)
points(cities$lon, cities$lat, pch=16, col=alpha("darkgreen",0.5), cex=0.5)
