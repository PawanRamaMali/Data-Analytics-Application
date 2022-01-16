df = read.csv("C:/Users/Pawan/Documents/hmeq.csv")

dsnames <- c()

data_set <- reactive({
  inFile <- input$InputFile
  
  if (is.null(inFile))
    return(NULL)
  
  data_set<-read.csv(inFile$datapath)
})

data_r <-reactiveValues(data = data_set,name = "dataset")


# output rendering functionality
output$contents <- renderDT({
  inFile <- input$InputFile
  if (is.null(inFile)) {
    return(NULL)
  }
  
  df<-read.csv(inFile$datapath, header = input$header) # header = input$header
  return(df)
})
