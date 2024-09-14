# Libraries

library(shiny)
library(DT)
library(data.table)
library(ggplot2)
library(shinydashboard)
library(readr)
library(dplyr)
library("readxl")
library("RColorBrewer")
library(rsconnect)
library(base)
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(readr)
library(readxl)
library(RColorBrewer)
library(stats)
library(utils)
library(sf)
library(writexl)
library(base64enc)
library(maps)
library(rgdal)
library(maptools)
library(sf)
library(cowplot)
library(googleway)
library(ggrepel)
library(ggspatial)
library(maps)
library(mapproj)
library(tmap)
library(tmaptools)
library(sf)
library(phsopendata)
library(plotly)
library(crosstalk)
library(lubridate)
library(kableExtra)
### Filter Changes

ref_file_list <- c("Hospital Lookup" = "Hospital_Lookup_Cleaned",
                   "Data Zone Lookup" = "Data_Zone_Lookup_Cleaned",
                   "Interminate Zone Lookup" = "Interminate_Zone_Lookup_Cleaned",
                   "Council Lookup" = "Council_Lookup_Cleaned",
                   "HB Lookup" =" HB_Lookup")

#### Geo Lookup Script ####
source(file.path('C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/data prep (sources)/Geo Lookup Source Script.R'))
source(file.path('C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/data prep (sources)/WeeklyA&EActivityandWaitingTimesPrep.R'))