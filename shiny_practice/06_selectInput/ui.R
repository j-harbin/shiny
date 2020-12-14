library(shiny)

shinyUI(fluidPage(

                  titlePanel("Demonstration of the selectInput"),
                  sidebarLayout(
                                sidebarPanel(
                                             selectInput("statenames", "Select the state", c("California", "Florida","Texas", "New York", "Arizonia"), selected="Texas", multiple=TRUE)
                                             ),
                                mainPanel(
                                textOutput("state"))

                                )))
# This would be similar to if "Path" was selected, then "End", "start" and :profiles" could come down
# selectize just changes appearance
# multiple allows to choose multiple states
