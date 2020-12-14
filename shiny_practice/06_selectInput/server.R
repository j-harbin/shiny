library(argoFloats)

shinyServer(function(input, output){
                output$state <- renderText(input$statenames)
})
