Accident_Emergency_Healthboard_Breakdown <- tabPanel(title = "Healthboard Breakdowns", 
                        icon = icon("hospital"),
                        h1("Weekly Breakdown of Accident and Emergency Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        fluidRow(
                          column(3, selectInput(inputId = "type_ae_input", label = "Select type of data you wish to see", choices = unique(merged_ae_data_full_data$type))),
                          column(3, uiOutput("filter_healthboard_ae_hb_totalweekattend")),
                          column(3, selectInput(inputId = "AE_Graph_Type", label = "Select Column to Plot", choices = c("totalseen", 'Rate')))
                          
                          ),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb", width = "300%", height = "600px"))),
                        
                        h1("Weekly Breakdown of Accident and Emergency Data at Health Board Level Comparison", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        
                        fluidRow(
                          column(3, selectInput(inputId = "type_ae_input_compare", label = "Select type of data you wish to see", choices = unique(merged_ae_data_full_data_compare$type))),
                          column(3, selectInput(inputId = "AE_Graph_Type_Compare", label = "Select Column to Plot", choices = c("totalseen", "Rate")))
                          
                          ),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb_compare", width = "300%", height = "600px"))),
                        
                        ####################################
                        ###### Demographic Data graphs #####
                        ####################################
                        
                        h1("Monthly Demographic Data for Accident and Emergency Attendance across Scotland", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                      
                        fluidRow(
                          column(3, selectInput(inputId = "demo_monthly_ae_hb_input", label = "Select the healthboard you want to see data for", choices = unique(merged_ae_demographic_data$HBName))),
                          column(3, uiOutput("filter_healthboard_ae_category_demo_monthly")),
                        ),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_demo_type", width = "300%", height = "600px")))
                        ############################################################################################
                        
                        
                        
                        ) #End of TabPanel