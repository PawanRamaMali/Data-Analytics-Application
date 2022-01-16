tabPanel("Configure",
         value = "Configure",
         
         
         fluidPage(column(2,
                          
                          
                          fluidRow(
                            selectInput("Method", "Method to Choose", choices = "Classification")
                          )),
                   
                   
                   
                   
                   
                   column(10,
                          mainPanel(
                            tabsetPanel(id = "tab1",
                                        tabPanel(
                                          "Variable selection",
                                          fluidRow(
                                            column(
                                              2,
                                              checkboxGroupInput(
                                                inputId = "variable",
                                                label = "Variables",
                                                choices = "",
                                                selected = "",
                                                width = "350px"
                                              ),
                                              p("Selected Variables:"),
                                              textOutput("res"),
                                            ),
                                            column(
                                              2,
                                              checkboxGroupInput(
                                                inputId = "outlier",
                                                label = "Outlier Removal",
                                                #choices = "",
                                                selected = "",
                                                width = "350px",
                                                choiceNames = list(icon("di_option")) ,
                                                choiceValues = list(icon("di_option"))
                                              ),
                                              #p("Selected Variables:"),
                                              #textOutput("res"),
                                            ),
                                            column(
                                              2,
                                              radioButtons(
                                                "target",
                                                "Target",
                                                choiceNames = "" ,
                                                choiceValues = ""
                                              ),
                                              p("Selected Target:"),
                                              textOutput("target")
                                            ),
                                            style = "height:600px;width:1200px;overflow-y:scroll;overflow-x:scroll;"
                                          )
                                        ), )
                          ))))
