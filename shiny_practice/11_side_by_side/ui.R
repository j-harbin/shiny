library(shiny)

ui <- fluidPage(
  fluidRow(
    div(style="display: inline-block;vertical-align:top; width: 150px;",textInput(inputId="start", label="Start", value=sprintf("%4d-%02d-%02d", startTime$year + 1900, startTime$mon + 1, startTime$mday))),
    div(style="display: inline-block;vertical-align:top; width: 100px;",HTML("<br>")),
    div(style="display: inline-block;vertical-align:top; width: 150px;",textInput(inputId="end", label="End", value=sprintf("%4d-%02d-%02d", endTime$year + 1900, endTime$mon + 1, endTime$mday)))),
  mainPanel()
)

