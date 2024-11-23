Diagnostics_section <- tabPanel(title = "Healthboard Breakdown", 
                                                     icon = icon("hospital"),
                                sidebarLayout(
                                  sidebarPanel(width = 3,
                                               radioGroupButtons("diag_select",
                                                                 choices = diagnostic_list, status = "primary",
                                                                 direction = "vertical", justified = T)),
                                  mainPanel(width = 9,
                                            
                                            conditionalPanel(
                                              condition= 'input.diag_select == "endo"',
                                              h1("Monthly Breakdown of Endoscopy Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                                              p("Coming soon")
                                              
                                              
                                              ),
                                            
                                            conditionalPanel(
                                              condition= 'input.diag_select == "imag"',
                                              h1("Monthly Breakdown of Imagery Data at Health Board Level", style = "color: #336699 ; font-weight: 600"),
                                              p("Coming soon")
                                              
                                              
                                            )
                                            
                                            
                                            )))

