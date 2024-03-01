options(repos=c("https://cran.rstudio.com/", "https://cloud.r-project.org/"))

package.list  <- c(
    'tidyverse'
  , 'tictoc'
  , 'sf'      ## read shape files and general geometry stuff
  , 'osmdata' ## open street maps query engine
)

install.packages(package.list)

