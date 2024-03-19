osm_intersect <- function(osm, bound) {
    fields <- c('osm_points', 'osm_lines', 'osm_polygons', 'osm_multilines', 'osm_multipolygons')

    for (f in fields) {
        if(is(osm[[f]], "sf")) {
            osm[[f]] <- st_intersection(osm[[f]], bound)
        }
    }

    osm
}

marin <- xsf[xsf$NAME_2 == "Marin", ]
protectedM.crop <- osm_intersect(protectedM, marin)

