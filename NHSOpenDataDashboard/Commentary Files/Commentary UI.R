Commentary <- tabPanel(title = "Commentary and Updates", 
                      
                        
                        sidebarLayout(
                          sidebarPanel(width = 3,
                                       radioGroupButtons("com_select",
                                                         choices = com_list, status = "primary",
                                                         direction = "vertical", justified = T)),
                          mainPanel(width = 9,
                                    
                            
                                    
                                    conditionalPanel(
                                      condition= 'input.com_select == "aecom"',
                                      
                                    ) # end of conditional panel
                                    
                          ))) #End of TabPanel


