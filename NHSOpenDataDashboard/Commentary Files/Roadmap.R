Roadmap <- tabPanel(title = "Roadmap", 
                         
                         
                         mainPanel(
                           
                           tagList(h3(tags$b("Roadmap")),
                                   p("Below is information regarding the dahsboard and it's potential future updates. The road map provides a potential release data and further information about each tab being released."), br(),
                                   
                                   p(tags$b("Future Updates")),
                                   p(tags$li("Accident and Emergency tab was released in October - This gives information regarding accident and emergency activity.")), 
                                   p(tags$li("Diagnostics Tab to be released by the end of November 2024 - This gives information regarding diagnosticis such as endscopies and imagary data.")),
                                   p(tags$li("Hospital Mortality Crude Rates to be released by end of December 2024 - This gives information about how many people die after admission to hospital across Scotland.")))
                           
                           
                         ) 
                         
) #End of TabPanel
