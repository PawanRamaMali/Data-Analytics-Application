
  
  server <- function(input, output, session) {
    
    source("./server/buildPage.R", local = TRUE)
    
    source("./server/mainPage.R", local = TRUE)
    
    source("./server/configPage.R", local = TRUE)

    source("./server/discoveryPage.R", local = TRUE)

  }
  
  