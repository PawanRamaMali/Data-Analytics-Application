

observe({
  dsnames <- names(data_set())
  
  di_option <- colnames(data_set()) #[sapply(data_set(),class)=="character"]
  #di_options[dim] <-dim
  aes_ops <- colnames(data_set()[sapply(data_set(),class)!=c("integer")])
  
  
  me_option <- colnames(data_set()[sapply(data_set(),class)==c("integer")])
  
  #nu_option <- colnames(data_set()[sapply(data_set(),class)==c("numeric")])
  
  #uni<- unique(di_option)
  #me_options[measure] <-measure
  
  #cb_options <- list()
  #cb_options[ dsnames] <- dsnames
  updateSelectInput(session, "xaxisGrp",
                    label = "Variables",
                    choices = di_option,
                    selected = "")
  updateSelectInput(session, "yaxisGrp",
                    label = "Y Variable",
                    choices = me_option,
                    selected = "")
  updateSelectInput(session, "xaxis",
                    label = "X Variable",
                    choices = di_option,
                    selected = "")
  
  updateSelectInput(session, "yaxis",
                    label = "Y Variable",
                    choices = me_option,
                    selected = "")
  
  updateSelectInput(session, "xaxis1",
                    label = "X Variable",
                    choices = me_option,
                    selected = "")
  updateSelectInput(session, "xaxis1",
                    label = "X Variable",
                    choices = me_option,
                    selected = "")
  
  updateSliderInput(session,"training",
                    label = "Training Split",
                    min = 0.6,
                    max = 0.9
  )
  updateCheckboxGroupInput(session,"variable",
                           label = "Variables",
                           choices = di_option,
                           selected = "")
  
  updateCheckboxGroupInput(session,"outlier",
                           label = "Outlier Removal",
                           choices = di_option,
                           selected = "")
  
  updateRadioButtons(session,"target",
                     label = "Target",
                     choices = di_option,
                     selected = "")
  updateSelectInput(session,"type",
                    label = "Conversion",
                    choices = )
  
  updateSelectInput(session,"X",
                    label = "X-Axis",
                    choices = me_option )
  updateSelectInput(session,"Y",
                    label = "Y-Axis",
                    choices = me_option)
  updateSelectInput(session,"fill",
                    label = "Fill Colour",
                    choices = aes_ops,
                    selected = "")
  
  updateRadioButtons(session,"filter",
                     label = "filters",
                     choices = di_option,
                     selected = "")
  ## Heat Map
  updateSelectInput(session, "xaxis2",
                    label = "x-Axis",
                    choices = di_option,
                    selected = "")
  
  updateSelectInput(session, "yaxis1",
                    label = "y-Axis",
                    choices = me_option,
                    selected = "")
  updateSelectInput(session, "zaxis1",
                    label = "z-Axis1",
                    choices = di_option,
                    selected = "")
  ##3D scatter
  updateSelectInput(session, "x_axis",
                    label = "x-Axis",
                    choices = me_option,
                    selected = "")
  
  updateSelectInput(session, "y_axis",
                    label = "y-Axis",
                    choices = me_option,
                    selected = "")
  
  updateSelectInput(session, "z_axis",
                    label = "z-Axis",
                    choices = me_option,
                    selected = "")
  updateSelectInput(session,"CLR",
                    label = "clr",
                    choices = aes_ops,
                    selected = "")
  ##Area Chart
  updateSelectInput(session, "xaxis3",
                    label = "X-Axis",
                    choices = di_option,
                    selected = "")
  updateSelectInput(session, "yaxis3",
                    label = "Y-Axis",
                    choices = me_option,
                    selected = "")
  #### Pie Chart
  updateSelectInput(session, "xaxis4",
                    label = "X-Axis",
                    choices = di_option,
                    selected = "")
  updateSelectInput(session, "yaxis4",
                    label = "Y-Axis",
                    choices = di_option,
                    selected = "")
  
  
  
  # updateRadioGroupButtons(session,"xaxisGrp",
  #                          label = "Exclude",
  #                          choices = di_option,
  #                          selected = "")
  # updateRadioGroupButtons(session, "xaxisGrp",
  #                          label = "Target",
  #                          choices = di_option,
  #                          selected = "")
  # updateRadioButtons(session, "unique",
  #                         label = "unique values",
  #                         choices = uni,
  #                         selected ="")
})


output$cols <- renderTable({
  req(input$InputFile)
  variable <- colnames(data_set())
  return(variable)
})



output$plot1 = renderPlot(
  {
    df <- data_set()
    gp <- NULL
    if (!is.null(df)){
      xv <- input$xaxis1
      yv <- input$yaxisGrp
      ff <-input$fill
      if (!is.null(xv) & !is.null(yv)){
        #if (sum(xv %in% names(df))>0){ # supress error when changing files
        #mdf <- melt(df,id.vars=xv,measure.vars=yv)
        gp <- ggplot(data=df,mapping= aes_string(x=xv,y=yv,shape = ff,color = ff)) + 
          geom_point(stat = "identity")+
          ggtitle(paste("Scatter plot of",xv," and ",yv)) +
          theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
        # + scale_fill_continuous(palette = "Oranges") # Scatter plot 
        #}
      }
    }
    return(gp)
  }
)

output$plot2 = renderPlot(
  {
    df <- data_set()
    bar <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- reshape2::melt(df,id.vars=xv,measure.vars=yv)
          bar <- ggplot(data=df,mapping = aes_string(x =xv, y=yv,fill = xv),position = "dodge")+
            geom_bar(stat = "identity") + scale_fill_brewer(palette = "Oranges")+
            ggtitle(paste("Bar plot of",xv," and ",yv))+
            theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
          
        }
      }
    }
    return(bar)
  }
)

output$plot3 = renderPlot(
  {
    df <- data_set()
    gp <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- melt(df,id.vars=xv,measure.vars=yv)
          
          piechart <- ggplot() + theme_bw()
          geom_bar(data=df,mapping = aes_string(x = "", y = yv, fill = str(xv)), stat= "identity", width=1, color="white")+
            coord_polar("y", start=0)+ scale_fill_brewer(palette = "Blues")+
            ggtitle(paste("Pie Chart of",xv," and ",yv))
          #theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
          
          
        }
      }
    }
    return(piechart)
  }
)

output$plot4 = renderPlot(
  {
    df <- data_set()
    gp <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- melt(df,id.vars=xv,measure.vars=yv)
          barhorizontal <- ggplot(data=df, mapping = aes_string(x =xv, y=yv, fill = xv),position = "dodge") + 
            geom_bar(stat = 'identity')+scale_fill_brewer(palette = "Blues")+
            coord_flip()+
            ggtitle(paste("Horizontal Bar plot of ",xv," and ",yv))+
            theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
          
          
        }
      }
    }
    return(barhorizontal)
  }
)

output$plot5 = renderPlot(
  {
    df <- data_set()
    areachart <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- melt(df,id.vars=xv,measure.vars=yv)
          areachart <- ggplot(data=df,mapping = aes_string(x = xv,y = yv,fill = "xv")) + 
            geom_area(alpha = 0.5)+theme_void()+
            theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))+
            ggtitle(paste("Area Chart of ",xv," and ",yv))
          
          
        }
      }
    }
    return(areachart)
  }
)

output$plot6 = renderPlot(
  {
    df <- data_set()
    gp <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- melt(df,id.vars=xv,measure.vars=yv)
          gp6 <- ggplot(data=df,colour="white") +
            geom_line(mapping = aes_string(x = xv,y = yv), colour = "red")+
            ggtitle(paste("Line Chart of ",xv," and ",yv))
          
        }
      }
    }
    return(gp6)
  }
)

output$plot7 = renderPlot(
  {
    df <- data_set()
    gp <- NULL
    if (!is.null(df)){
      xv <- input$xaxisGrp
      yv <- input$yaxisGrp
      ff <-input$fill
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          mdf <- melt(df,id.vars=xv,measure.vars=yv)
          fig <- plot_ly(data = mdf, x = xv, y = yv,color = ff)
          
          
          
        }
      }
    }
    return(fig)
  }
)

output$choose_columns <- renderUI({
  
  if(is.null(input$dataset))
    return()
  colnames <- names(contents)
  checkboxGroupButtons("columns", "Choose columns", 
                       choices  = colnames,
                       selected = colnames)
  
  checkboxGroupButtons("columns","Choose columns",
                       choices  = colnames,
                       selected = "")
}) 

# plotType <- function(type) {
#   switch(type,
#          plot3 ,
#          plot5 ,
#          plot6 )
# }

# observeEvent({input$graph
#   updateSelectInput(session, "graph",
#                      label = "Select Graph",
#                       choices = graph,
#                       selected = "Pie Chart")
#  })
# updateSelectInput(session, "graph",
#                     label = "Select Graph",
#                     choices = c("Pie Chart","Line Chart","Area chart"),
#                     selected = "Pie Chart")
# 

# observe({
#   print(input$graph)
# })


observeEvent(input$graph,{
  if(input$graph %in% "plot3") output$plot3 <- renderPlot(
    {
      df <- data_set()
      gp <- NULL
      if (!is.null(df)){
        xv <- input$xaxisGrp
        yv <- input$yaxisGrp
        if (!is.null(xv) & !is.null(yv)){
          if (sum(xv %in% names(df))>0){ # supress error when changing files
            #mdf <- melt(df,id.vars=xv,measure.vars=yv)
            
            piechart <- ggplot() + theme_bw()+
              geom_bar(data=df,mapping = aes_string(x= "",y = yv, fill = "xv"), stat= "identity", colour="red")+
              coord_polar("y", start=0)+ scale_fill_brewer(palette = "Blues")+
              ggtitle(paste("Pie Chart of ",xv," and ",yv))
            
            
          }
        }
      }
      return(piechart)
    }
  )
  else if (input$graph %in% "plot5") output$plot5 <- renderPlot(
    {
      df <- data_set()
      gp <- NULL
      if (!is.null(df)){
        xv <- input$xaxisGrp
        yv <- input$yaxisGrp
        if (!is.null(xv) & !is.null(yv)){
          if (sum(xv %in% names(df))>0){ # supress error when changing files
            #mdf <- melt(df,id.vars=xv,measure.vars=yv)
            gp6 <- ggplot(data=df) +
              geom_line(mapping = aes_string(x = xv,y = yv), colour = "red")+
              theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))+
              ggtitle(paste("Line Chart of ",xv," and ",yv))
            
          }
        }
      }
      return(gp6)
    }
  )
  else output$plot6 = renderPlot(
    {
      df <- data_set()
      areachart <- NULL
      if (!is.null(df)){
        xv <- input$xaxisGrp
        yv <- input$yaxisGrp
        if (!is.null(xv) & !is.null(yv)){
          if (sum(xv %in% names(df))>0){ # supress error when changing files
            #mdf <- melt(df,id.vars=xv,measure.vars=yv)
            areachart <- ggplot(data=df,mapping = aes_string(x = xv,y = yv,fill = "xv")) +
              geom_area(fill = "#69b3a2", alpha = 0.5)+
              ggtitle(paste("Area Chart of ",xv," and ",yv))+
              theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
            
            
          }
        }
      }
      return(areachart)
    }
  )
})






output$dfEDA <- renderTable({
  ## Data Summary
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  SmartEDA::ExpData(data=df,type=2)
  #skim(df)
  
})
output$corr <- renderPlot({
  ## Correlation plot
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  plot_correlation(df,type="continuous",)
})


output$hist <- renderPlot({
  ## Histogram
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  #plot_histogram(df)
  xv <- input$xaxisGrp
  yv <- input$yaxisGrp
  ggplot(df, aes_string(x=xv, color=xv)) +
    geom_histogram(fill="#69b3a2", color="#5584AC")
  # # Overlaid histograms
  # ggplot(df, aes(x=weight, color=sex)) +
  #   geom_histogram(fill="white", alpha=0.5, position="identity")
})

output$box <- renderPlot({
  ## Box plots
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  xv <- input$xaxis
  yv <- input$yaxis
  #plot_boxplot(df,by = yv)
  df %>%
    mutate(clas = fct_reorder(xv, yv, .fun='length' )) %>%
    ggplot(aes_string(x=xv, y=yv, fill=xv)) + 
    geom_boxplot() +
    xlab(paste0("clas")) +
    theme(legend.position="none") +
    xlab("") +
    xlab("")
})
#######heat map
output$heat <- renderPlot({
  ## heat map
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  xv <- input$xaxis2
  yv <- input$yaxis1
  zv <- input$zaxis1
  map<-cor(df[sapply(df,is.numeric)])
  map1<-melt(map)
  ggplot(map1,aes(x=xv, y=yv,
                  fill = zv)) + geom_tile()
})

########
# output$heat <- renderPlot({
#   ## heat map
#   req(input$InputFile)
#   inFile <- input$InputFile
#   df<-read.csv(inFile$datapath, header = input$header)
#   xv <- input$xaxis2
#   yv <- input$yaxis1
#   pl <- ggplot(data = df,aes( x = xv, y = yv, fill=xv))
#   pl <- pl + geom_tile()
#   pl
# })

##########

output$scatter <-renderPlot({
  req(input$InputFile)
  inFile <- input$InputFile
  df<-read.csv(inFile$datapath, header = input$header)
  xv <- as.numeric(input$x_axis)
  yv <- as.numeric(input$y_axis)
  zv <- as.numeric(input$z_axis)
  ff <- as.numeric(input$CLR)
  
  scatterplot3d(x=xv, y=yv,z= zv,
                color = ff ,xlim ="", ylim = "", zlim = "",
                xlab="xv", ylab="yv", zlab="zv",pch=16 ,main="3D scatter plot",
                scale.y = 1, angle = 40 )
}) 



#########Area Chart
output$Area = renderPlot(
  {
    df <- data_set()
    areachart <- NULL
    if (!is.null(df)){
      xv <- input$xaxis3
      yv <- input$yaxis3
      if (!is.null(xv) & !is.null(yv)){
        if (sum(xv %in% names(df))>0){ # supress error when changing files
          #mdf <- melt(df,id.vars=xv,measure.vars=yv)
          areachart <- ggplot(data=df,mapping = aes_string(x = xv,y = yv,fill = "xv")) + 
            geom_area(alpha = 0.5)+  geom_line(color="#69b3a2", size=1) +
            geom_point(size=2, color="#69b3a2") 
          theme_void()+
            theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))+
            ggtitle(paste("Area Chart of ",xv," and ",yv))
          
          
        }
      }
    }
    return(areachart)
  }
)

output$plot7 <- renderPlot(
  {
    
    req(input$InputFile)
    inFile <- input$InputFile
    df<-read.csv(inFile$datapath, header = input$header)
    
    # df <- data_set()
    # gp <- NULL
    # if (!is.null(df)){
    
    xv <- input$xaxis4
    
    df$xv <- sapply(strsplit(rownames(df), " "), "[[", 1)
    
    df %>%
      
      group_by(xv) %>%
      
      summarize(count = n()) %>%
      
      plot_ly(labels = ~xv, values = ~xv) %>%
      
      add_pie(hole = 0.6) %>%
      
      layout(title = "Donut charts using Plotly",  showlegend = F,
             
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })