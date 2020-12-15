#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- shinyServer(function(input, output) {
        #Report which country value set used
        country <- reactive({
                co <- if(input$country == 1) {
                        "UK"
                }
                else if(input$country == 2) {
                        "USA"
                }
                else{
                        "Canada"
                }
                co
        })
        
        output$country <- renderText(paste(
                "The following outputs are estimated using the value set for",
                country(),
                "."
        ))
        
        #import dimension scores
        scores <- reactive({
                MO <- as.numeric(input$mobility)
                SC <- as.numeric(input$selfcare)
                UA <- as.numeric(input$activities)
                PD <- as.numeric(input$pain)
                AD <- as.numeric(input$anxiety)
                score <- data.frame(MO=MO,SC=SC,UA=UA,PD=PD,AD=AD)
                score
        })
        
        dim_scores <- reactive({
                MO <- as.numeric(input$mobility)
                SC <- as.numeric(input$selfcare)
                UA <- as.numeric(input$activities)
                PD <- as.numeric(input$pain)
                AD <- as.numeric(input$anxiety)
                dim_scores <- paste(MO,SC,UA,PD,AD)
                dim_scores
        })
        
        output$dims <- renderText({
                dim_scores()
        })
        
        #Import self-reported overall health today
        output$scale <- renderText({
                input$VAS
        })
        
        #Calculate EQ-5D index score using VAS approach
        
        VAS <- reactive({
                v <- eq5d(scores(), version="3L",type="VAS", country=country(),ignore.invalid=TRUE)
                v
        })
        
        output$VAS <- renderText({
                VAS()
        })
        
        #Calculate EQ-5D index score using TTO approach
        
        TTO <- reactive({
   
                tto <- eq5d(scores(), version="3L",type="TTO", country=country(),ignore.invalid = TRUE)
                tto
        })
        
        output$TTO <- renderText ({
                TTO()
        })
        
        
})

server
