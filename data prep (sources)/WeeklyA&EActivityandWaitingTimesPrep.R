### Weekly Accident and Emergency Data taken from Open Data through PHS Open Data Library
accidentandemergencydata <- get_resource(res_id = "a5f7ca94-c810-41b5-a7c9-25c18d43e5a4")

accidentandemergencydata_cleaned <- accidentandemergencydata |>
  select(-Country,-DepartmentType)|> ### Removed both columns as both have the same value for all rows
  rename(HospitalCode = TreatmentLocation)|> ### To allow for future left_join with Hospital reference file
  rename(HB = HBT)  ### To allow for future left_join with HBT reference file
 

accidentandemergencydata_cleaned <- left_join(accidentandemergencydata_cleaned, Hospital_Lookup_Final, by = "HospitalCode") %>%  ### Left Join for Hospital Names
  select(-HospitalCode) #### Removing hospital code as no longer needed anymore so removed to reduce size of dataframe

accidentandemergencydata_cleaned <- left_join(accidentandemergencydata_cleaned, HB_Lookup_Cleaned, by = "HB") %>% #### left join for Healthcode Name
  select(-HB)  %>%   #### Removing HB code as not needed anymore so removed to reduce size of dataframe
  mutate(HBName = gsub("NHS ", "", HBName)) #Reducing the Size of the dataset by removing NHS from every column

# Sourcing in Healthboard Analysis
source(file.path('C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/data prep (sources)/weeklyAEsubsources/Healthboard Analysis.R'))
