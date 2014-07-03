library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("GTCI 2014 Analytical tool"),
    
    ## dummpy variables
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
      tags$hr(),
      selectInput("enablers_variables","Variables for Enablers",  choices = c("example"), selected="example", multiple=TRUE),
      selectInput("attract_variables","Variables for Attract",  choices = c("example"), selected="example", multiple=TRUE),
      selectInput("grow_variables","Variables for Grow",  choices = c("example"), selected="example", multiple=TRUE),
      selectInput("retain_variables","Variables for Retain",  choices = c("example"), selected="example", multiple=TRUE),
      selectInput("labour_and_vocational_variables","Variables for Labour and Vocational",  choices = c("example"), selected="example", multiple=TRUE),
      selectInput("global_knowledge_variables","Variables for Global Knowledge",  choices = c("example"), selected="example", multiple=TRUE)
    ),
    
    # Show plots and results
    mainPanel(      
      tags$style(type="text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: hidden; }"
      ),
      tabsetPanel(
        
        tabPanel("Scatter Plot", 
                 selectInput("histX", "Variables for X axis :", choices = c("example"), selected="example", multiple=FALSE),
                 selectInput("histY", "Variables for Y axis :", choices = c("example"), selected="example", multiple=FALSE),
                 radioButtons("colors", "Color the data points by Regional groups :",
                              c("Yes" = 1, "No" = 0)),
                 radioButtons("shapeByRegion", "Shape by Income groups :",
                              c("Yes" = 1, "No" = 0)),
                 radioButtons("showLabels", "Show the label on data :",
                              c("none" = "\"\"", "ISO3" = "ISO3", "Country" = "Country")),
                 plotOutput("hist"),
                 HTML("<br>"),
                 textOutput("correlation"),
                 HTML("<br>"),
                 downloadButton('downloadScatter', 'Download PDF'),
                 HTML("<br>")),
        
        tabPanel("Bar Plot",                 
                 selectInput("barPlotVariables","Variables for Bar Plot : ",  choices = c("example"), selected="example", multiple=TRUE),
                 selectInput("barPlotCountries","Countries for bar Plot : ",  choices = c("example"), selected="example", multiple=TRUE),
                 plotOutput("barPlot1"),
                 downloadButton('downloadBarPlot1', 'Download PDF')),
        
        tabPanel("Chi squared test",                 
                 selectInput("ChiX", "Variables for X axis :", choices = c("example"), selected="example", multiple=FALSE),
                 sliderInput("ChiXLow", "Threshold for X variable low : ",  
                             min = 1, max = 100, value = 35),
                 sliderInput("ChiXMed", "Threshold for X variable Medium : ",  
                             min = 1, max = 100, value = 66),
                 sliderInput("ChiXHigh", "Threshold for X variable High : ",  
                             min = 1, max = 100, value = 100),
                 selectInput("ChiY", "Variables for Y axis :", choices = c("example"), selected="example", multiple=FALSE),
                 sliderInput("ChiYLow", "Threshold for Y variable low : ",  
                             min = 1, max = 100, value = 35),
                 sliderInput("ChiYMed", "Threshold for Y variable Medium : ",  
                             min = 1, max = 100, value = 66),
                 sliderInput("ChiYHigh", "Threshold for Y variable High : ",  
                             min = 1, max = 100, value = 100),
                 tableOutput("ChisquaredTest"),
                 textOutput("chiTest"),
                 plotOutput("chiXHist"),
                 plotOutput("chiYHist"))
      )
    )
))
