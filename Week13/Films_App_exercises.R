#
# SDS 313 Shiny App Example - Films
#

library(shiny)

films <- read.csv('films.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Films Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            
        #option to show mean
        checkboxInput("checkbox1", label="Display mean", value=FALSE),
        
        
        #option to show sd
        checkboxInput("checkbox2", label="Display standard deviation", value=FALSE),
    ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           hr(),
           p('Mean:'),
           fluidRow(column(5, verbatimTextOutput("mean"))),
           p('Standard deviation:'),
           fluidRow(column(5, verbatimTextOutput("sd"))),
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
        # draw the histogram based on input$bins from ui.R
        hist(films$Days, breaks = input$bins, main='Distribution of Days Spent in Theaters',xlab='Days Spent in Theaters',col = 'purple', border = 'darkgrey')
    })
    
    #Display mean if selected
    output$mean <- renderPrint({ 
        if(input$checkbox1 == TRUE){
            mean(films$Days)
        }
         })
    
    #Display sd if selected
    output$sd <- renderPrint({ 
        if(input$checkbox2 == TRUE){
            sd(films$Days)
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
