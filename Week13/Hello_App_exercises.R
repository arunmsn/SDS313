#
# SDS 313 Shiny App Example - Hello Shiny!
#

library(shiny)

# Define user interface
ui <- fluidPage(

    # App title
    titlePanel('Sally Ragsdale'),

    # Sidebar and main panels 
    sidebarLayout(
        sidebarPanel('My favorite book',br(),em('The Expanse'),'by James S.A. Corey', align='center'),
        mainPanel(
            h2(em('Book Description'), align='center'),
            p(em('The Expanse'),' is a 9 book science fiction series about a crew of a ship that finds itself in the middle of the conflict among Earth, Mars, and Belters after the discovery of an alien technology.', style = "font-family: 'times'")
        )
    )
)

# Define server function (blank for now)
server <- function(input, output) {
}

# Run the app
shinyApp(ui = ui, server = server)
