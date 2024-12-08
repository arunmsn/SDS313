#
# SDS 313 Shiny App Example - Widgets
#

library(shiny)

# Define user interface
ui <- fluidPage(

    # App title
    titlePanel('Play Around with Widgets'),

    # Sidebar and main panels 
    sidebarLayout(
        sidebarPanel(
        
    #Radio Button input
    radioButtons("radio", label=h3("Starting Number:"),
                 choices=list("Start with -1"=-1,"Start with -2"=-2,"Start with -3"=-3, "Start with 4"=4, "Start with 5"=5), 
                 selected = -1),
    hr(),
    
    #Select Box input
    selectInput("select", label = h3("Multiply by how many?"), 
                choices=list("Times 2"=2, "Times 3"=3, "Times 4"=4), 
                selected = 2),
    hr()),
    
    #Main panel
        mainPanel(
            p('Starting value:'),
            fluidRow(verbatimTextOutput("radiovalue")),
            p('What to multiply:'),
            fluidRow(verbatimTextOutput("selectvalue")),
            p('Final value:'),
            fluidRow(verbatimTextOutput("finalvalue")),
        )
        
    )
)

# Define server function (blank for now)
server <- function(input, output) {
    
    #Access the values of the widget (as a vector)
    # with input$radio
    output$radiovalue <- renderPrint({ as.numeric(input$radio) })
    output$selectvalue <- renderPrint({ as.numeric(input$select) })
    output$finalvalue <- renderPrint({ 
        x <- as.numeric(input$radio) * as.numeric(input$select)
        x })
}

# Run the app
shinyApp(ui = ui, server = server)
