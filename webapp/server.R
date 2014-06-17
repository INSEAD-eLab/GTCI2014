library(shiny)
library(XLConnect)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
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
    ISO3<-loadWorkbook("data.xlsx")
    ISO3<-readWorksheet(ISO3, sheet="Sheet1", region="B6:FO241", header=T)
    
    plot(ISO3$Political.stability, ISO3$Government.effectiveness, cex=input/10)
  })
})
