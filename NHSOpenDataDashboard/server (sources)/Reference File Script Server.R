##### Creating a situation so that all look up files appear in the same datatable prepared for download


data_table <- reactive({
  
  table_data <- switch(input$ref_select,
                            "Hospital_Lookup_Final" = Hospital_Lookup_Final,
                            "Council_Lookup_Cleaned" = Council_Lookup_Cleaned,
                            "Interminate_Zone_Lookup_Cleaned" = Interminate_Zone_Lookup_Cleaned,
                            "Data_Zone_Lookup_Cleaned" = Data_Zone_Lookup_Cleaned,
                            "HB_Lookup_Cleaned" = HB_Lookup_Cleaned)
})

# Render Data Table 

output$table_filtered <- DT::renderDataTable({
  
  # Remove the underscore from column names in the table
  table_colnames  <-  gsub("_", " ", colnames(data_table()))
  
  DT::datatable(data_table(), style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE,
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames)
  
})


# Download Data 
output$download_table_csv <- downloadHandler(
  filename = function() {
    paste(input$ref_select, "_data.csv", sep = "")
  },
  content = function(file) {
    # This downloads only the data the user has selected using the table filters
    write_csv(data_table()[input[["table_filtered_rows_all"]], ], file) 
  } 
)