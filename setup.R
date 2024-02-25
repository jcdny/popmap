options(repos=c("https://cran.rstudio.com/", "https://cloud.r-project.org/"))

package.list  <- c(
    'tidyverse'
  , 'tictoc'
  , 'sf'        ## read shape files and general geometry stuff
)

install.packages(package.list)

