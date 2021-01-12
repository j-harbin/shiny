library(argoFloats)

shinyServer(function(input, output){
                output$plot <- renderPlot({
                    data("index")
                    plot(index, col=input$color) })
                output$not <- renderPlot({
                    plot(1:10, col=input$color, pch=input$pch)
                })
})

# we make our plot reactive with renderPlot
