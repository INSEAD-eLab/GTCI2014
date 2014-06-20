library(shiny)
library(XLConnect)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  titlePanel("Hello World!"),
  
  # Sidebar with a slider input for the number of bins
  #sidebarLayout(
    sidebarPanel(
      selectInput("independent_variables","Independent Variables",  choices = c("Independent Variables"), selected="Independent Variables", multiple=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(      
      tabsetPanel(
        
        tabPanel("Hist Plot", 
                 selectInput("histX", "Variables for X axis on Histogram :", choices = c("Independent Variables"), selected="Independent Variables", multiple=FALSE),
                 selectInput("histY", "Variables for Y axis on Histogram :", choices = c("Independent Variables"), selected="Independent Variables", multiple=FALSE),
                 radioButtons("colors", "Color the data points by Regional groups :",
                              c("Yes" = 1,
                                "No" = 0
                                )),
                 radioButtons("shapeByRegion", "Shape by Income groups :",
                              c("Yes" = 1,
                                "No" = 0
                              )),
                 radioButtons("showLabels", "Show the label on histogram :",
                              c("none" = "\"\"",
                                "ISO3" = "ISO3",
                                "Country" = "Country"
                              )),
                 plotOutput("hist"),
                 HTML("<br>"),
                 textOutput("correlation"),
                 HTML("<br>")),
        
        tabPanel("Dist Plot", 
                 sliderInput("bins", "Size of points :", min = 1, max = 10, value = 3),
                 plotOutput("distPlot"))
      )
      
      
      
      
    )
 # )
))
