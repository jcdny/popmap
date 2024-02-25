library(sf)
library(ggplot2)

shape.load.cache <- function(fnm) {

    tile.cache <- NULL

    function() {
        if (! file_test("-d", fnm)) {
            warning(fnm, "shape directory missing")
        } else {
            if (is.null(tile.cache)) {
                tile.cache <<- st_read(fnm)
            }
        }

        tile.cache
    }
}

get.tile.map <- shape.load.cache("data/tiles-WGS84-30arcsec-shape")

if (TRUE) {
    tilemap <- get.tile.map()
    p.tilemap <- ggplot(tilemap) + geom_sf()

    ## read the marin parcel data
    parcel <- shape.load.cache("data/marin-parcel-shape")()

    ## needs to be in same coord ref system
    parcel <- st_transform(parcel, crs=st_crs(tilemap))

    ## get marin bbox as a geometry obj
    parcel.bbox <- st_as_sfc(st_bbox(parcel))

    ## compute intersecting tiles
    tiles <- st_intersection(tilemap, parcel.bbox)

    ## retrieve the tile from the server
}
