# Libraries

library(shiny)
library(shinyWidgets)
library(DT)
library(data.table)
library(ggplot2)
library(shinydashboard)
library(readr)
library(dplyr)
library("readxl")
library("RColorBrewer")
library(rsconnect)
library(base)
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(readr)
library(readxl)
library(RColorBrewer)
library(stats)
library(utils)
library(sf)
library(writexl)
library(base64enc)
library(phsopendata)
library(plotly)
library(crosstalk)
library(lubridate)
library(kableExtra)
library(tidyverse)

#### Geo Lookup Data Prep Script ####
source(file.path('data prep (sources)/Geo Lookup Source Script.R'))
#### Accident and Emergency Data Prep Script ####
source(file.path('data prep (sources)/WeeklyA&EActivityandWaitingTimesPrep.R'))
#### Diagnostics Prep Script
source(file.path('data prep (sources)/Waiting Times by Healthboard/Diagnostics Waiting Times.R'))





#### Download Pages Script
source(file.path('download pages/data prep for download pages.R'))

com_list <- c("Accident and Emergency" = "aecom", "Diagnostics" = "Diag")