## vim:textwidth=128:expandtab:shiftwidth=4:softtabstop=4

##cacheAge <- 5                          # a global variable
col <- list(core=7, bgc=3, deep=6)

## Start and end times, covering 21 days to usually get 2 cycles
endTime <- as.POSIXlt(Sys.time())
startTime <- as.POSIXlt(endTime - 10 * 86400)


#' @importFrom grDevices grey
#' @importFrom graphics arrows image lines mtext

uiMapApp <- shinyUI(fluidPage(
                              titlePanel("mapApp: GUI for viewing Argo profiling float positions"),
                              sidebarLayout(
                                        # Creating actionButtons
                                            sidebarPanel(actionButtons("help","code","goW","goN","goS", "goE", "zoomIn", "zoomOut")),
                                        #Creating textInput
                                            textInput("start", "Start", value=sprintf("%4d-%02d-%02d", startTime$year + 1900, startTime$mon + 1, startTime$mday)),
                                            textInput("end", "End", value=sprintf( "%4d-%02d-%02d", endTime$year + 1900, endTime$mon + 1, endTime$mday)),
                                        # Creating checkboxGroupInput
                                            checkboxGroupInput("view",
                                                               label="View",
                                                               choiceNames=list(shiny::tags$span("Core", style="color:#F5C710; font-weight:bold"),
                                                                                shiny::tags$span("Deep", style="color:#CD0BBC; font-weight:bold"),
                                                                                shiny::tags$span("BGC", style="color:#61D04F; font-weight:bold"),
                                                                                shiny::tags$span("HiRes", style="color: black;"),
                                                                                shiny::tags$span("Topo", style="color: black;"),
                                                                                shiny::tags$span("Profiles", style="color: black;")),
                                                               choiceValues=list("core",
                                                                                 "deep",
                                                                                 "bgc",
                                                                                 "hires",
                                                                                 "topo",
                                                                                 "profiles"),
                                                               selected=c("core", "deep", "bgc", "profiles"),
                                                               inline=TRUE)),
                    mainPanel(
                              plotOutput("plot")
                              )))
