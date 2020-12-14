library(shiny)

shinyUI(fluidPage(
                  titlePanel("Demonstration of sliderInput widget in shiny"),
                  sidebarLayout(
                                sidebarPanel(
                                             sliderInput("slide", "Select the value from Slider", min=0, max=5, value=2, step=0.5)
                                             ),
                                mainPanel(
                                          textOutput("out"))
                  )
                  ))

# To do this, real time changing value: step1, in sliderInput create an ID in ui.R, in server.R create an output ID based on tenderText(input ID), then go back in ui.R and in mainPanel create a textOutput with the ID being the new output ID.
