### Sourcing Scripts for Use for UI

source("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/ui (sources)/Information Tab UI Code.R"
)# Sourcing in Information Tab from different script
source("C:/Users/harle/OneDrive/Desktop/NHS Open Data R App/Data Prep Respos/NHS-Open-Data-Dashboard---R-Shiny/ui (sources)/Reference File Tab UI Code.R") # Sourcing in Reference File UI tab script


navbarPage(title =span( "NHS Open Data Application", style = "blackground-color: #dedef7", style="color:red"),
           information, ### Information Tab being called on by UI
           referencefile







)#End of navbarpage