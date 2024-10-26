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
rm(ae_age_analysis, deprivation_ae_analysis, gender_ae_analysis)