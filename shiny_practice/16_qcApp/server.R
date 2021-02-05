server <- shinyServer(function(input,output){


                          output$UIfocus <- shiny::renderUI({
                              if (input$tabselected %in% c(2)) {
                                  shiny::fluidRow(
                                                  shiny::column(2, shiny::textInput("ID", "Float ID", value="", width="11em")),
                                                  shiny::column(2, shiny::textInput("cycle", "Cycle", value="", width="11em")))
                              }
                          })

                          output$UIwidget <- shiny::renderUI({
                              if (input$tabselected %in% c(1, 2)) {
                                  shiny::fluidRow(shiny::column(2,shiny::span(shiny::HTML(paste("<b style=\"color:black; margin-left:1em;\">  ","qcApp 0.1","</b>")))),
                                                  shiny::column(2, shiny::actionButton("help", "Help")),
                                                  shiny::column(2, shiny::actionButton("code", "Code")))}})

                          output$UIsingleQC <- shiny::renderUI({
                              if (input$tabselected %in% c(2)) {
                                  shiny::checkboxGroupInput("qc",
                                                            label="Single float QC",
                                                            choiceNames=list(shiny::tags$span("applyQC", style="color:black;"),
                                                                             shiny::tags$span("showQCTests", style="color:black;"),
                                                                             shiny::tags$span("Diagnostics", style="color:black;")),
                                                            choiceValues=list("applyQC","showQCTests", "diagnostics"),
                                                            inline=TRUE)
                              }
                          })

                          output$UIplot <- shiny::renderUI({
                              ##FIXME: Add glider options to both plot types
                              if (input$tabselected %in% c(1)) {

                                  shiny::fluidRow(shiny::column(3, shiny::selectInput("type", "Plot Profile", choices=c("Salinity", "Temperature", "Oxygen"), selected="Temperature")),

                                  shiny::column(3, shiny::selectInput("colorcode", "Color-code by", choices=c("Temperature", "Latitude", "Oxygen"), selected="Temperature")))}

                          })

})
