Accident_Emergency_Healthboard_Breakdown <- tabPanel(title = "Health Board Breakdown", 
                        icon = icon("hospital"),
                        h1("Weekly Breakdown of Accident and Emergency Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                        p("This is the new weekly Accident & Emergency (A&E) open data area. From 2015 the weekly attendance and waiting times statistics at Emergency Departments (EDs) across Scotland "),
                        fluidRow(
                          column(3, selectInput(inputId = "type_ae_input", label = "Select type of data you wish to see", choices = unique(merged_ae_data$type)))),
                        
                        h3("Accident and Emergency - Statistics", style = "color: #336699 ; font-weight: 600"),
                        
                        fluidRow(
                          column(3, plotlyOutput("total_ae_attend_by_hb", width = "300%", height = "600px")))
                        
                        
                        ) #End of TabPanel