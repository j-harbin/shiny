library(shiny)
library(azmpdata)
library(leaflet)

library(shiny)

shinyUI(fluidPage(

                  titlePanel("GUI for azmpdata package."),
                  sidebarLayout(
                                sidebarPanel(
                                             conditionalPanel(condition="input.tabselected==1", shiny::actionButton("help", "Help"),
                                                              shiny::actionButton("code","Code")),
                                             conditionalPanel(condition="input.tabselected==2", shiny::radioButtons("type", "Select your type of parameter", choices=c("Physical", "Chemical", "Biological"), selected=c("Physical")))),
                                                          mainPanel(
tabsetPanel(type="tab",
            tabPanel("Map", value=1, leaflet::leafletOutput("map")),
            tabPanel("Parameters", value=2, plotOutput("parameters")),
id = "tabselected")

                                                          ))))
