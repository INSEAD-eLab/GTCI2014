library(shiny)
library(XLConnect)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  read_data <- reactive({
    
    ISO3 <- loadWorkbook("data.xlsx")
    ISO3 <- readWorksheet(ISO3, sheet="Sheet1", region="B6:EW110", header=T)
    
    ISO3$color <- 'c'
    
    for(i in 1:104){
      if(is.na(ISO3[i,'Income.group'])){
        ISO3[i,'color'] <- colors()[179]
      }else if(ISO3[i,'Income.group'] == 'High income'){
        ISO3[i,'color'] <- colors()[563]
      }else if(ISO3[i,'Income.group'] == 'Upper middle income'){
        ISO3[i,'color'] <- colors()[224]
      }else if(ISO3[i,'Income.group'] == 'Lower middle income'){
        ISO3[i,'color'] <- colors()[26]
      }else if(ISO3[i,'Income.group'] == 'Low income'){
        ISO3[i,'color'] <- colors()[179]
      }
    }

    updateSelectInput(session, "independent_variables", "Independent Variables",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histX", "Variables for X axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histY", "Variables for Y axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[6])
    
    ISO3
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
    
    inputbins <- input$bins
    histX <- input$histX
    histY <- input$histY
    ProjectData <- read_data()
    
    eval(parse(text=paste("LVGK <- ggplot(data=ProjectData, aes(x=",histX,", y=",histY,", label=ISO3))", sep = "")))
    
    if(input$colors == 1){
      LVGK + geom_point(color=ProjectData$color, shape = 16, size=inputbins ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = gsub("[.]", " ",histX)) + labs(y = gsub("[.]", " ",histY))
    }else{
      LVGK + geom_point(shape = 16, size=inputbins ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = gsub("[.]", " ",histX)) + labs(y = gsub("[.]", " ",histY))  
    }
    
    
  })
})
