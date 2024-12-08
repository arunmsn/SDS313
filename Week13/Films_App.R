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
        
        radioButtons("graph_choice", "Choose Graph", choices = list("Days", "Budget")),
            
        #option to show mean
        checkboxInput("checkbox", 
                      label="Display mean", 
                      value=FALSE),
        checkboxInput("checkbox2", 
                      label="Display sd", 
                      value=FALSE),
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           hr(),
           fluidRow(column(5, verbatimTextOutput("mean"))),
           fluidRow(column(5, verbatimTextOutput("stdev"))),
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
        if (input$graph_choice == "Budget") {
          # draw the histogram based on input$bins from ui.R
          hist(films$Budget, breaks = input$bins, main='Distribution of Movie Budgets',xlab='Budget',col = 'green', border = 'red')
          #Display mean if selected
          output$mean <- renderPrint({ 
            if(input$checkbox == TRUE){
              mean(films$Budget, na.rm=TRUE)
            }
          }
          )
          output$stdev <- renderPrint({ 
            if(input$checkbox2 == TRUE){
              sd(films$Budget, na.rm=TRUE)
            }
          }
          )
        } else if (input$graph_choice == "Days") {
          # draw the histogram based on input$bins from ui.R
          hist(films$Days, breaks = input$bins, main='Distribution of Movie Days',xlab='Days',col = 'purple', border = 'grey')
          #Display mean if selected
          output$mean <- renderPrint({ 
            if(input$checkbox == TRUE){
              mean(films$Days)
            }
          }
          )
          output$stdev <- renderPrint({ 
            if(input$checkbox2 == TRUE){
              sd(films$Days)
            }
          }
          )
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
