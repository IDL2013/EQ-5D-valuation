#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(eq5d)

value <- as.data.frame(valuesets())

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("EQ-5D utility calculator"),
  
  #horizontal line
  tags$hr(),
  
  tabsetPanel(
          tabPanel("Background info",
                   h4("Overview"),
                   br(),
                   p("This app has been created as part of an assignment for the 'Developing Data Products' module of the John Hopkins Data Science specialisation."),
                   p("It takes some key input data and responses to the EuroQoL EQ-5D questionnaire (www.euroqol.com), and calculates the associated utility value based on the corresponding country value set"),
                   br(),
                   selectInput("country", h5("Please select your home country"), 
                               choices = list("United Kingdom"=1,"USA"=2, "Canada"=3), selected = 1)),
                   
          tabPanel("EQ-5D inputs", 
                   h4("By placing a tick in one box in each group below, please indicate which statements best describe your own health today"),
                   br(),
                   br(),
                   radioButtons("mobility", h5("Mobility"),
                                choices = list("I have no problems in walking about" = 1, "I have some problems in walking about" = 2,
                                               "I am confined to bed" = 3),selected = 1),
                   br(),
                   radioButtons("selfcare",h5("Self-care"),
                                choices = list("I have no problems with self-care"=1, "I have some problems washing or dressing myself"=2, 
                                               "I am unable to wash or dress myself"=3),selected=1),
                   br(),
                   radioButtons("activities",h5("Usual Activities (e.g. work, study, housework, family or leisure activities"),
                                choices=list("I have no problems with performing my usual activities"=1,"I have some problems with performing my usual activities"=2, "I am unable to perform my usual activities"=3),
                                selected=1),
                   br(),
                   radioButtons("pain",h5("Pain/Discomfort"),
                                choices=list("I have no pain or discomfort"=1, "I have moderate pain or discomfort"=2, "I have extreme pain or discomfort"=3),
                                selected=1),
                   br(),
                   radioButtons("anxiety",h5("Anxiety/Depression"),
                                choices=list("I am not anxious or depressed"=1,"I am moderately anxious or depressed"=2,"I am extremely anxious or depressed"=3),
                                selected=1),
                   br(),
                   p("Source: adapted from the EuroQOL group: www.euroqol.org")),
          tabPanel("Rating scale",
                   h5("Visual Analogue Scale"),
                   p("To help people say how good or bad a health state is, we have drawn a scale on which the best state you can imagine is marked 100 and the worst state you can imagine is marked 0"),
                   br(),
                   p("We would like you to indicate on this scale how good or bad your own health is today, in your opinion. Please do this by moving the slider to whichever value indicates how good or bad your health state is today."),
                   br(),
                   fluidRow(
                           column(12,sliderInput("VAS",h5("Your own health state today"),
                               min = 0, max = 100, value = 50)
                   ))),
          tabPanel("Outputs",
                   br(),
                   textOutput("country"),
                   br(),
                   br(),
                   h5("Your reported dimension scores are:"),
                   textOutput("dims"),
                   br(),
                   h5("You rated your health today as:"),
                   textOutput("scale"),
                   br(),
                   h5("Your expected utility using VAS valuation is:"),
                   textOutput("VAS"),
                   br(),
                   h5("Your expected utility using the time trade-off value set is:"),
                   textOutput("TTO")
                   ))
                   
                   
                   
  ))
  
ui