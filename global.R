rm(list = ls())
gc(verbose=TRUE)

library(shiny)
library(digest)
library(bslib)
library(skimr)
library(reshape2)
library(dplyr)
library(esquisse)
library(forcats)
library(htmlTable)
library(plotly)
library(tidyr)
library(plot3D)
library(shinydashboard)
library(shinyAce)
library(shinyWidgets)
library(DataExplorer)
library(SmartEDA)
library(data.table)
library(DT)
library(ggplot2)
library(corrplot)
library(shinythemes)
library(shinyanimate)
library(shinyjs)
library(shinyBS)


## Setting Upload Size 
options(shiny.maxRequestSize=30*1024^2)
options(shiny.error = traceback)

# * Load functions ----
source('functions//navbarPageWithInputs.R', local = TRUE)







