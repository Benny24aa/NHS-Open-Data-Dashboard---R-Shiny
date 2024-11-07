accident_emergency_table <- reactive({
  
  table_data_2 <- switch(input$acc_emer_select,
                       "merged_ae_data_full_data_compare" = merged_ae_data_full_data_compare,
                       "deprivation_ae_analysis" = deprivation_ae_analysis,
                       "gender_ae_analysis" = gender_ae_analysis,
                       "ae_age_analysis" = ae_age_analysis) 
})

# Render Data Table 

output$accident_emergency_table_filtered <- DT::renderDataTable({
  
  # Remove the underscore from column names in the table
  table_colnames_2  <-  gsub("_", " ", colnames(accident_emergency_table()))
  
  DT::datatable(accident_emergency_table(), style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE, 
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames_2)
  
})


# Download Data 
output$download_accident_emergency_table_csv <- downloadHandler(
  filename = function() {
    paste(input$acc_emer_select, "_data.csv", sep = "")
  },
  content = function(file) {
    # This downloads only the data the user has selected using the table filters
    write_csv(accident_emergency_table()[input[["accident_emergency_table_filtered_rows_all"]], ], file) 
  } 
)