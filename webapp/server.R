library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  ## function to read the data from Excel
  read_data <- reactive({
    
    ## read the excel file
    #ISO3 <- loadWorkbook("data.xlsx")
    #ISO3 <- readWorksheet(ISO3, sheet="Sheet1", region="B6:EW110", header=T)
    
    ISO3 <- read.csv("data - csv.csv")
    
    ## split the data into Text data (name, ISO3, regional and income group) 
    ## and numeric data (the rest)
    textData <- ISO3[, 1:4]
    numericData <- ISO3[, -c(1:4)]
    
    ## converting all the numeric data into numeric type
    ## because some columns are stored as char
    numericData <- apply(numericData, 1:2, function(x) as.numeric(x))
    numericData <- data.frame(numericData, stringsAsFactors=F)
    
    ## merge them to create whole dataset again
    ISO3 <- cbind(textData, numericData)
    
    ## this step is not necessary if we have whole dataset with complete income and regional groups
    ISO3[, 'Income.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Income.group']), "New Country", row['Income.group'])) 
    ISO3[, 'Region.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Regional.group']), "New Country", row['Regional.group'])) 
    
    ## updating the form fields with variable names
    updateSelectInput(session, "independent_variables", "Independent Variables",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histX", "Variables for X axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[5])
    updateSelectInput(session, "histY", "Variables for Y axis on Histogram",  choices = colnames(ISO3), selected=colnames(ISO3)[6])
    
    ## return the ISO3 data object
    ISO3
  })
  
  ## function to plot the histogram
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
    
    ## generate initial plot object
    eval(parse(text=paste("LVGK <- ggplot(data=ProjectData, aes(x=",histX,", y=",histY,", label=",input$showLabels,"))", sep = "")))
    
    ## add text, background and labels
    hist <- LVGK + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = gsub("[.]", " ",histX)) + labs(y = gsub("[.]", " ",histY))
    
    ## add colors based on input option
    if(input$colors == 1){
      hist <- hist + aes(color=Region.gp)
    }
    
    ## add shape based on input option
    if(input$shapeByRegion == 1){
      hist <- hist + geom_point(aes(shape = factor(Income.gp), alpha = .6, size=4))
    }else{
      hist <- hist + geom_point(aes(alpha = .6, size=4))
    }
    
    ## show the plot
    print(hist)
    
  })
  
  ## get the Correlation result of input variables
  correlationHist <- reactive({
    ProjectData <- read_data()
    histX <- input$histX
    histY <- input$histY
    
    cor(ProjectData[,histX], ProjectData[, histY])
  })
  
  ## output the correlation result
  output$correlation <- renderText({
    correlationResult = correlationHist()
    histX <- input$histX
    histY <- input$histY
    
    c(paste("The correlation between", gsub("[.]", " ",histX), "and", gsub("[.]", " ",histX), ":", round(correlationResult, 4), sep=" "))
  })
})
