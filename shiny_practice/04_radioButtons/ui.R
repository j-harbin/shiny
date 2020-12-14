library(shiny)

shinyUI(fluidPage(
        titlePanel("Demonstration of textInput widget in shiny"),
        sidebarLayout(
                      sidebarPanel(("Enter the personal information"),
                                   textInput("name", "Enter your name",""),
                                             textInput("age", "Enter your age", ""),
                      radioButtons("gender","Select the gender", list("Male","Female"), "")),
                                   mainPanel(("Personal Information"),
                                   textOutput("myname"),
                                   textOutput("myage"),
                                   textOutput("mygender")
                      )
                      )))

# radioButton, first arg = ID, section = text above, third= options, fourth = default




# The steps of this is you put the TextInput or radioButtons in the ui (this is setting up the ID name), you then go over to server.R and use the input ID to create the output ID. Then come back over to ui.R to use tectOutput using the output ID from server.R
