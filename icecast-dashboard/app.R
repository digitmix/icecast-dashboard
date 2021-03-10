#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

source('C:/Users/user/Documents/workspace/R/icecast-dashboard/displayfunction.R')

# Define UI for application that draws a histogram
# histogram <- function(input) {
# x    <- faithful[, 2]
# bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
# # draw the histogram with the specified number of bins
# hist(x, breaks = bins, col = 'darkgray', border = 'white')
# }

ui <- fluidPage(
    
    # Application title
    titlePanel("Audience"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            checkboxInput("checkbox", label = "Custom range", value = FALSE),
            dateInput("date1", label = "Start", value = "2021-03-09"),
            dateInput("date2", label = "End", value = "2021-03-09"),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        
        listenersplot(input)    
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
