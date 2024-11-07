Accident_Emergency_Download_Page <- tabPanel(title = "Download Data", icon = icon('table'),
           h2("Select the Reference File data you wish to download", style = "color: #336699 ; font-weight: 600"),
           p("This section allows you to view reference file data in table format. You can use the filters to select the data you're interested in and download it into a csv format using the download button."),
           column(6, selectInput("acc_emer_select", "Select the data you want to explore.",
                                 choices = accident_emergency_download_list)),
           mainPanel(width = 12,
                     DT::dataTableOutput("accident_emergency_table_filtered")),
           column(6, downloadButton('download_accident_emergency_table_csv', 'Download data')),
  ) 