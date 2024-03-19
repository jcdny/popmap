options(repos=c("https://cran.rstudio.com/", "https://cloud.r-project.org/"))

package.list  <- c(
    'tidyverse'
  , 'tictoc'
  , 'sf'      ## read shape files and general geometry stuff
  , 'sfheaders'
  , 'osmdata' ## open street maps query engine
  , 'geodata' ## general admin boundaries and such
)

install.packages(package.list)

