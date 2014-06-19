library(shiny)
library(googleVis)
require(datasets)
states <- data.frame(state.name, state.x77)

shinyServer(function(input, output) {

output$dataIndex <- reactive({
         switch(input$dataIndex,
                "Population" = "Population",
                "Income" = "Income",
                "Illiteracy" = "Illiteracy",
                "Life.Exp" = "Life.Exp",
                "Murder" = "Murder",
                "HS.Grad" = "HS.Grad",
                "Frost" = "Frost",
                "Area" = "Area")
 })
        
 output$view <- renderGvis({
 gvisGeoChart(states, locationvar = "state.name", colorvar = input$dataIndex,
              options=list(region="US", 
                           displayMode="regions", 
                           resolution="provinces",
                           width=600, height=400))
 })
})

