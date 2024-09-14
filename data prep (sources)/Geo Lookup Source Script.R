############################
####### Lookup Files #######
############################

####### Necessary Lookup Files ########
HB_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Initial Lookups/hb lookup.csv")
Council_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Initial Lookups/council lookup.csv")
Interminate_Zone_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Initial Lookups/iz2011_codes_and_labels_14072022.csv")
Data_Zone_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Initial Lookups/dz2011_codes_and_labels_21042020.csv")
Hospital_Lookup <- read.csv("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/Initial Lookups/hospitals.csv")
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

# Interminate Zone Lookup File
Interminate_Zone_Lookup_Cleaned <- Interminate_Zone_Lookup|>
  select(IntZone,IntZoneName,CA, HB) #CA and HB codes kept for future left_join when needed and to speed up app by removing unnecessary data when not needed.

# Data Zone Lookup File
Data_Zone_Lookup_Cleaned <- Data_Zone_Lookup |>
  select(DataZone, DataZoneName, IntZone, CA, HB) #Int_Zone, CA and HB codes kept for future left_join when needed and to speed up app by removing unnecessary data when not needed.

# Hospital Lookup File
Hospital_Lookup_Cleaned <- Hospital_Lookup |>
  select(HospitalCode, HospitalName, HealthBoard, CouncilArea, IntermediateZone, DataZone) ### Kept codes for future left_join when needed