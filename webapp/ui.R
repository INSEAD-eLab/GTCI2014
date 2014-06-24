library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("GTCI 2014 Analytical tool"),
    
    ## dummpy variables
    sidebarPanel(
      selectInput("independent_variables","Independent Variables",  choices = c("Independent Variables"), selected="Independent Variables", multiple=TRUE)
    ),
    
    # Show plots and results
    mainPanel(      
      tabsetPanel(
        
        tabPanel("Scatter Plot", 
                 selectInput("histX", "Variables for X axis :", choices = c("Independent Variables"), selected="Independent Variables", multiple=FALSE),
                 selectInput("histY", "Variables for Y axis :", choices = c("Independent Variables"), selected="Independent Variables", multiple=FALSE),
                 radioButtons("colors", "Color the data points by Regional groups :",
                              c("Yes" = 1,
                                "No" = 0
                                )),
                 radioButtons("shapeByRegion", "Shape by Income groups :",
                              c("Yes" = 1,
                                "No" = 0
                              )),
                 radioButtons("showLabels", "Show the label on data :",
                              c("none" = "\"\"",
                                "ISO3" = "ISO3",
                                "Country" = "Country"
                              )),
                 plotOutput("hist"),
                 HTML("<br>"),
                 textOutput("correlation"),
                 HTML("<br>"),
                 downloadButton('downloadScatter', 'Download scatter plot')),
        
        tabPanel("Dist Plot", 
                 sliderInput("bins", "Size of points :", min = 1, max = 10, value = 3),
                 plotOutput("distPlot"))
      )
    )
))
