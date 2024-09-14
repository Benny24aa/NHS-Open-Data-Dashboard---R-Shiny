referencefile <-
  tabPanel(title = "Reference Files", icon = icon('table'),
           h2("Select the data you wish to download", style = "color: #3F3685 ; font-weight: 600"),
           p("This section allows you to view reference file data in table format. You can use the filters to select the data you're interested in and download it into a csv format using the download button."),
           fluidRow(
             column(6, selectInput(inputId = "reference_file_select",
                                   label = "Select the data you want to explore.",
                    choices = ref_file_list)),
           DT::dataTableOutput("reference_file_filter_download"),
           fluidRow(
             column(6, downloadButton(outputId = "reference_file_download_csv",
                                      label = 'Download data')))
           
           )
  )
