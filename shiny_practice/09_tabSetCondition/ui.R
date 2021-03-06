library(shiny)

shinyUI(fluidPage(

                  titlePanel("Demonstration of the renderPlot - a histogram"),
                  sidebarLayout(
                                sidebarPanel(
                                             conditionalPanel(condition="input.tabselected==1", selectInput("action", "Select the action for your path", choices=c("End" = 1, "Start" = 2, "Profiles"= 3), selected=c("Profiles"))),
                                             conditionalPanel(condition="input.tabselected==2", radioButtons("pch", "select your pch", choices=c("20", "21","1"), selected=c("20"))),
                                             radioButtons("color", "Select actions for Path of an Argo profiling float", choices=c("red", "green", "blue"), selected="red")),
                                                          mainPanel(
tabsetPanel(type="tab",
            tabPanel("Path", value=1, plotOutput("plot")),
            tabPanel("Not", value=2, plotOutput("not")),
id = "tabselected")

                                                          )
                                                          )))
# First, add tabPanel in mainPanel(tabsetPanel)
# then add id for that tabPanel
# Then add conditionalPanel for sidebar Panel if it is selected to add the choices in, which is based on the id for the tabPanel
# Then tell it what to do in server.R

