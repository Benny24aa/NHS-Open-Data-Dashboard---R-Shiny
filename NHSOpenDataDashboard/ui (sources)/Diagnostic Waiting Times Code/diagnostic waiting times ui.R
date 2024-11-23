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
                                              
                                              
                                              
                                              ))))

