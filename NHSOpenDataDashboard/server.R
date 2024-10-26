
# Define server logic required to draw a histogram
function(input, output) {
  source(file.path("server (sources)/Information Tab Script Server.R"), local = TRUE)$value
  source(file.path("server (sources)/Reference File Script Server.R"), local = TRUE)$value
  source(file.path("server (sources)/A&E Healthboard Breakdown Script Server.R"), local = TRUE)$value
  
  
  
  
  } #End of Server
  