
# Define server logic required to draw a histogram
function(input, output) {
  source(file.path("server (sources)/Information Tab Script Server.R"), local = TRUE)$value ## Information page sourcing in
  source(file.path("server (sources)/Reference File Script Server.R"), local = TRUE)$value # Reference file sourcing in
  source(file.path("server (sources)/A&E Healthboard Breakdown Script Server.R"), local = TRUE)$value # AE healthboard script source in
  source(file.path("landing pages/Landing Pages Server.R"), local = TRUE)$value # Landing Page source in
  
  
  } #End of Server
  