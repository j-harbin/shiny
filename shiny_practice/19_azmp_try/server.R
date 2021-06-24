
#FIXME: Finish overallHelp when parameters is coded in

overallHelp <- "This GUI has two tabs,  <b> Map </b> and <b> Parameters </b>. <br><br> The <b>Map</b> tab can be used to visualize where each station, section, and area is located for the Atlantic Zone Monitoring Program (AZMP) data. Stations associated with the azmpdata dataframes are displayed in black. If the user single clicks on the station, the station name, depth, and associated dataset within the azmpdata package (if applicable) will appear. If the user single clicks on an area of station, the section or area name will appear with the associated dataset within azmpdata package if applicable. <br><br> <b> Note </b> on the Map, NAFO stands for 'Northwest Atlantic Fisheries Organization' and 'SS' stands for Scotian Shelf. <br><br> On the  <b> Parameters </b> tab,"

shinyServer(function(input, output){
                output$map <- renderLeaflet({
                    azmpdata::azmpmap()
                   })

                output$temperature1 <- renderPlot({
                    output$temperature1 <- renderPlot({
                            plot(Discrete_Annual_Broadscale$year, Discrete_Annual_Broadscale$sea_temperature,xlab= "Year", ylab="Broadscale Annual Sea Temperature (C)", pch=20, type='o', main="Discrete Annual Broadscale Temperature Analysis")
                            regression <- lm(Discrete_Annual_Broadscale$sea_temperature ~ Discrete_Annual_Broadscale$year)
                            abline(regression, h=50, col='red')
                    })
                })

                shiny::observeEvent(input$help,
                                    {
                                        msg <- shiny::HTML(overallHelp)
                                        shiny::showModal(shiny::modalDialog(shiny::HTML(msg), title="Using this application", size="l"))
                                    })
})

