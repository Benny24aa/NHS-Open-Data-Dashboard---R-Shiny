# NEW CONTENT AND FUTURE UPDATES INFO BUTTON - INFO PAGE ----

observeEvent(input$new_next,
             showModal(modalDialog( # creates a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Future updates"),
               tags$ul(
                 tags$li("01/11/2024 - Healthboard Breakdown Section Completed for Accident and Emergency Data"),
                 tags$li("03/11/2024 - Information Pages and Download Pages added to each section"),
                 tags$li("06/11/2024 - Work on diagnostic data set begins behind the screens"),
                 tags$li("14/11/2024 - UI updates and improvements"),
                 tags$li("20/11/2024 - First Parts of Diagnostics Dashboard to be built"),
                 tags$li("TBA - TBA")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))))