tabPanel("Main",
         value = "Main",
         
         fluidPage(column(2,
                          fluidRow(
                            sliderInput(
                              inputId = "training",
                              "Training",
                              min = 0.6,
                              max = 0.9,
                              value = 0.7
                            )
                          )),
                   column(10,
                          mainPanel(
                            tabsetPanel(
                              id = "tab1",
                              
                              tabPanel("Training set", tableOutput("trainset"), 
                                       style = "height:600px;width:1200px;overflow-y:scroll;overflow-x:scroll;"),
                              tabPanel("Test Set", tableOutput("testset"), 
                                       style = "height:600px;width:1200px;overflow-y:scroll;overflow-x:scroll;"),
                              tabPanel("Filter Data",
                                       fluidPage(fluidRow(
                                         column(
                                           width = 6,
                                           shinydashboard::box(
                                             width = 12,
                                          
                                             solidHeader = TRUE,
                                             title = "Choose Variable",
                                             status = "primary",
                                             DT::dataTableOutput("filterdata")
                                           )
                                         ),
                                         
                                         column(
                                           width = 6,
                                           br(),
                                           dataTableOutput("selectedrow_column"),
                                           br(),
                                           br(),
                                           br(),
                                             actionButton("Apply_button", "Remove NA Values")
                                         
                                           
                                           
                                             # ,
                                             # uiOutput("checkbox")
                                             # 
                                             
                                           
                                         )
                                       ),
                                       fluidRow(
                                         dataTableOutput("final_data_table")
                                       )
                                       
                                       ))
                            )
                          ))))