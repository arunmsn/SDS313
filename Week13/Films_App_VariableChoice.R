#
# SDS 313 Shiny App Example - Films with variable choice
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
            
            #Select box for variable:
            selectInput("selectvar", label = h3("Choose a variable"), 
                        choices=list("Days in Theaters"=1, "Budget"=2), 
                        selected = 1),
            
            # Slider input for number of bins
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
        
        if(input$selectvar == 1){
            hist(films$Days, breaks = input$bins, main='Distribution of Days Spent in Theaters',xlab='Days Spent in Theaters',col = 'purple', border = 'darkgrey')
        }
        
        if(input$selectvar == 2){
            hist(films$Budget, breaks = input$bins, main='Distribution of Movie Budgets',xlab='Budget (millions of $)',col = 'purple', border = 'darkgrey')
        
        }
    })
        
    
    #Display mean if selected
    output$mean <- renderPrint({ 
        if(input$checkbox1 == TRUE & input$selectvar == 1){
            mean(films$Days, na.rm=TRUE)}
        else if(input$checkbox1 == TRUE & input$selectvar == 2) {
            mean(films$Budget, na.rm=TRUE)}
        })
    
    #Display sd if selected
    output$sd <- renderPrint({ 
        if(input$checkbox2 == TRUE & input$selectvar == 1){
            sd(films$Days, na.rm=TRUE)}
        else if(input$checkbox2 == TRUE & input$selectvar == 2){
            sd(films$Budget, na.rm=TRUE)}
        })
}

# Run the application 
shinyApp(ui = ui, server = server)
