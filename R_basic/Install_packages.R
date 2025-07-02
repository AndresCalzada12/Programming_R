###Install packages. This process may take some time, please be patient. 

#Steps:

#1.Please select the lines 8-18
#2 Run the current selection (Ctrl+enter)

pkgs<-c("knitr","mapproj","ggrepel","ggmap","tidyverse",
        "raster","terra", "lubridate","sp","sf",
        "devtools","dplyr","cowplot","gridExtra","grid",
        "lattice","magick","ggspatial", "ncdf4", "ggplot2")

#Check installed packages
new.packages <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#Load packages
lapply(pkgs,library,character.only=TRUE)

