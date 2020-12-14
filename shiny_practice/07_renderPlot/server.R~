library(argoFloats)

shinyServer(function(input, output){
                output$plot <- renderPlot({
                    data("index")
                    plot(index, col=input$color) })
})

# we make our plot reactive with renderPlot
