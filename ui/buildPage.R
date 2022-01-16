tabPanel("Source",
         value = "Build",
         fluidPage(fluidRow(column(4,
                                   div(
                                     h5("Import your data file"),
                                     br()
                                   ))),
                   fluidRow(column(
                     3,
                     div(
                       class = "jumbotron",
                       fileInput(
                         inputId = "InputFile",
                         label = "Select File",
                         multiple = TRUE,
                         accept = c(".csv,.tsv,.txt,.pdf,.json,.XML")
                       ),
                       tags$hr(),
                       checkboxInput("header", "Header", TRUE),
                     )
                   ),
                   column(
                     8,
                     tags$div(mainPanel(DTOutput("contents")))
                   ))))