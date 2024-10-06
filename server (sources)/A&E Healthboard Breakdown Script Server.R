##### HB analysis breakdown script #####

##### Total AE attends server filter and plot

filter_healthboard_ae_type  <- reactive({
  
  filter_healthboard_ae_type <- merged_ae_data_full_data[merged_ae_data_full_data$type == input$type_ae_input,]
  
  return(filter_healthboard_ae_type)
  
})

output$filter_healthboard_ae_hb_totalweekattend <- renderUI({

hb_list_ae <- hbtypeaelist %>% 
    filter(type %in% input$type_ae_input) %>% 
    pull(HBName)
  
  selectInput(inputId = "HBnameInputAE", label = "Select HB to filter", choices = hb_list_ae)

})


#### Individual HB Seen Graph

output$total_ae_attend_by_hb <- renderPlotly({
  
  filter_healthboard_ae_type() %>% 
    filter(HBName == input$HBnameInputAE) %>% 
     plot_ly(x = ~ WeekEndingDate,
                  y = .[[input$AE_Graph_Type]],
                  color = ~ HBName,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

#### Filters for compare graphs

filter_healthboard_ae_type_compare <- reactive({
  
  filter_healthboard_ae_type_compare <- merged_ae_data_full_data_compare[merged_ae_data_full_data_compare$type == input$type_ae_input_compare,]
  
  return(filter_healthboard_ae_type_compare)
  
})

### Comparing Healthboard Graphs for total seen

output$total_ae_attend_by_hb_compare <- renderPlotly({
  
  filter_healthboard_ae_type_compare() %>% 
    plot_ly(x = ~ WeekEndingDate,
            y = .[[input$AE_Graph_Type_Compare]],
            color = ~ HBName,
            type = 'scatter',
            mode = 'lines',
            orientation = 'h')
})


###### Demographic AE Data Plotly and Filters ######
filter_healthboard_ae_demo_monthly <- reactive({
  
  filter_healthboard_ae_demo_monthly <- merged_ae_demographic_data[merged_ae_demographic_data$HBName == input$demo_monthly_ae_hb_input,]
  
  return(filter_healthboard_ae_demo_monthly)
  
})

output$filter_healthboard_ae_category_demo_monthly <- renderUI({

  aegraphmonthlydemotype <- hbcategorytype %>%
    filter(HBName %in% input$demo_monthly_ae_hb_input) %>%
    pull(type)

  selectInput(inputId = "Typeae_input", label = "Select Type to Show", choices = aegraphmonthlydemotype)

})

output$total_ae_attend_by_age <- renderPlotly({
  
  filter_healthboard_ae_demo_monthly() %>% 
    filter(type == input$Typeae_input) %>% 
          plot_ly(x = ~ Month,
                  y = ~ NumberOfAttendances,
                  color = ~ Category,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})


