library(shiny)
library(azmpdata)
library(leaflet)

shinyUI(fluidPage(

                  titlePanel("GUI for azmpdata package."),
                  shiny::mainPanel(
tabsetPanel(type="tab",
            tabPanel("Map", value=1, leaflet::leafletOutput("map")),
            tabPanel("Parameters", value=2, plotOutput("parameters")),
id = "tabselected")

                                                          )
                                                          ))
