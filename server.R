library(shiny)
source('helpers_leaflet.R')

shinyServer(function(input, output) {

  #When map starts
  output$map <- renderLeaflet({
    make_map()
  })

  #On changing the options
  observeEvent(input$subset, {
    subset <- select_subset(input$subset) 
    print(subset)
    update_map(subset)
  })
  
})

