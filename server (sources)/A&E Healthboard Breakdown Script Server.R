##### HB analysis breakdown script #####

##### Total AE attends server filter and plot

filter_healthboard_ae <- reactive({
  
  filter_healthboard_ae <- total_ae_episodes_healthboard_level_cleaned[total_ae_episodes_healthboard_level_cleaned$HBName == input$hb_ae_input,]
  
  return(filter_healthboard_ae)
  
})

output$total_ae_attend_by_hb <- renderPlotly({
  
  plot <- plot_ly(data = filter_healthboard_ae(),
                  x = ~ WeekEndingDate,
                  y = ~ totalseen,
                  color = ~HBName,
                  type = 'scatter',
                  mode = 'lines',
                  orientation = 'h')
})