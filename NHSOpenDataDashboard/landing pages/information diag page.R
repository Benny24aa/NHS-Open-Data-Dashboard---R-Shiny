Diagnostic_Landing_Page_UI <- tabPanel(title = "Information Page", 
                                       icon = icon("info-circle"),
                                       fluidRow(
                                         column(6,
                                                h2("Welcome to the Diagnostic Section of the dashboard", style = "color:  #336699 ; font-weight: 600"))),
                                       
                                       fluidRow(
                                         column(6, actionButton("Diagnostic_Button", tags$b("New content and future updates"),
                                                                icon = icon('calendar-alt')))),
                                       
                                       fluidRow(
                                         column(12,
                                                h4(tags$b("What is in this section?" , style = "color:  #336699 ; font-weight: 600")),
                                                p(""), 
                                                h4(tags$b("Scotland Wide Graph", style = "color:  #336699 ; font-weight: 600" )),
                                                fluidRow(
                                                  column(3, plotlyOutput("scot_diagnsotics_land_page_graph", width = "300%", height = "600px"))),
                                                h4(tags$b(" Disclosure and Data Security Statement", style = "color:  #336699 ; font-weight: 600")),
                                                p("All content is available under the Open Government License V3.0, and is available on NHS Scotland Open Data except where otherwise stated. If you need any assistance with this, please visit the UK Government Website for more information regarding the Open Government License. This dashboard is not a representive of the NHS and therefore is not an official source of information.")),
                                       )#End of Fluid Row
) #End of TabPanel
