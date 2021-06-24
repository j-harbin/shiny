library(shiny)
library(azmpdata)
library(leaflet)


#FIXME: Finish overallHelp when parameters is coded in

overallHelp <- "This GUI has two tabs,  <b> Map </b> and <b> Parameters </b>. <br><br> The <b>Map</b> tab can be used to visualize where each station, section, and area is located for the Atlantic Zone Monitoring Program (AZMP) data. Stations associated with the azmpdata dataframes are displayed in black. If the user single clicks on the station, the station name, depth, and associated dataset within the azmpdata package (if applicable) will appear. If the user single clicks on an area of station, the section or area name will appear with the associated dataset within azmpdata package if applicable. <br><br> <b> Note </b> on the Map, NAFO stands for 'Northwest Atlantic Fisheries Organization' and 'SS' stands for Scotian Shelf. <br><br> On the  <b> Parameters </b> tab,"




shinyUI <- fluidPage(

                  titlePanel("GUI for azmpdata package."),
                  sidebarLayout(
                                sidebarPanel(
                                             conditionalPanel(condition="input.tabselected==1", shiny::actionButton("help", "Help"),
                                                              shiny::actionButton("code","Code")),
                                             conditionalPanel(condition="input.tabselected==2", shiny::radioButtons("type", "Select your type of parameter", choices=c("Physical", "Chemical", "Biological"), selected=c("Physical"))),
                                             conditionalPanel(condition="input.tabselected==2 && \"Physical\" == input.type",
                                                               shiny::selectInput("physical","Physical Analysis", choices=c("Temperature","Salinity"), selected=NULL)),
                                             
                                             conditionalPanel(condition="input.tabselected==2 && \"Chemical\" == input.type",
                                                              shiny::selectInput("chemical", "Chemical Analysis", choices=c("Nitrate", "Silicate","Phosphate"), selected="Nitrate")),
                                             
                                             conditionalPanel(condition="input.tabselected==2 && \"Biological\" == input.type",
                                                              shiny::selectInput("biological", "Biolgical Analysis", choices=c("Chlorophyll", "Phytoplankton abundance","Zooplankton abundance", "Zooplankton biomass"), selected="Chlorophyll")
)),
                                                          mainPanel(
tabsetPanel(type="tab",
            tabPanel("Map", value=1, leaflet::leafletOutput("map")),
            tabPanel("Parameters", value=2),
id = "tabselected"),

                                                                    conditionalPanel(condition="input.tabselected==2 && input.type == \"Physical\" && \"Temperature\" == input.physical",
                                                                                     plotOutput("temperature1"),
                                                                                     plotOutput("temperature2"),
                                                                                     plotOutput("temperature3")

                                                                                     ),
                                                                    conditionalPanel(condition="input.tabselected==2 && input.type == \"Physical\" && \"Salinity\" == input.physical",
                                                                                     plotOutput("salinity1"),
                                                                                     plotOutput("salinity2"),
                                                                                     plotOutput("salinity3")

                                                                                     ),

                                                                    conditionalPanel(condition="input.tabselected == 2 && input.type == \"Chemical\" && \"Nitrate\" == input.chemical",
                                                                                     plotOutput("nitrate1"),
                                                                                     plotOutput("nitrate2")
                                                                                     ),
                                                                      conditionalPanel(condition="input.tabselected == 2 && input.type == \"Chemical\" && \"Silicate\" == input.chemical",
                                                                                     plotOutput("silicate1"),
                                                                                     plotOutput("silicate2")
                                                                                     ),
                                                                    conditionalPanel(condition="input.tabselected == 2 && input.type == \"Chemical\" && \"Phosphate\" == input.chemical",
                                                                                     plotOutput("phosphate1"),
                                                                                     plotOutput("phosphate2")
                                                                                     ),
                                                                    conditionalPanel(condition="input.tabselected == 2 && input.type == \"Biological\" && \"Chlorophyll\" == input.biological",
                                                                                     plotOutput("chloro1"),
                                                                                     plotOutput("chloro2")
                                                                                     )


                                                          )))


shinyServer <- shiny::shinyServer(function(input, output){
                output$map <- renderLeaflet({
                    azmpdata::azmpmap()
                   })

                    output$temperature1 <- renderPlot({
                            plot(Discrete_Annual_Broadscale$year, Discrete_Annual_Broadscale$sea_temperature,xlab= "Year", ylab="Broadscale Annual Sea Temperature (C)", pch=20, type='o', main="Discrete Annual Broadscale Temperature Analysis")
                            regression <- lm(Discrete_Annual_Broadscale$sea_temperature ~ Discrete_Annual_Broadscale$year)
                            abline(regression, h=50, col='red')
                    })

                shiny::observeEvent(input$help,
                                    {
                                        msg <- shiny::HTML(overallHelp)
                                        shiny::showModal(shiny::modalDialog(shiny::HTML(msg), title="Using this application", size="l"))
                                    })

                output$temperature2 <- renderPlot({
                    library(azmpdata)
                    #unique(Discrete_Occupations_Sections$section)
                    # CSL
                    CSLt <- Discrete_Occupations_Sections$temperature[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
                    CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
                    ## LL
                    LLt <- Discrete_Occupations_Sections$temperature[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
                    LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
                    ## HL
                    HLt <- Discrete_Occupations_Sections$temperature[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
                    HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
                    #BBL
                    BBLt <- Discrete_Occupations_Sections$temperature[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
                    BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

                    plot(LLt,LLd, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLt,LLt, HLt, BBLt, na.rm=TRUE), xlab = "Temperature (C)", ylab="Depth", pch=20, type="p", main="Occupations Sections Temperature")
                    points(HLt, HLd, pch=20, col="red")
                    points(BBLt, BBLd, pch=20, col="green")
                    points(CSLt, CSLd, pch=20, col="blue")
                    legend("bottomright", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))
                })

                output$temperature3 <- renderPlot({
                    #unique(Discrete_Occupations_Stations$station)
                    #HL2
                    HL2t <- Discrete_Occupations_Stations$sea_temperature[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5t <- Discrete_Occupations_Stations$sea_temperature[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2t,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2t, P5t, na.rm=TRUE), xlab = "Temperature (C)", ylab="Depth", pch=20, type="p", main="Occupations Stations Temperature")
                    points(P5t, P5d, pch=20, col="red")
                    legend("bottomright", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))
                  })

                output$salinity1 <- renderPlot({
                    plot(Discrete_Annual_Broadscale$year, Discrete_Annual_Broadscale$salinity,xlab= "Year", ylab="Broadscale Annual Salinity", pch=20, type='o', main="Discrete Annual Broadscale Salinity Analysis")
                    regression <- lm(Discrete_Annual_Broadscale$salinity ~ Discrete_Annual_Broadscale$year)
                    abline(regression, h=50, col='red')
                })


                output$salinity2 <- renderPlot({
                    CSLs <- Discrete_Occupations_Sections$salinity[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
                    CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
                    ## LL
                    LLs <- Discrete_Occupations_Sections$salinity[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
                    LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
                    ## HL
                    HLs <- Discrete_Occupations_Sections$salinity[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
                    HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
                    #BBL
                    BBLs <- Discrete_Occupations_Sections$salinity[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
                    BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

                    plot(LLs,LLd, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLs,LLs, HLs, BBLs, na.rm=TRUE), xlab = "Salinity (C)", ylab="Depth", pch=20, type="p", main="Occupations Sections Salinity")
                    points(HLs, HLd, pch=20, col="red")
                    points(BBLs, BBLd, pch=20, col="green")
                    points(CSLs, CSLd, pch=20, col="blue")
                    legend("bottomleft", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))
                })


                output$salinity3 <- renderPlot({
                    #unique(Discrete_Occupations_Stations$station)
                    #HL2
                    HL2s <- Discrete_Occupations_Stations$salinity[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5s <- Discrete_Occupations_Stations$salinity[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2s,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2s, P5s, na.rm=TRUE), xlab = "Salinity", ylab="Depth", pch=20, type="p", main="Occupations Stations Salinity")
                    points(P5s, P5d, pch=20, col="red")
                    legend("bottomleft", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))
                })


                output$nitrate1 <- renderPlot({
                    CSLn <- Discrete_Occupations_Sections$nitrate[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
## LL
LLn <- Discrete_Occupations_Sections$nitrate[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
## HL
HLn <- Discrete_Occupations_Sections$nitrate[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
#BBL
BBLn <- Discrete_Occupations_Sections$nitrate[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

plot(LLn,LLn, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLn,LLn, HLn, BBLn, na.rm=TRUE), xlab = "Nitrate", ylab="Depth", pch=20, type="p", main="Occupations Sections Nitrate")
points(HLn, HLd, pch=20, col="red")
points(BBLn, BBLd, pch=20, col="green")
points(CSLn, CSLd, pch=20, col="blue")
legend("bottomleft", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))
                  })
                

                output$nitrate2 <- renderPlot({
                    #HL2
                    HL2n <- Discrete_Occupations_Stations$nitrate[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5n <- Discrete_Occupations_Stations$nitrate[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2n,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2n, P5n, na.rm=TRUE), xlab = "Nitrate", ylab="Depth", pch=20, type="p", main="Occupations Stations Nitrate")
                    points(P5n, P5d, pch=20, col="red")
                    legend("bottomleft", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))

                })


                 output$silicate1 <- renderPlot({
                    CSLsi <- Discrete_Occupations_Sections$silicate[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
## LL
LLsi <- Discrete_Occupations_Sections$silicate[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
## HL
HLsi <- Discrete_Occupations_Sections$silicate[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
#BBL
BBLsi <- Discrete_Occupations_Sections$silicate[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

plot(LLsi,LLd, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLsi,LLsi, HLsi, BBLsi, na.rm=TRUE), xlab = "Silicate", ylab="Depth", pch=20, type="p", main="Occupations Sections Silicate")
points(HLsi, HLd, pch=20, col="red")
points(BBLsi, BBLd, pch=20, col="green")
points(CSLsi, CSLd, pch=20, col="blue")
legend("bottomleft", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))
                  })
                

                output$silicate2 <- renderPlot({
                    #HL2
                    HL2si <- Discrete_Occupations_Stations$silicate[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5si <- Discrete_Occupations_Stations$silicate[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2si,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2si, P5si, na.rm=TRUE), xlab = "Silicate", ylab="Depth", pch=20, type="p", main="Occupations Stations Silicate")
                    points(P5si, P5d, pch=20, col="red")
                    legend("bottomleft", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))

                })


                 output$phosphate1 <- renderPlot({
                    CSLph <- Discrete_Occupations_Sections$phosphate[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
## LL
LLph <- Discrete_Occupations_Sections$phosphate[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
## HL
HLph <- Discrete_Occupations_Sections$phosphate[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
#BBL
BBLph <- Discrete_Occupations_Sections$phosphate[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

plot(LLph,LLd, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLph,LLph, HLph, BBLph, na.rm=TRUE), xlab = "Phosphate", ylab="Depth", pch=20, type="p", main="Occupations Sections Phosphate")
points(HLph, HLd, pch=20, col="red")
points(BBLph, BBLd, pch=20, col="green")
points(CSLph, CSLd, pch=20, col="blue")
legend("bottomleft", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))
                  })
                

                output$phosphate2 <- renderPlot({
                    #HL2
                    HL2ph <- Discrete_Occupations_Stations$phosphate[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5ph <- Discrete_Occupations_Stations$phosphate[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2ph,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2ph, P5ph, na.rm=TRUE), xlab = "Silicate", ylab="Depth", pch=20, type="p", main="Occupations Stations Phosphate")
                    points(P5ph, P5d, pch=20, col="red")
                    legend("bottomleft", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))

                })

                 output$chloro1 <- renderPlot({
                     # CSL
CSLc <- Discrete_Occupations_Sections$chlorophyll[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
CSLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("CSL1",  "CSL2",  "CSL3",  "CSL4",  "CSL5",  "CSL6"))]
## LL
LLc <- Discrete_Occupations_Sections$chlorophyll[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
LLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("LL1",   "LL2",   "LL4",   "LL5",   "LL6", "LL7",   "LL8",  "LL3",   "LL9"))]
## HL
HLc <- Discrete_Occupations_Sections$chlorophyll[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
HLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("HL1","HL2","HL3", "HL4", "HL5", "HL6","HL7","HL5.5", "HL3.3", "HL6.3", "HL6.7"))]
#BBL
BBLc <- Discrete_Occupations_Sections$chlorophyll[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]
BBLd <- Discrete_Occupations_Sections$depth[which(Discrete_Occupations_Sections$station %in% c("BBL1","BBL2", "BBL3","BBL4","BBL5","BBL6","BBL7"))]

plot(LLc,LLd, ylim=rev(range(CSLd,LLd, HLd, BBLd, na.rm=TRUE)), xlim=range(CSLc,LLc, HLc, BBLc, na.rm=TRUE), xlab = "Chlorophyll", ylab="Depth", pch=20, type="p", main="Occupations Sections Chlorophyll")
points(HLc, HLd, pch=20, col="red")
points(BBLc, BBLd, pch=20, col="green")
points(CSLc, CSLd, pch=20, col="blue")
legend("bottomright", c("LL", "HL", "BBL", "CSL"), pch=c(20,20,20,20), col=c("black", "red", "green", "blue"))

                })

                output$chloro2 <- renderPlot({
                    #HL2
                    HL2c <- Discrete_Occupations_Stations$chlorophyll[which(Discrete_Occupations_Stations$station == "HL2")]
                    HL2d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "HL2")]
                    # P5
                    P5c <- Discrete_Occupations_Stations$chlorophyll[which(Discrete_Occupations_Stations$station == "P5")]
                    P5d <- Discrete_Occupations_Stations$depth[which(Discrete_Occupations_Stations$station == "P5")]
                    plot(HL2c,HL2d, ylim=rev(range(HL2d,P5d, na.rm=TRUE)), xlim=range(HL2c, P5c, na.rm=TRUE), xlab = "Chlorophyll", ylab="Depth", pch=20, type="p", main="Occupations Stations Chlorophyll")
                    points(P5c, P5d, pch=20, col="red")
                    legend("bottomright", c("HL2", "P5"), pch=c(20,20), col=c("black", "red"))


                })




                  })


variable_lookup <- function()
{
    if (!requireNamespace("shiny", quietly=TRUE))
        stop("must install.packages(\"shiny\") for this to work")
    print(shiny::shinyApp(ui=shinyUI, server=shinyServer))
}


