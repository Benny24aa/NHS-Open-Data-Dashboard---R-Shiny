##### Accident and Emergency

observeEvent(input$Accident_Emergency_Info_Button,
             showModal(modalDialog( # creates a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Future updates"),
               tags$ul(
                 tags$li("No Updates expected for now"),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li("")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))))

##### Diagnostic Button

observeEvent(input$Diagnostic_Button,
             showModal(modalDialog( # creates a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Potential Future Updates"),
               tags$ul(
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li("")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))))


##### A&E graph Scotland

output$scot_accident_land_page_graph <- renderPlotly({

    plot_ly(scotland_ae_data,
      x = ~ WeekEndingDate,
            y = ~totalseen,
            type = 'scatter',
            mode = 'lines') %>%
    layout(xaxis = list(title = 'Week Ending'),
           yaxis = list(title = 'Total Attends'))
})

output$scot_diagnsotics_land_page_graph <-  renderPlotly({
  
  plot_ly(diagnostics_all_total_scotland,
          x = ~MonthEnding,
          y = ~Total_On_Waiting_List,
          type = 'scatter',
          mode = 'lines') %>%
    layout(xaxis = list(title = 'Month Ending'),
           yaxis = list(title = 'Total on Waiting List since Day 0'))
})