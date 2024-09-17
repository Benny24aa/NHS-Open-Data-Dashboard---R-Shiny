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

#################### Preparing Data for Plotly Graphs and Analysis for Healthboard Level Section by Measure on NHS Open Data ###############################################

### Total Number of People who attended A&E - Health Board Level ###

total_ae_episodes_healthboard_level <- accidentandemergencydata_cleaned %>%  ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOfAttendancesEpisode) %>% # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattends = sum(NumberOfAttendancesEpisode), .groups = 'drop')#Summing totals based on group_by to have a single colum per hbname per weekendingdate


### Total Number of People who attended weren't seen within 4 hours - Health Board Level###

total_ae_episodes_seen_over_four_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver4HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover4hours = sum(NumberOver4HoursEpisode), .groups = 'drop') #Summing totals based on group_by to have a single colum per hbname per weekendingdate

### Total Number of People who attended weren't seen within 8 hours - Health Board Level###

total_ae_episodes_seen_over_eight_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver8HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover8hours = sum(NumberOver8HoursEpisode), .groups = 'drop')#Summing totals based on group_by to have a single colum per hbname per weekendingdate



### Total Number of People who attended weren't seen within 12 hours - Health Board Level###

total_ae_episodes_seen_over_twelve_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver12HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover12hours = sum(NumberOver12HoursEpisode), .groups = 'drop')#Summing totals based on group_by to have a single colum per hbname per weekendingdate


#################### Preparing Data for Plotly Graphs and Analysis for Healthboard Level Section creating own measure of totals minus people not seen ###############################################

