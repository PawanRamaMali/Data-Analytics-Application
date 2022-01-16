

list_variable <- list()
observe({
  
  output$res <- renderText(input$variable)
  list_variable<-append(list_variable,input$variable)
  # print('list.variable')
  print(list_variable)
})

#output$res <- renderText(input$variable)

list_target <- list()
observe({
  
  output$target <- renderText(input$target)
  list_target<-append(list_target,input$target)
  print('list.target')
  print(list_target)
})
