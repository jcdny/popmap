library(ggplot2)
library(sf)
library(osmdata)

bbox <- getbb('Marin County, CA')

roads <- opq(bbox) %>%
    add_osm_feature(key = "highway",
                    value = c("motorway", "trunk", "primary")) %>%
    osmdata_sf()

## might not nead all SF features for roads?
ggplot(roads$osm_lines) +
    geom_sf() +
    geom_sf(data=roads$osm_polygons) +
    geom_sf(data=roads$osm_multipolygons) +
    geom_sf(data=roads$osm_multilines)
