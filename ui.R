library(shiny)
library(leaflet)

shinyUI(fluidPage(

  titlePanel("Edinburgh Parks"),

  sidebarLayout(
    sidebarPanel(
      selectInput("subset",
                  label = h3("What do you want at your park?"), 
                  choices = as.list(options))
    ),

    mainPanel(
      leafletOutput("map")
    )
  )
))
