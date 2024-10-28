### Sourcing Scripts for Use for UI

source("ui (sources)/Information Tab UI Code.R"
)# Sourcing in Information Tab from different script
source("ui (sources)/Reference File Tab UI Code.R") # Sourcing in Reference File UI tab script
source("ui (sources)/Accident and Emergency UI codes/A&E Healthboard Breakdown UI Code.R")
source("ui (sources)/Diagnostic Waiting Times Code/diagnostic waiting times ui.R")

navbarPage(title = div(tags$a(img(src="", width=120, alt = ""),
                              href= "",
                              target = "_blank"),
                       style = "position: relative; top: -10px;"),
           windowTitle = "NHS Open Data Application", #title for browser tab
           header = tags$head(includeCSS("www/styles.css"), # CSS styles
                              HTML("<html lang='en'>")),
           
           ##### Tab Panels
           information, ### Information Tab being called on by UI
           navbarMenu("Reference Files", geofilesui),#Nav Bar for all reference files
           navbarMenu("Accident and Emergency Waiting Times",Accident_Emergency_Healthboard_Breakdown),
           navbarMenu("Diagnostic Waiting Times", Diagnostics_section)







)#End of navbarpage