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


####### Necessary Lookup Files ########
HB_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookups/hb lookup.csv")

####### Data Cleaning to speed up processes when called upon by server ########

# Healthboard Lookup File
HB_Lookup_Cleaned <- HB_Lookup |>
  select(-Country,-HBDateEnacted)|>
  filter(is.na(HBDateArchived))|>
  select(-HBDateArchived)

# Council Lookup File
Council_Lookup_Cleaned <- Council_Lookup |>
  select(CA,CAName,CADateArchived)|>
  filter(is.na(CADateArchived))|>
  select(-CADateArchived)