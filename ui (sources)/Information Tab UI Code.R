information <- tabPanel(title = "Information", 
         icon = icon("info-circle"),
         fluidRow(
           column(6,
                  h2("Background Information", style = "color:  #3F3685 ; font-weight: 600")),
           column(6, actionButton("new_next", tags$b("New content and future updates"),
                                  icon = icon('calendar-alt')))
         ),
         
         fluidRow(
           column(12,
                  h4(tags$b("What is the NHS Open Data Dashboard?" , style = "color:  #3F3685 ; font-weight: 600")),
                  p(""), 
                  p(""),
                  h4(tags$b("Type of Data Explored?", style = "color:  #3F3685 ; font-weight: 600" )),
                  p(""),
                  h4(tags$b(" Disclosure and Data Security Statement", style = "color:  #3F3685 ; font-weight: 600")),
                  p(""),
                  p(""))
         )#End of Fluid Row
         
) #End of TabPanel