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

 #### 100k rates dataset
 
 merged_ae_data_100k_rate <- merged_ae_data %>% 
   filter(WeekEndingDate > '2020-01-01') %>% 
   mutate(Year = WeekEndingDate) %>% 
   mutate(Year = gsub("2023", "2022", Year)) %>% 
   mutate(Year = gsub("2024", "2022", Year)) %>% 
   mutate(Year = gsub("2025", "2022", Year))
 
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

### Closes not needed dataframes to free up memory usage

rm(merged_ae_data_100k_rate)
rm(merged_ae_data)
rm(total_ae_episodes_healthboard_level)
rm(total_ae_episodes_healthboard_level_cleaned)
rm(total_ae_episodes_seen_over_eight_hours)
rm(total_ae_episodes_seen_over_four_hours)
rm(total_ae_episodes_seen_over_twelve_hours)
rm(accidentandemergencydata_cleaned)
rm(accidentandemergencydata)