library(shiny)
library(XLConnect)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  titlePanel("Hello World!"),
  
  # Sidebar with a slider input for the number of bins
  #sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30),
      sidebarPanel( uiOutput("Variables") ),
      HTML("<hr>"),
      selectInput("independent_variables","Independent Variables",  choices = c("Independent Variables"), selected="Independent Variables", multiple=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(      
      tabsetPanel(
        tabPanel("Dist Plot",                  
                 plotOutput("distPlot")),
        tabPanel("Hist Plot", 
                 selectInput("variables_for_hist", "Variables for Histogram", choices = c("Independent Variables"), selected="Independent Variables", multiple=FALSE),
                 plotOutput("hist"))
      )
      
      
      
      
    )
 # )
))
