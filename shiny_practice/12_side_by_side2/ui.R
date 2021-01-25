library(shiny)
ui <- fluidPage(
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::textInput("ID", "Float ID", value="", width="75%")),
    div(style="display: inline-block;vertical-align:top; width: 100px;",HTML("<br>")),
    div(style="display: inline-block;vertical-align:top; width: 150px;",
        shiny::selectInput("focus", "Focus", choices=c("All"="all", "Single"="single"),
                                                                              selected="all", width="75%"))
)
