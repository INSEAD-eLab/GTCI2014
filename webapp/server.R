library(shiny)
library(XLConnect)



# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  read_data <- reactive({
    input <- input$bins
    ISO3 <- loadWorkbook("data.xlsx")
    ISO3 <- readWorksheet(ISO3, sheet="Sheet1", region="B6:FO241", header=T)

    updateSelectInput(session, "independent_variables", "Independent Variables",  choices = colnames(ISO3), selected=colnames(ISO3)[3])
    updateSelectInput(session, "variables_for_hist", "Variables for Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[3])
    
    
    ISO3
  })
  
  output$Variables <- renderUI({
    ISO3 <- read_data()
    selectInput("xrow", "Facility" , choices=colnames(ISO3), selected=colnames(ISO3)[1], multiple=TRUE)
  })
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should
  #     re-execute automatically when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({

    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'skyblue', border = 'white')
  })
  
  ## reading from data excel sheet and ploting the graph.
  output$hist <- renderPlot({
    input <- input$bins
    #variable_for_hists <- input$variables_for_hist
    ISO3 <- read_data()
    
    plot(ISO3$Political.stability, ISO3$Political.stability, cex=input/10)
  })
})
