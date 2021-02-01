library(shiny)
ui <- fluidPage(
                fluidRow(
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::sliderInput("Csymbol", "Symbol Type", min=0, max=25, value=21, step=1)),
                          shiny::conditionalPanel("input.Csymbol== 21",
                                                     shiny::div(style="display: inline-block;vertical-align:top; width: 8em;",

    shiny::sliderInput("Csize", "Symbol Size", min=0, max=1, value=0.5, step=0.05)))
))
