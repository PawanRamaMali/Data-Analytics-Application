
             

           
tabPanel("Discovery",
         value = "Discovery",
         #selectInput("choice", "Select a method", choices = c("Missing Values", "Outlier Detection", "Feature Engineering")),
         fluidPage(column(2,
                          
                          #Application title name
                          titlePanel("Exploratory Data Analysis"),
                          #fluidRow(
                          #column(1,tableOutput("dfcol")),
                          
                          column(12,conditionalPanel(condition= "input.tab==1",h4("Data Summary"))),
                          column(12,conditionalPanel(condition = "input.tab==2",selectInput("xaxisGrp","Variables",choices = ""))), #Variables
                          
                          column(12,conditionalPanel(condition = "input.tab==3",selectInput("xaxis","X-Axis",choices = ""),
                                                     selectInput("yaxis","Y-Axis:", choices = ""))), # target
                          
                          
                          column(12,conditionalPanel(condition = "input.tab==5",selectInput("xaxis1","Dimensions",choices = ""),
                                                     selectInput("yaxisGrp","Measure:", choices = ""),
                                                     selectInput("fill","Aes options:", choices = ""))),
                          
                          column(12,conditionalPanel(condition = "input.tab==6",selectInput("xaxis2","x-Axis",choices = ""),
                                                     selectInput("yaxis1","y-Axis", choices = ""),
                                                     selectInput("zaxis1","z-Axis1", choices = ""))), 
                          
                          column(12,conditionalPanel(condition = "input.tab==7",selectInput("x_axis","x-Axis",choices = ""),
                                                     selectInput("y_axis","y-Axis", choices = ""),
                                                     selectInput("z_axis","z-Axis", choices = ""),
                                                     selectInput("CLR","clr", choices = ""))),
                          
                          column(12,conditionalPanel(condition = "input.tab==8",selectInput("xaxis3","X-Axis",choices = ""),
                                                     selectInput("yaxis3","Y-Axis", choices = ""))), 
                          
                          column(12,conditionalPanel(condition = "input.tab==9",selectInput("xaxis4","X-Axis",choices = ""),
                                                     selectInput("yaxis4","Y-Axis", choices = ""))),
                          #column(3,radioButtons("unique","unique values",c("2"="2"))), #unique
                          
                          
                          # column(1,selectInput("xaxisGrp","Dimensions", c("1"="1"))), #Variables
                          # column(1,selectInput("yaxisGrp","Measure:", c("1"="1"))), # target
                          
                          uiOutput("choose_columns")),

                   column(10,
                          mainPanel(
                            tabsetPanel(
                              id = "tab",
                 
                              tabPanel("Data Summary", value= 1,tableOutput("dfEDA"),style = "height:600px;width:1200px;overflow-y:scroll;overflow-x:scroll;"),
                              tabPanel("Histogram", value = 2, plotOutput("hist"),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("Box plot", value=3,plotOutput("box"),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("Correlation", value=4,plotOutput('corr'),style = "height:550px;width:1200px;colour:Blues;"),
                              # tabPanel(sidebarMenu(selectInput("X","X-Axis",choices = "",selected = ""),
                              #                      selectInput("Y","Y-Axis",choices = "",selected = ""),
                              #                      selectInput("fill","fill",choices = "",selected = "")),
                              #                      "Scatter Plot", plotOutput("plot1")),
                              tabPanel("Scatter Plot", value=5, plotOutput("plot1"),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("Heat Map", value=6,plotOutput('heat'),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("3D Scatter Plot", value=7,plotOutput('scatter'),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("Area Chart", value=8,plotOutput('Area'),style = "height:550px;width:1200px;colour:Blues;"),
                              tabPanel("Donut Chart", value=9,plotOutput('plot7'),style = "height:550px;width:1200px;colour:Blues;")
                              
                              # dont display gadget title
                              # dont display button to change data
                              
                            ))),
              
         )
)



