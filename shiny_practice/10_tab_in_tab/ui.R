library(shiny)
library(shiny)

ui <- fluidPage(
   titlePanel("Mock App"),
   tabsetPanel(
     tabPanel("Chemistry",
              tabsetPanel(
                tabPanel("First",
                         fluidRow(
                                  column(width = 6,
                                        plotOutput("Plot1", height = "350px")
                                  )
                         )
                ),
                tabPanel("Second",
                         fluidRow(
                                  column(width = 6,
                                         plotOutput("Plot2", height = "350px")
                                  )
                         )
                )
              ) #Close inner tabsetPanel
     ),
     tabPanel("Plasma",
              fluidRow(
                       column(width = 12,
                              h1("HI!")
                       )
              )
     )
  ) #Close outer tabsetPanel
) #Close FluidPage
