library(argoFloats)

shinyServer(function(input, output){
                output$out <- renderText(
                paste("You selected the value: ", input$slide))
})
# when it is empty, were not doing any computation
