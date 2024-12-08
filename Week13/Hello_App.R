#
# SDS 313 Shiny App Example - Hello Shiny!
#

library(shiny)

# Define user interface
ui <- fluidPage(

    # App title
    titlePanel('Arun Mahadevan Sathia Narayanan'),

    # Sidebar and main panels 
    sidebarLayout(
        sidebarPanel('My favorite book', br(), 'The Alchemist', align="center"),
        mainPanel(
            h2('Book Description', align='center'),
            p(em('This is a book written by Paulo Coelho about a young man learning about the treasures of life.')),
            div('We can style text here', style='color:purple')
        )
        
    )
)

# Define server function (blank for now)
server <- function(input, output) {
}

# Run the app
shinyApp(ui = ui, server = server)
