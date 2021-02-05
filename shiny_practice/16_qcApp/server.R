server <- shinyServer(function(input,output){


output$UIID <- shiny::renderUI({
        if (input$tabselected %in% c(2)) {
            shiny::mainPanel(shiny::textInput("ID", "Float ID", value="", width="11em"))
        }
    })

output$UIcycle <- shiny::renderUI({
        if (input$tabselected %in% c(2)) {
            shiny::mainPanel(shiny::textInput("cycle", "Cycle", value="", width="11em"))
        }
    })

output$UIwidget <- shiny::renderUI({
        if (input$tabselected %in% c(1, 2)) {
                             shiny::fluidRow(shiny::column(2,shiny::span(shiny::HTML(paste("<b style=\"color:blue; margin-left:1em;\">  ","qcApp 0.1","</b>")))),
                                             shiny::column(2, shiny::actionButton("help", "Help")),
                                             shiny::column(2, shiny::actionButton("code", "Code")))}})


})
