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
Council_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookups/council lookup.csv")
Interminate_Zone_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookups/iz2011_codes_and_labels_14072022.csv")
Data_Zone_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookups/dz2011_codes_and_labels_21042020.csv")

HB_Lookup_Cleaned <- HB_Lookup |>
  select(-Country,-HBDateEnacted)|>
  filter(is.na(HBDateArchived))|>
  select(-HBDateArchived)

Council_Lookup_Cleaned <- Council_Lookup |>
  select(CA,CAName,CADateArchived)|>
  filter(is.na(CADateArchived))|>
  select(-CADateArchived)

Interminate_Zone_Lookup_Cleaned <- Interminate_Zone_Lookup|>
  select(IntZone,IntZoneName,CA, HB)

