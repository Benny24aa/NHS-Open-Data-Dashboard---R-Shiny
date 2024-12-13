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

############################
####### Lookup Files #######
############################

####### Necessary Lookup Files ########
HB_Lookup <- get_resource(res_id = "652ff726-e676-4a20-abda-435b98dd7bdc")
Council_Lookup <- get_resource(res_id = "967937c4-8d67-4f39-974f-fd58c4acfda5")
Interminate_Zone_Lookup <- get_resource(res_id = "e3e885cc-2530-4b3c-bead-9eda9782264f")
Data_Zone_Lookup  <- get_resource(res_id = "395476ab-0720-4740-be07-ff4467141352")
Hospital_Lookup <- get_resource(res_id = "c698f450-eeed-41a0-88f7-c1e40a568acc")
####### Data Cleaning to speed up processes when called upon by server ########

# Healthboard Lookup File
HB_Lookup_Cleaned <- HB_Lookup |>
  select(-Country,-HBDateEnacted)|>
  filter(is.na(HBDateArchived))|>
  select(-HBDateArchived)

write_xlsx(HB_Lookup_Cleaned,"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookup Files for Tableau/HB_Tableau.xlsx")

# Council Lookup File
Council_Lookup_Cleaned <- Council_Lookup |>
  select(CA,CAName,CADateArchived)|>
  filter(is.na(CADateArchived))|>
  select(-CADateArchived)

write_xlsx(Council_Lookup_Cleaned,"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookup Files for Tableau/Council_Tableau.xlsx")


# Interminate Zone Lookup File
Interminate_Zone_Lookup_Cleaned <- Interminate_Zone_Lookup|>
  select(IntZone,IntZoneName,CA, HB) #CA and HB codes kept for future left_join when needed and to speed up app by removing unnecessary data when not needed.

write_xlsx(Interminate_Zone_Lookup_Cleaned,"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookup Files for Tableau/Interm_Tableau.xlsx")

# Data Zone Lookup File
Data_Zone_Lookup_Cleaned <- Data_Zone_Lookup |>
  select(DataZone, DataZoneName, IntZone, CA, HB) #Int_Zone, CA and HB codes kept for future left_join when needed and to speed up app by removing unnecessary data when not needed.

write_xlsx(Data_Zone_Lookup_Cleaned,"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookup Files for Tableau/DataZone_Tableau.xlsx")


# Hospital Lookup File
Hospital_Lookup_Cleaned <- Hospital_Lookup |>
  select(HospitalCode, HospitalName, HealthBoard, CouncilArea, IntermediateZone, DataZone) ### Kept codes for future left_join when needed

write_xlsx(Hospital_Lookup_Cleaned,"C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Lookup Files for Tableau/Hospitals_Tableau.xlsx")
