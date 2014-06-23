library(shiny)
library(XLConnect)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  read_data <- reactive({
    
    ISO3 <- loadWorkbook("data.xlsx")
    ISO3 <- readWorksheet(ISO3, sheet="Sheet1", region="B6:EW110", header=T)
    
    textData <- ISO3[, 1:4]
    numericData <- ISO3[, -c(1:4)]
    
    numericData <- apply(numericData, 1:2, function(x) as.numeric(x))
    numericData <- data.frame(numericData, stringsAsFactors=F)
    
    ISO3 <- cbind(textData, numericData)
    
    ISO3[, 'Income.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Income.group']), "New Country", row['Income.group'])) 
    ISO3[, 'Region.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Regional.group']), "New Country", row['Regional.group'])) 
    
    updateSelectInput(session, "independent_variables", "Independent Variables",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histX", "Variables for X axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histY", "Variables for Y axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[6])
    
    ISO3
  })
    
  output$distPlot <- renderPlot({

    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'skyblue', border = 'white')
  })
  
  ## reading from data excel sheet and ploting the graph.
  output$hist <- renderPlot({
    histX <- input$histX
    histY <- input$histY
    ProjectData <- read_data()
    
    eval(parse(text=paste("LVGK <- ggplot(data=ProjectData, aes(x=",histX,", y=",histY,", label=",input$showLabels,"))", sep = "")))
    
    hist <- LVGK + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = gsub("[.]", " ",histX)) + labs(y = gsub("[.]", " ",histY))
    
    if(input$colors == 1){
      hist <- hist + aes(color=Region.gp)
    }
    
    if(input$shapeByRegion == 1){
      hist <- hist + geom_point(aes(shape = factor(Income.gp), alpha = .6, size=4))
    }else{
      hist <- hist + geom_point(aes(alpha = .6, size=4))
    }
    
    print(hist)
    
  })
  
  correlationHist <- reactive({
    ProjectData <- read_data()
    histX <- input$histX
    histY <- input$histY
    
    cor(ProjectData[,histX], ProjectData[, histY])
  })
  
  output$correlation <- renderText({
    correlationResult = correlationHist()
    histX <- input$histX
    histY <- input$histY
    
    c(paste("The correlation between", gsub("[.]", " ",histX), "and", gsub("[.]", " ",histX), ":", round(correlationResult, 4), sep=" "))
  })
})
