##### Creating a situation so that all lookup files appear in the same datatable prepared for download


data_table <- reactive({
  
  table_data <- switch(input$reference_file_select,
                            "HB_Lookup_Cleaned" = HB_Lookup_Cleaned,
                            "Council_Lookup_Cleaned" = Council_Lookup_Cleaned,
                            "Interminate_Zone_Lookup_Cleaned" = Interminate_Zone_Lookup_Cleaned,
                            "Data_Zone_Lookup_Cleaned" = Data_Zone_Lookup_Cleaned,
                            "Hospital_Lookup_Cleaned" = Hospital_Lookup_Cleaned)
})

# Render Data Table ----

output$reference_file_filter_download <- DT::renderDataTable({
  
  table_colnames <- gsub("_", "", colnames(data_table()))
  
  DT::datatable(datatable(),
                style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE,
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames )
})

# Enable data to be downloaded from table

output$reference_file_download_csv <- downloadHandler(
  filename = function() {
    paste(input$reference_file_select, ".csv", sep = "")
  },
  content = function(file) {
    write_csv(datatable()[input[["reference_file_filter_download_rows_all"]],], file)
    }
)