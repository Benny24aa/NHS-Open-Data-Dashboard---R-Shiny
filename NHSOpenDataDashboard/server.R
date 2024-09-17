
# Define server logic required to draw a histogram
function(input, output) {
  source(file.path("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/server (sources)/Information Tab Script Server.R"), local = TRUE)$value
  source(file.path("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/server (sources)/Reference File Script Server.R"), local = TRUE)$value
  source(file.path("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/server (sources)/A&E Healthboard Breakdown Script Server.R"), local = TRUE)$value
  
  
  
  
  } #End of Server
  