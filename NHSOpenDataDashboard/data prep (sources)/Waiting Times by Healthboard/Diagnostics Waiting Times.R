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

