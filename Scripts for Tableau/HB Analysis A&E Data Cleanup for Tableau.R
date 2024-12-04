### Weekly Accident and Emergency Data taken from Open Data through PHS Open Data Library
accidentandemergencydata <- get_resource(res_id = "a5f7ca94-c810-41b5-a7c9-25c18d43e5a4")

accidentandemergencydata_cleaned <- accidentandemergencydata |>
  select(-Country,-DepartmentType)|> ### Removed both columns as both have the same value for all rows
  rename(HospitalCode = TreatmentLocation)|> ### To allow for future left_join with Hospital reference file
  rename(HB = HBT)  ### To allow for future left_join with HBT reference file


accidentandemergencydata_cleaned <- left_join(accidentandemergencydata_cleaned, Hospital_Lookup_Final, by = "HospitalCode") %>%  ### Left Join for Hospital Names
  select(-HospitalCode) #### Removing hospital code as no longer needed anymore so removed to reduce size of dataframe

accidentandemergencydata_cleaned <- left_join(accidentandemergencydata_cleaned, HB_Lookup_Cleaned, by = "HB") %>% #### left join for Healthcode Name
  select(-HB) # %>%   #### Removing HB code as not needed anymore so removed to reduce size of dataframe
# mutate(HBName = gsub("NHS ", "", HBName)) #Reducing the Size of the dataset by removing NHS from every column

#################### Preparing Data for Plotly Graphs and Analysis for Healthboard Level Section by Measure on NHS Open Data ###############################################

### Total Number of People who attended A&E - Health Board Level ###

total_ae_episodes_healthboard_level <- accidentandemergencydata_cleaned %>%  ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOfAttendancesEpisode) %>% # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattends = sum(NumberOfAttendancesEpisode), .groups = 'drop') #Summing totals based on group_by to have a single colum per hbname per weekendingdate


total_ae_episodes_healthboard_level_cleaned <- total_ae_episodes_healthboard_level %>% 
  mutate(type = "Total Attends") %>% 
  rename(totalseen = totalattends)
### Total Number of People who attended weren't seen within 4 hours - Health Board Level###

total_ae_episodes_seen_over_four_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver4HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover4hours = sum(NumberOver4HoursEpisode), .groups = 'drop') #Summing totals based on group_by to have a single colum per hbname per weekendingdate

total_ae_episodes_seen_over_four_hours <- full_join(total_ae_episodes_healthboard_level, total_ae_episodes_seen_over_four_hours, by = c("HBName", "WeekEndingDate")) %>%  # for subtraction of total
  mutate(afterfourhours = totalattends - totalattendsover4hours) %>%  # Number seen within 4 hours
  select(-totalattends,-totalattendsover4hours) %>% 
  mutate(type = "People seen within four hours") %>% 
  rename(totalseen = afterfourhours)


### Total Number of People who attended weren't seen within 8 hours - Health Board Level###

total_ae_episodes_seen_over_eight_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver8HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover8hours = sum(NumberOver8HoursEpisode), .groups = 'drop')#Summing totals based on group_by to have a single colum per hbname per weekendingdate

total_ae_episodes_seen_over_eight_hours <- full_join(total_ae_episodes_healthboard_level, total_ae_episodes_seen_over_eight_hours, by = c("HBName", "WeekEndingDate")) %>%  # for subtraction of total
  mutate(aftereighthours = totalattends - totalattendsover8hours) %>%  # Number seen within 8 hours
  select(-totalattends,-totalattendsover8hours) %>% 
  mutate(type = "People seen within eight hours") %>% 
  rename(totalseen = aftereighthours)
### Total Number of People who attended weren't seen within 12 hours - Health Board Level###

total_ae_episodes_seen_over_twelve_hours <- accidentandemergencydata_cleaned %>% ### Creating a new dataframe using cleaned dataset from open data
  select(HBName, WeekEndingDate, NumberOver12HoursEpisode) %>%  # Reducing dataframe to 3 required elements and piping it through to be grouped
  group_by(HBName, WeekEndingDate) %>% 
  summarise(totalattendsover12hours = sum(NumberOver12HoursEpisode), .groups = 'drop')#Summing totals based on group_by to have a single colum per hbname per weekendingdate

total_ae_episodes_seen_over_twelve_hours <- full_join(total_ae_episodes_healthboard_level, total_ae_episodes_seen_over_twelve_hours, by = c("HBName", "WeekEndingDate")) %>%  # for subtraction of total 
  mutate(aftertwelvehours = totalattends - totalattendsover12hours) %>%  # Number seen within 12 hours
  select(-totalattends,-totalattendsover12hours) %>% 
  mutate(type = "People seen within twelve hours")%>% 
  rename(totalseen = aftertwelvehours)

merged_ae_data<- bind_rows(total_ae_episodes_seen_over_four_hours, total_ae_episodes_seen_over_eight_hours, total_ae_episodes_seen_over_twelve_hours, total_ae_episodes_healthboard_level_cleaned) 



merged_ae_data$WeekEndingDate <- ymd(merged_ae_data$WeekEndingDate)

#### 100k rates dataset population estimates 

### Trick to get population estimates for recent data

merged_ae_data_100k_rate <- merged_ae_data %>% 
  filter(WeekEndingDate > '2020-01-01') %>% 
  mutate(Year = WeekEndingDate) %>% 
  mutate(Year = gsub("2024", "2023", Year)) %>% 
  mutate(Year = gsub("2025", "2023", Year))

merged_ae_data_100k_rate$Year <- year(merged_ae_data_100k_rate$Year)

merged_ae_data_100k_rate <- left_join(merged_ae_data_100k_rate,HB_Pop_Estimates,by = c("HBName", "Year")) #### Joining allages data onto dataset for rate calculation

merged_ae_data_100k_rate <- merged_ae_data_100k_rate %>% 
  select(-HB, -Year) %>% 
  mutate(Rate = totalseen/AllAges) %>% 
  mutate(Rate = Rate * 100000) %>% 
  select(-AllAges)

merged_ae_data_full_data <- full_join(merged_ae_data_100k_rate, merged_ae_data, by  = c("HBName", "WeekEndingDate", "type")) %>% 
  select(-totalseen.y) %>% 
  rename(totalseen = totalseen.x)


merged_ae_data_full_data_compare <- merged_ae_data_full_data

scotland_ae_data <- merged_ae_data_full_data_compare %>% 
  select(-Rate) %>% 
  filter(type == "Total Attends") %>% 
  select(-HBName, -type) %>% 
  group_by(WeekEndingDate) %>% 
  summarise('totalseen' = sum(totalseen), .groups = 'drop') %>% 
  filter(WeekEndingDate > '2020-01-05')

hbtypeaelist <- merged_ae_data_full_data %>% 
  distinct(HBName,type)

#######################################################################################################################################################################
# Healthboard Analysis - Demographic Data
#######################################################################################################################################################################

accidentandemergencydatademographicdata <- get_resource(res_id = "6abbf8e4-e4e0-4a56-a7b9-f7c7b4171ff3")


accidentandemergencydatademographicdata <- accidentandemergencydatademographicdata %>% 
  select(-Country, -AgeQF, -SexQF, -DeprivationQF) %>% 
  filter(DepartmentType == "Emergency Department") %>%  # only interested in emergency departments
  rename(HB = HBT) %>% # for left joining hb codes so names can appear
  select(-DepartmentType)  # only filtered above for ED so removed this as waste of a column


accidentandemergencydatademographicdata_cleaned <- left_join(accidentandemergencydatademographicdata, HB_Lookup_Cleaned, by = "HB") %>% 
  select(-HB)   # as left_join is complete, no need for HB code anymore

########## Age Based Analysis for Graph ##########

ae_age_analysis <- accidentandemergencydatademographicdata_cleaned %>% 
  select(-Deprivation, -Sex) %>% 
  group_by(HBName, Age, Month) %>% 
  summarise(NumberOfAttendances = sum(NumberOfAttendances), .groups = 'drop') %>% 
  mutate(type = "Age Based Data") %>% 
  rename(Category = Age)

ae_age_analysis$Category <- ae_age_analysis$Category %>% replace_na('Unknown') ### Replacing NA data with unknown

ae_age_analysis$Month <- ym(ae_age_analysis$Month)
########## Gender Based Analysis for Graph ##########

gender_ae_analysis <- accidentandemergencydatademographicdata_cleaned %>% 
  select(-Deprivation, -Age) %>% 
  group_by(HBName, Sex, Month) %>% 
  summarise(NumberOfAttendances = sum(NumberOfAttendances), .groups = 'drop')%>% 
  mutate(type = "Sex Based Data")%>% 
  rename(Category = Sex)

gender_ae_analysis$Category <- gender_ae_analysis$Category %>% replace_na('Unknown') ### Replacing NA data with unknown
gender_ae_analysis$Month <- ym(gender_ae_analysis$Month)
########## Deprivation Based Analysis for Graph ##########

deprivation_ae_analysis <- accidentandemergencydatademographicdata_cleaned %>% 
  select(-Sex, -Age) %>% 
  group_by(HBName, Deprivation, Month) %>% 
  summarise(NumberOfAttendances = sum(NumberOfAttendances), .groups = 'drop') %>% 
  mutate(type = "Deprivation Based Data")%>% 
  rename(Category = Deprivation)

deprivation_ae_analysis$Category <- as.character(deprivation_ae_analysis$Category) ### Changing Deprivation to a character rather than number

deprivation_ae_analysis$Category <- deprivation_ae_analysis$Category %>% replace_na('Unknown')### Replacing NA data with unknown

deprivation_ae_analysis <- deprivation_ae_analysis %>% 
  mutate(Category = gsub("1", "Deprivation Quintle 1 - Most Deprived", Category)) %>% 
  mutate(Category = gsub("2", "Deprivation Quintle 2", Category)) %>% 
  mutate(Category = gsub("3", "Deprivation Quintle 3", Category)) %>% 
  mutate(Category = gsub("4", "Deprivation Quintle 4", Category)) %>% 
  mutate(Category = gsub("5", "Deprivation Quintle 5 - Least Deprived", Category))
deprivation_ae_analysis$Month <- ym(deprivation_ae_analysis$Month)

merged_ae_demographic_data<- bind_rows(ae_age_analysis, deprivation_ae_analysis, gender_ae_analysis) 

hbcategorytype <- merged_ae_demographic_data %>% 
  distinct(HBName,type)

accidentandemergencydatawhendata<- get_resource(res_id = "022c3b27-6a58-48dc-8038-8f1f93bb0e78") %>% 
  select(-Country,-TreatmentLocation, -Week) %>% 
  filter(Month > '202212') %>% 
  filter(DepartmentType == "Emergency Department") %>% 
  select(-DepartmentType) %>% 
  group_by(HBT, Month, Hour, Day, InOut ) %>% 
  summarise(NumberOfAttendances = sum(NumberOfAttendances), .groups = 'drop') %>% 
  rename(HBName = HBT)