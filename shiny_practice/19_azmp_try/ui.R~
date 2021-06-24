library(shiny)
library(azmpdata)
library(leaflet)


#FIXME: Finish overallHelp when parameters is coded in

overallHelp <- "This GUI has two tabs,  <b> Map </b> and <b> Parameters </b>. <br><br> The <b>Map</b> tab can be used to visualize where each station, section, and area is located for the Atlantic Zone Monitoring Program (AZMP) data. Stations associated with the azmpdata dataframes are displayed in black. If the user single clicks on the station, the station name, depth, and associated dataset within the azmpdata package (if applicable) will appear. If the user single clicks on an area of station, the section or area name will appear with the associated dataset within azmpdata package if applicable. <br><br> <b> Note </b> on the Map, NAFO stands for 'Northwest Atlantic Fisheries Organization' and 'SS' stands for Scotian Shelf. <br><br> On the  <b> Parameters </b> tab,"


shinyUI(fluidPage(

                  titlePanel("GUI for azmpdata package."),
                  sidebarLayout(
                                sidebarPanel(
                                             conditionalPanel(condition="input.tabselected==1", shiny::actionButton("help", "Help"),
                                                              shiny::actionButton("code","Code")),
                                             conditionalPanel(condition="input.tabselected==2", shiny::radioButtons("type", "Select your type of parameter", choices=c("Physical", "Chemical", "Biological"), selected=c("Physical")))),
                                                          mainPanel(
tabsetPanel(type="tab",
            tabPanel("Map", value=1, leaflet::leafletOutput("map")),
            tabPanel("Parameters", value=2, plotOutput("temperature1")),
id = "tabselected")

                                                          ))))
