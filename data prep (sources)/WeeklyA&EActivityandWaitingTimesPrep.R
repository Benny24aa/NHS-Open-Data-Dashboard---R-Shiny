### Weekly Accident and Emergency Data taken from Open Data through PHS Open Data Library
weeklyaccidentandemergencydata <- get_resource(res_id = "a5f7ca94-c810-41b5-a7c9-25c18d43e5a4")

weeklyaccidentandemergencydata_cleaned <- weeklyaccidentandemergencydata |>
  select(-Country,-DepartmentType)|> ### Removed both columns as both have the same value for all rows
  rename(HospitalCode = TreatmentLocation)|> ### To allow for future left_join with Hospital reference file
  rename(HB = HBT) ### To allow for future left_join with HBT reference file