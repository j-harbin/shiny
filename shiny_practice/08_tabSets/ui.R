library(shiny)

shinyUI(fluidPage(

                  titlePanel("Demonstration of the renderPlot - a histogram"),
                  sidebarLayout(
                                sidebarPanel(
                                             radioButtons("color", "Select actions for Path of an Argo profiling float", choices=c("red", "green", "blue"), selected="red")),
                                                          mainPanel(
tabsetPanel(type="tab",
            tabPanel("Path", plotOutput("plot")))

                                                          )
                                                          )))
# This is making a simple tabPanel, now we want to do a conditional one
