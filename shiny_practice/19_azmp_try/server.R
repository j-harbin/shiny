shinyServer(function(input, output){
                output$map <- renderLeaflet({
                    azmpdata::azmpmap()
                   })
                output$parameters <- renderPlot({
                    plot(1:10, col=input$color, pch=input$pch)
                })
})

# we make our plot reactive with renderPlot
