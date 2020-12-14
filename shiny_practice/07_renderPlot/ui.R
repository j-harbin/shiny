library(shiny)

shinyUI(fluidPage(

                  titlePanel("Demonstration of the renderPlot - a histogram"),
                  sidebarLayout(
                                sidebarPanel(
                                             radioButtons("color", "Select actions for Path of an Argo profiling float", choices=c("red", "green", "blue"), selected="red")),
                                                          mainPanel(
                                                                    plotOutput("plot")
                                                          )
                                                          )))

                                        # plotOutput() is used to display the plot
# The steps to make this work (ie. we changed the dots colors for Argo profiling floats)
# Step 1: Add radio Buttons with: radioButtons("ID", "Instructions", choices=c("End", "Start", "Profiles"), selected="Profiles")
# Step 2: In server.R we did the following:
# output$plot <- renderPlot({
# data("index")
# plot(index, col=input$color) })

# This told us that the output id was "plot", and we told it what to to when the input was a certain value.

#Step 3: in ui.R, mainPanel we plotOutput("outputID")
