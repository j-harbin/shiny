library(shiny)

ui <- fluidPage(

                shiny::tabsetPanel(type="tab",
                                   shiny::tabPanel("Main", value=1),
                                   shiny::tabPanel("Single Float", value=2),
                                   id="tabselected"),
                shiny::fluidRow(
                                shiny::uiOutput(outputId="UIwidget")),

                shiny::fluidRow(
                                shiny::uiOutput(outputId="UIfocus")),

                shiny::fluidRow(shiny::uiOutput(outputId="UIsingleQC")),
                shiny::fluidRow(shiny::uiOutput(outputId="UIplot"))

)
