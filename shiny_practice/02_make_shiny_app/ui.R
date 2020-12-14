library(shiny)

shinyUI(fluidPage(

                 titlePanel(title= "This is my first shiny app, hello shiny!"),
                 sidebarLayout(position="right",
                               sidebarPanel(h3("This is side bar panel"), h4("widget4"), h5("widget5")),
                               mainPanel(h4("This is the main panel text, output is displayed here"), h5("This is the output 5"))
                 )
)
)


# The h4, h5 etc. means it is heading 4 and heading 5, etc.
