Commentary <- tabPanel(title = "Commentary and Updates", 
                      
                        
                        sidebarLayout(
                          sidebarPanel(width = 3,
                                       radioGroupButtons("com_select",
                                                         choices = com_list, status = "primary",
                                                         direction = "vertical", justified = T)),
                          mainPanel(width = 9,
                                    
                            
                                    
                                    conditionalPanel(
                                      condition= 'input.com_select == "aecom"',
                                      p(h3("17/11/2024")),
                                      h4("Accident and Emergency Healthboard Section "),
                                      tags$ul(
                                        tags$li("Graphs added for age, gender, and deprivation quintiles for accident and emergency admissions."),
                                        tags$li("Download data tab added to drop down list for accident and emergency data"),
                                        tags$li("Landing Page added for accident and emergency tab - Scotland wide graph coming soon"))
                                      ), #end of conditional panel
                                      
                                      conditionalPanel(
                                        condition= 'input.com_select == "Diag"',
                                        p(h3("17/11/2024")),
                                        h4("Diagnostics Healthboard Section "),
                                        tags$ul(
                                          tags$li("Landing Page added for diagnostic tab"))
                                      ) # end of conditional panel
                                  
                                    
                          ))) #End of TabPanel


