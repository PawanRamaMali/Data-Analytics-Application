
###################
# functions.R

require(lubridate)


## SIMPLE GREETING
good_time <- function() {
  ## LOAD PACKAGE
  require(lubridate, quietly = T)
  
  ## ISOLATE currHour
  currhour = hour(now())
  
  ## RUN LOGIC
  if (currhour < 12) {
    return(gm)
  }
  else if (currhour >= 12 & currhour < 17) {
    return(ga)
  }
  else if (currhour >= 17) {
    return(ge)
  }
}


gm= tags$h3(strong("Good Morning",style="color:#2B2B2B",style = "font-family:Poppins bold"))
ga= tags$h3(strong("Good Afternoon",style="color:#2B2B2B",style = "font-family:Poppins bold"))
ge= tags$h3(strong("Good Evening",style="color:#2B2B2B",style = "font-family:Poppins bold"))