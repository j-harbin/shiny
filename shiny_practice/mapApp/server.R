library(shiny)
shinyServer(function(input, output){
                output$plot <- renderPlot({
                    data("index")
                    plot(index, col=input$color) })
})

