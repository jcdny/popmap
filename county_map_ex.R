library(ggplot2)
library(sf)
library(geodata)
library(osmdata)


bbox <- getbb('Marin County, CA')

## get USA county level data
x <- gadm("USA", level=2, path="tmp")

## crop to the marin bbox
xsf <- st_crop(st_as_sf(x),
               xmin=bbox[1,1], ymin=bbox[2,1],
               xmax=bbox[1,2], ymax=bbox[2,2])

ggplot(xsf) + geom_sf() + geom_sf(data=xsf[xsf$NAME_2=="Marin",], fill="red")
