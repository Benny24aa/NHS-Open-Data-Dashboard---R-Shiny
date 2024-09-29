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

### Data list for filter on UI for reference files
ref_file_list <- c("Hospital Lookup" = "Hospital_Lookup_Cleaned",
                   "Data Zone Lookup" = "Data_Zone_Lookup_Cleaned",
                   "Interminate Zone Lookup" = "Interminate_Zone_Lookup_Cleaned",
                   "Council Lookup" = "Council_Lookup_Cleaned",
                   "HB Lookup" =" HB_Lookup")


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

Hospital_Lookup_Final <- Hospital_Lookup_Cleaned |>
  select(HospitalCode, HospitalName)