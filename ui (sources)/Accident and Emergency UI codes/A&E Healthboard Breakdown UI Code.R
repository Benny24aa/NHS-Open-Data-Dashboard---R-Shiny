Accident_Emergency_Healthboard_Breakdown <- tabPanel(title = "Health Board Breakdowns", 
                        icon = icon("hospital"),
                        h1("Weekly Breakdown of Accident and Emergency Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        fluidRow(
                          column(3, selectInput(inputId = "type_ae_input", label = "Select type of data you wish to see", choices = unique(merged_ae_data_full_data$type))),
                          column(3, uiOutput("filter_healthboard_ae_hb_totalweekattend"))),
                        
                        h3("Accident and Emergency - Number seen within selected time period by choosen Health Board", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb", width = "300%", height = "600px"))),
                        
                        h3("Accident and Emergency - People per 100k rate seen within selected time period by choosen Health Board", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb_Rates", width = "300%", height = "600px"))),
                        
                        h1("Weekly Breakdown of Accident and Emergency Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        
                        fluidRow(
                          column(3, selectInput(inputId = "type_ae_input_compare", label = "Select type of data you wish to see", choices = unique(merged_ae_data_full_data$type)))),
                          h3("Accident and Emergency - Number seen within selected time period by Health Board", style = "color: #336699 ; font-weight: 600"),
                          p("Coming soon"),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb_compare", width = "300%", height = "600px"))),
                        h3("Accident and Emergency - People per 100k rate seen within selected time period by choosen Health Board", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb_Rates_compare", width = "300%", height = "600px"))),
                        
                          
                        
                        
                      
                        
                        ###### Demographic Data graphs
                        
                        h1("Monthly Demographic Data for Accident and Emergency Attendance across Scotland", style = "color: #336699 ; font-weight: 600"),
                        p("Coming soon"),
                        
                        h3("Accident and Emergency Attendances by Age Group", style = "color: #336699 ; font-weight: 600"),
                      
                        fluidRow(
                          column(3, selectInput(inputId = "ae_age_hb_input", label = "Select the healthboard you want to see data for", choices = unique(ae_age_analysis$HBName)))),
                        
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_age", width = "300%", height = "600px"))),
                        ############################################################################################
                        h3("Accident and Emergency Attendances by Sex", style = "color: #336699 ; font-weight: 600"),
                        
                        fluidRow(
                          column(3, selectInput(inputId = "ae_gender_hb_input", label = "Select the healthboard you want to see data for", choices = unique(gender_ae_analysis$HBName)))),
                        
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_gender", width = "300%", height = "600px"))),
                        
                        ######################
                        
                        h3("Accident and Emergency Attendances by Deprivation ", style = "color: #336699 ; font-weight: 600"),
                        
                        fluidRow(
                          column(3, selectInput(inputId = "ae_deprivation_hb_input", label = "Select the healthboard you want to see data for", choices = unique(deprivation_ae_analysis$HBName)))),
                        
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_deprivation", width = "300%", height = "600px")))
                        
                        
                        ) #End of TabPanel