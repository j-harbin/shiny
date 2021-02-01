library(shiny)
ui <- fluidPage(
                fluidRow(
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::sliderInput("Csymbol", "Symbol Type", min=0, max=25, value=21, step=1)),
                          shiny::conditionalPanel("input.Csymbol== 21",
                                                     shiny::div(style="display: inline-block;vertical-align:top; width: 8em;",
                                                                shiny::selectInput("Cborder", "Border Colour", choices=c("1","2", "3", "4", "5", "6", "7", "8"), selected="1")))
))
