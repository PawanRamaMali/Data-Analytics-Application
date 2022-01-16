
output$choose_dataset <- renderUI({
  selectInput("dataset", "Data set", as.list(data_sets))
})

output$trainset <- renderTable({
  ## Training set
  req(input$InputFile)
  sample_size = floor(input$training *nrow(data_set()))
  picked = sample(seq_len(nrow(data_set())),size = sample_size)
  development = data_set()[picked,]
  #holdout = data_set()[-picked,]
  return(development)
})
output$testset <- renderTable({
  ## test set
  req(input$InputFile)
  sample_size = floor(input$training *nrow(data_set()))
  picked = sample(seq_len(nrow(data_set())),size = sample_size)
  #development = data_set()[picked,]
  holdout = data_set()[-picked,]
  return(holdout)
})

######filter data
output$contents <- renderTable({data_set()})

filter_reactive<-reactive({
  variable<-colnames(data_set())
  dataset<-data.frame(variable)
})


output$filterdata<-DT::renderDataTable(
  
  filter_reactive(),server=TRUE,selection = 'single'
)

row_reactive<-reactive({
  
  selectedrowindex <<- input$filterdata_rows_selected[length(input$filterdata_rows_selected)]
  selectedrowindex <<- as.numeric(selectedrowindex)
  sampletable<-filter_reactive()
  
  selectedrow <- (sampletable[selectedrowindex,])
  
  remove_na <- sampletable[!is.na(sampletable$selectedrow), ]
  
  inputdataset<-data_set()
  example<-inputdataset[selectedrowindex]
  table_row<-data.frame(example=example)
  #remove_na <- example[!is.na(example$table_row), ]
  
})


output$selectedrow_column<-renderDataTable({
  checkboxtable<-row_reactive()
  
  checkboxtable[["Select"]]<-paste0('<input type="checkbox" name="row" value="',1:nrow(checkboxtable),'"><br>')
  
  datatable(checkboxtable,escape=F,options = list(scrollX = TRUE,pageLength = 5),selection = list(target = 'column'))
  
},selection = list(target = 'column'),escape=F,options = list(scrollX = TRUE,pageLength = 5))

output$checkbox<-renderUI({
  checkboxtable<-row_reactive()
  
  checkboxGroupInput('checkbox_input',"select values",choices=checkboxtable
  )
})