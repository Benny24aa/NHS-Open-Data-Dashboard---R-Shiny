### Sourcing Scripts for Use for UI

source("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/ui (sources)/Information Tab UI Code.R"
)# Sourcing in Information Tab from different script
source("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/ui (sources)/Reference File Tab UI Code.R") # Sourcing in Reference File UI tab script
source("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/ui (sources)/Accident and Emergency UI codes/A&E Healthboard Breakdown UI Code.R")
navbarPage(title = div(tags$a(img(src="", width=120, alt = ""),
                              href= "",
                              target = "_blank"),
                       style = "position: relative; top: -10px;"),
           windowTitle = "NHS Open Data Application", #title for browser tab
           header = tags$head(includeCSS("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/www/styles.css"), # CSS styles
                              HTML("<html lang='en'>")),
           
           ##### Tab Panels
           information, ### Information Tab being called on by UI
           navbarMenu("Reference Files", geofilesui),#Nav Bar for all reference files
           navbarMenu("Accident and Emergency Waiting Times",Accident_Emergency_Healthboard_Breakdown) 







)#End of navbarpage