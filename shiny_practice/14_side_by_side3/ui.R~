library(shiny)
ui <- fluidPage(
                fluidRow(
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::selectInput("Ccolour", "Symbol Colour", choices=c("1","2","3","4","5","6","7","8", "default"), selected="default")),
                div(style="display: inline-block;vertical-align:top; width: 100px;",HTML("<br>")),
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::sliderInput("Csymbol", "Symbol Type", min=0, max=25, value=21, step=1)),
                div(style="display: inline-block;vertical-align:top; width: 100px;",HTML("<br>")),
    div(style="display: inline-block;vertical-align:top; width: 150px;",
    shiny::sliderInput("Csize", "Symbol Size", min=0, max=1, value=0.5, step=0.05)),

),
fluidRow(
    div(style="display: inline-block;vertical-align:top; width: 150px;",
       shiny::selectInput("CPcolour", "Path Colour",choices=c("1","2","3","4","5","6","7","8","default"), selected="default")),
    div(style="display: inline-block;vertical-align:top; width: 150px;",
         shiny::selectInput("CPcolour", "Path Colour",choices=c("1","2","3","4","5","6","7","8","default"), selected="default"))))
