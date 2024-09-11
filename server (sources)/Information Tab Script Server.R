# NEW CONTENT AND FUTURE UPDATES INFO BUTTON - INFO PAGE ----

observeEvent(input$new_next,
             showModal(modalDialog( # creates a modal: a pop-up box that contains text information
               title = "New content added and future updates",
               h4("Future updates"),
               tags$ul(
                 tags$li("11/09/2024 - Information Page added with brief remarks about the dashboard"),
                 tags$li("11/09/2024 - First parts of the UI created such as navigation bar"),
                 tags$li("11/09/2024 - Reference File data added to global section of dashboard to be called upon by server and ui when needed."),
                 tags$li("13/09/2024 - Reference File section created with ability to download reference files that have been cleaned using R Scripts that appear on github resp"),
                 tags$li("13/09/2024 - Github and Tableau links added to top of navigation bar"),
                 tags$li("TBA - TBA")),
               size = "m",
               easyClose = TRUE, fade=FALSE,footer = modalButton("Close (Esc)"))))