get.populationdf <- function(bbox, year=2020, res=0.5) {
    ## res values are 10, 5, 2.5, and 0.5.  .5 corresponds to ~ 1km grid.
    pop <- population(year, res, path=tempdir())

    e <- ext(bbox["x", "min"], bbox["x", "max"],
             bbox["y", "min"], bbox["y", "max"])

    ## crop to our bounding box
    popc <- crop(pop, e)

    ## make it into a data frame and then to sf geom points
    out <- as.data.frame(popc, xy=T)

    ## calculate a population per cell popdens * area(km^2)
    out <- out %>% mutate( population = population_density * .9261 * .9261 * cos(y/180*pi))

    out <- sfheaders::sf_point(out, x="x", y="y", keep = T)

    ## set coordinate reference system for the df
    st_crs(out) = crs(popc)

    out
}

popdf <- get.populationdf(bbox)
popdf$l <- round(popdf$population_density/1000,1)
popdfs <- popdf[which(popdf$l >= 1),]

p <- ggplot(xsf) + geom_sf() + geom_sf_text(data=popdfs, aes(label=l))


## this is how to save a pdf for printing

pdf(file="tmp.pdf", width=24, height=36)
show(p)
dev.off()

