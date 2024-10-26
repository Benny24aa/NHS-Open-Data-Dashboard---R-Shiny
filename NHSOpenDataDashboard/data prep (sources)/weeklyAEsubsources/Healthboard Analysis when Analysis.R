accidentandemergencydatawhendata<- get_resource(res_id = "022c3b27-6a58-48dc-8038-8f1f93bb0e78") %>% 
  select(-Country,-TreatmentLocation, -Week) %>% 
  filter(Month > '202212') %>% 
  filter(DepartmentType == "Emergency Department") %>% 
  select(-DepartmentType) %>% 
  group_by(HBT, Month, Hour, Day, InOut ) %>% 
  summarise(NumberOfAttendances = sum(NumberOfAttendances), .groups = 'drop') %>% 
  rename(HBName = HBT)