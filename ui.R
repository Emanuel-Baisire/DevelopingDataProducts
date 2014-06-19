library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
        # Application title
        titlePanel("US State Data"),
        
        # Sidebar with controls to select the data index to display in Geo Chart
        sidebarLayout(
                sidebarPanel(
                        selectInput("dataIndex", "Select Data Index:", 
                                    choices=colnames(states[,-1])),
                        hr()),
                # Show the google map
                mainPanel(
                        h3(textOutput("dataIndex")),
                        htmlOutput("view")
                        )
                )
        )
)