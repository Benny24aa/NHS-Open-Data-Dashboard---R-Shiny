diagnostics_waiting_times <- get_resource(res_id = "10dfe6f3-32de-4039-84c2-7e7794a06b31") ### Loads in data from open data scotland


#### Data Cleaning
diagnostics_waiting_times <- diagnostics_waiting_times %>% 
  select(-NumberOnListQF) %>% 
  rename(HB = HBT)

#### Joining HB code with HB Name to dataset
diagnostics_waiting_times <- full_join(HB_Lookup_Cleaned, diagnostics_waiting_times, by = "HB") %>% 
  filter(HB != "SB0801") %>%  ### Removed as not interested in this board
  select(-HB)

#### Converting monthending to date format.
diagnostics_waiting_times$MonthEnding <- ymd(diagnostics_waiting_times$MonthEnding)

### Imaging Dataset

diagnostics_waiting_times_imaging <- diagnostics_waiting_times %>% 
  filter(DiagnosticTestType == "Imaging")%>% 
  select(-DiagnosticTestType) 

diagnostics_waiting_times_imaging_100k_rate <- diagnostics_waiting_times_imaging %>% 
  filter(MonthEnding > '2020-01-01') %>% 
  mutate(Year = MonthEnding) %>% 
  mutate(Year = gsub("2024", "2023", Year)) %>% 
  mutate(Year = gsub("2025", "2023", Year))

diagnostics_waiting_times_imaging_100k_rate$Year <- substr(diagnostics_waiting_times_imaging_100k_rate$Year, 1, 4)

diagnostics_waiting_times_imaging_100k_rate$Year <- as.numeric(diagnostics_waiting_times_imaging_100k_rate$Year)

diagnostics_waiting_times_imaging_100k_rate <- left_join(diagnostics_waiting_times_imaging_100k_rate,HB_Pop_Estimates,by = c("HBName", "Year")) #### Joining allages data onto dataset for rate calculation

diagnostics_waiting_times_imaging_100k_rate <- diagnostics_waiting_times_imaging_100k_rate %>% 
  select(-HB, -Year) %>% 
  mutate(Rate = NumberOnList/AllAges) %>% 
  mutate(Rate = Rate * 100000) %>% 
  select(-AllAges)


### Endoscopy Dataset
diagnostics_waiting_times_endoscopy <- diagnostics_waiting_times %>% 
  filter(DiagnosticTestType == "Endoscopy") %>% 
  select(-DiagnosticTestType)

diagnostics_waiting_times_endoscopy_per_100k <- diagnostics_waiting_times_endoscopy %>% 
  filter(MonthEnding > '2020-01-01') %>% 
  mutate(Year = MonthEnding) %>% 
  mutate(Year = gsub("2024", "2023", Year)) %>% 
  mutate(Year = gsub("2025", "2023", Year))

diagnostics_waiting_times_endoscopy_per_100k$Year <- substr(diagnostics_waiting_times_endoscopy_per_100k$Year, 1, 4)

diagnostics_waiting_times_endoscopy_per_100k$Year <- as.numeric(diagnostics_waiting_times_endoscopy_per_100k$Year)

diagnostics_waiting_times_endoscopy_per_100k <- left_join(diagnostics_waiting_times_endoscopy_per_100k,HB_Pop_Estimates,by = c("HBName", "Year")) #### Joining allages data onto dataset for rate calculation

diagnostics_waiting_times_endoscopy_per_100k<- diagnostics_waiting_times_endoscopy_per_100k %>% 
  select(-HB, -Year) %>% 
  mutate(Rate = NumberOnList/AllAges) %>% 
  mutate(Rate = Rate * 100000) %>% 
  select(-AllAges)

  

rm(diagnostics_waiting_times_endoscopy, diagnostics_waiting_times_imaging) # No longer needed

