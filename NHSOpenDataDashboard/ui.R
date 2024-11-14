### Sourcing Scripts for Use for UI 


source("ui (sources)/Information Tab UI Code.R"
)# Sourcing in Information Tab from different script

source("ui (sources)/Reference File Tab UI Code.R") # Sourcing in Reference File UI tab script

source("ui (sources)/Accident and Emergency UI codes/A&E Healthboard Breakdown UI Code.R") #Healthboard analysis UI

source("ui (sources)/Diagnostic Waiting Times Code/diagnostic waiting times ui.R") # Diagnostic waiting times analysis UI

source("Commentary Files/Commentary UI.R")
source("Commentary Files/Using Dashboard.R")
source("Commentary Files/Roadmap.R")

############################################
####### Landing Pages for dashboard sourcing
source("landing pages/Information A&E Ui.R")
source("landing pages/information diag page.R")
############################################

############################################
###### Download data pages 
############################################
source("download pages/Accident and Emergency Download Page UI.R")

############################################

navbarPage(title = div(tags$a(img(src="", width=120, alt = ""),
                              href= "",
                              target = "_blank"),
                       style = "position: relative; top: -10px;"),
           windowTitle = "NHS Open Data Application", #title for browser tab
           header = tags$head(includeCSS("www/styles.css"), # CSS styles
                              HTML("<html lang='en'>")),
           
           ##### Tab Panels
           information, ### basic information/home page
           navbarMenu("Further Information", Commentary, DashboardUse, Roadmap), ### Commentary Page
           navbarMenu("Reference Files", geofilesui),#Nav Bar for all reference files
           navbarMenu("Accident and Emergency Waiting Times",Accident_Emergency_Info_Ui, Accident_Emergency_Healthboard_Breakdown, Accident_Emergency_Download_Page),
           navbarMenu("Diagnostic Waiting Times", Diagnostic_Landing_Page_UI, Diagnostics_section)







)#End of navbarpage