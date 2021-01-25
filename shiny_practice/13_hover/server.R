 server =
 function(input, output, session) {
   output$uiExample <- renderUI({
     tags$span(tipify(bsButton("pB2", "Button", style = "inverse", size = "extra-small"),
         "YYYY-MM-DD")
     )
   })
 }
