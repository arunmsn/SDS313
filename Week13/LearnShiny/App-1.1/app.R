library(shiny)
library(bslib)

# Define UI ----
ui <- page_sidebar(
  title = "title panel",
  sidebar = sidebar("sidebar", position = "right"),
  "main contents"
)

ui_2 <- page_fluid(
  layout_sidebar(
    sidebar = sidebar("Sidebar"),
    "Main contents"
  )   
)

ui_3 <- page_sidebar(
  title = "title panel",
  sidebar = sidebar("Sidebar"),
  value_box(
    title = "Value box",
    value = 100,
    showcase = bsicons::bs_icon("bar-chart"),
    theme = "teal"
  ),
  card("Card"),
  card("Another card")
)

ui_4 <- page_sidebar(
  title = "My Shiny App",
  sidebar = sidebar("Shiny is available on CRAN, so you can install it in the usual way from your R console:", code(install.packages("shiny"))),
  card(
    card_header("Introducing Shiny"),
    "Shiny is a package from Posit that makes it incredibly easy to build interactive web applications with R. For an introduction and live examples, visit the Shiny homepage (https://shiny.posit.co).",
    card_footer("Shiny is a product of Posit.")
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui_4, server = server)