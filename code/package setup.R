#list of packages to install
cran_pkg <- c("BiocManager", "bookdown", "dplyr", "ecodist", "ggplot2", 
              "gridExtra", "kableExtra", "knitr", "scales", "vegan")
bioc_pkg <- c("ANCOMBC", "ape", "DESeq2",  "DirichletMultinomial", "mia", "miaViz")

#Lists of packages alrdy installed
cran_pkg_already_installed <- cran_pkg[ cran_pkg %in% installed.packages() ]
bioc_pkg_already_installed <- bioc_pkg[ bioc_pkg %in% installed.packages() ]

#Lists of packages to install
cran_pkg_to_be_installed <- setdiff(cran_pkg, cran_pkg_already_installed)
bioc_pkg_to_be_installed <- setdiff(bioc_pkg, bioc_pkg_already_installed)

#command to get packages to install from CRAN
if( length(cran_pkg_to_be_installed) ) {
  install.packages(cran_pkg_to_be_installed)
}

#command to get packages to install from bioc
if( length(bioc_pkg_to_be_installed) ) {
  BiocManager::install(bioc_pkg_to_be_installed, ask = F)
}

#reorder packages to prioritize mia and miaViz (since some functions overlap)
bioc_pkg <- c(bioc_pkg[ bioc_pkg %in% c("mia", "miaViz") ], 
              bioc_pkg[ !bioc_pkg %in% c("mia", "miaViz") ] ) 

# Loading all packages into session. Returns true if package was successfully loaded.
loaded <- sapply(c(bioc_pkg, cran_pkg), require, character.only = TRUE)
as.data.frame(loaded)


