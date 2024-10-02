##### HB analysis breakdown script #####

##### Total AE attends server filter and plot

filter_healthboard_ae_type  <- reactive({
  
  filter_healthboard_ae_type <- merged_ae_data_full_data[merged_ae_data_full_data$type == input$type_ae_input,]
  
  return(filter_healthboard_ae_type)
  
})


output$total_ae_attend_by_hb <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae_type(),
                  x = ~ WeekEndingDate,
                  y = ~ totalseen,
                  color = ~ HBName,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

output$total_ae_attend_by_hb_Rates <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae_type(),
                  x = ~ WeekEndingDate,
                  y = ~ Rate,
                  color = ~ HBName,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

###### Demographic AE Data Plotly and Filters ######
filter_healthboard_ae_age <- reactive({
  
  filter_healthboard_ae_age <- ae_age_analysis[ae_age_analysis$HBName == input$ae_age_hb_input,]
  
  return(filter_healthboard_ae_age)
  
})

output$total_ae_attend_by_age <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae_age(),
                  x = ~ Month,
                  y = ~ NumberOfAttendances,
                  color = ~ Category,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

filter_healthboard_ae_gender <- reactive ({
  
  filter_healthboard_ae_gender <- gender_ae_analysis[gender_ae_analysis$HBName == input$ae_gender_hb_input,]
  
  return(filter_healthboard_ae_gender)
})

output$total_ae_attend_by_gender <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae_gender(),
                  x = ~ Month,
                  y = ~ NumberOfAttendances,
                  color = ~ Category,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

filter_healthboard_ae_deprivation <- reactive ({
  
  filter_healthboard_ae_deprivation <- deprivation_ae_analysis[deprivation_ae_analysis$HBName == input$ae_deprivation_hb_input,]
  
  return(filter_healthboard_ae_deprivation)
})

output$total_ae_attend_by_deprivation <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae_deprivation(),
                  x = ~ Month,
                  y = ~ NumberOfAttendances,
                  color = ~ Category,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})

