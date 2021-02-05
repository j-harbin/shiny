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
                              ## NOTE: The type and colorBy are the same as oceanglider
                              if (input$tabselected %in% c(1)) {

                                  shiny::fluidRow(
                                                  shiny::column(3, shiny::selectInput("type", "Plot Type",choices=c("TS <T>"="TS",
                          "C(t)"="conductivity time-series",
                          "p(t) <P>"="pressure time-series",
                          "S(t) <S>"="salinity time-series",
                          "spiciness(t)"="spiciness time-series",
                          "T(t)"="temperature time-series",
                          "tSincePowerOn(t)"="tSincePowerOn time-series",
                          "C(p)"="conductivity profile",
                          "density(p)"="density profile",
                          "S(p)"="salinity profile",
                          "spiciness(p)"="spiciness profile",
                          "T(p)"="temperature profile",
                          "hist(C)"="conductivity histogram",
                          "hist(p)"="pressure histogram",
                          "hist(S)"="salinity histogram",
                          "hist(T)"="temperature histogram"),
                selected="pressure time-series")),

                                  shiny::column(3, shiny::selectInput(inputId="colorBy",
                label="Color by",
                choices=c("distance"="distance",
                          "latitude"="latitude",
                          "longitude"="longitude",
                          "p"="pressure",
                          "T"="temperature",
                          "S"="salinity",
                          "density"="sigma0",
                          "N2"="N2",
                          "instability"="instability",
                          "oxygen",
                          "navState"="navState",
                          "tSincePowerOn"="tSincePowerOn",
                          "spiciness"="spiciness0",
                          "(none)"="(none)"),
                selected="(none)")))}

                          })

})
