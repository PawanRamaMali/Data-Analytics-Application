library(shinydashboard)

Build <- source("ui/buildPage.R", local = TRUE)
Main <- source("ui/Main.R", local = TRUE)
Configure <- source("ui/config.R", local = TRUE)
Discovery <- source("ui/discovery.R", local = TRUE)
ModelBuilding <- source("ui/modelbuild.R", local = TRUE)
evaluation <- source("ui/evaluation.R", local = TRUE)
comparision <- source("ui/comparision.R", local = TRUE)
deployment <- source("ui/deployment.R", local = TRUE)


fluidPage(
  theme = shinythemes::shinytheme("lumen"),
  useShinyjs(),
  useShinydashboard(),

  
  div(
    id = "main_content",
    
    navbarPageWithInputs(
      windowTitle = "Data Analytics App",
      title = div(
        a(tags$img(),
          target = "_blank",
          style = "color:white;text-decoration:none;padding-left:20px;"),
        tags$div(
          style = "margin-left:25px;margin-top: 8px; display:inline-block;"
        )
      ),
      id = "Front",
      
      # Source Page ----
      Build$value,
      
      ## main page
      Main$value,
      
      # Configure Page----
      Configure$value,
      
      # Discovery  Page ----
      Discovery$value,
      
      # Prediction Analysis-----
      ModelBuilding$value,
      
      ## Evaluation------
      evaluation$value,
      
      ## Comparison
      comparision$value,
      
      ## deployment
      deployment$value,
      
      
      inputs  = NULL
    )
  )
)
