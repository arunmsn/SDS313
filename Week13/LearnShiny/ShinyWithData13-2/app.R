ui <- fluidPage(
  
  # Add overall title
  titlePanel("title of the app"),
  
  # Define a side bar layout with a main panel
  sidebarLayout(
    
    # Define the side bar
    sidebarPanel(
      # Add some radio buttons
      radioButtons(inputId = "buttons", ,
                   label = h3("title of the buttons"),
                   choices = list("first choice label" = 1,
                                  "second choice label" = 2),
                   selected = 1), # value selected by default
    ), # end of side bar options
    
    # Define the main panel
    mainPanel(h3("title of the panel"),
              p('text in the panel'),
              plotOutput("name_output"),
              img(src = 'https://cdn.prod.website-files.com/654fd3ad88635290d9845b9e/65b39f4e998d22f5e9e63c0f_6525256482c9e9a06c7a9d3c%252F65aab94b7ab96a368daac4ac_thumbnail-2-scaled.webp')
    )
  )
)

server <- function(input, output) {
  
  # Use renderPlot to define the output plot and indicate that:
  # 1. This object is "reactive": automatically re-executed when inputs change
  # 2. Its output type is a plot
  output$name_output <- renderPlot({
    
    # Execute code for each conditions for each input button
    if (input$buttons == 1){
      barplot(table(input$buttons))
    }
    else if (input$buttons == 2){
      hist(as.numeric(input$buttons))
    }
  })
}

shinyApp(ui = ui, server = server)