##### Accident and Emergency

observeEvent(input$Accident_Emergency_Info_Button,
             showModal(modalDialog( # creates a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Future updates"),
               tags$ul(
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li(""),
                 tags$li("")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))))