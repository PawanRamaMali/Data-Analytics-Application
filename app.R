library(shiny)
source('global.R')
source('ui.R')
source('server.R')

app <- shinyApp(ui= ui, server = server)
runApp(app)
