library(shiny)
library(ggplot2)
library(reshape2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  ## function to read the data from Excel
  read_data <- reactive({
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
    
    inFile <- input$file1
    
    if (is.null(inFile)){
      #if inFile is not assigned, read the internal data
      ISO3 <- read.csv("2014 06 25 GTCI.csv")
    }else{
      #if inFile is assigned, read from the uploaded csv file
      ISO3 <- read.csv(inFile$datapath, header=TRUE)  
    }
    
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
    updateSelectInput(session, "enablers_variables", "Variables for Enablers",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[5])
    updateSelectInput(session, "attract_variables", "Variables for Attract",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[21])
    updateSelectInput(session, "grow_variables", "Variables for Grow",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[36])
    updateSelectInput(session, "retain_variables", "Variables for Retain",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[36])
    updateSelectInput(session, "labour_and_vocational_variables", "Variables for Labour and Vocational",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[36])
    updateSelectInput(session, "global_knowledge_variables", "Variables for Global Knowledge",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[36])
    
    ## updating the form from Scatter plot with 2 variable names
    updateSelectInput(session, "histX", "Variables for X axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[5])
    updateSelectInput(session, "histY", "Variables for Y axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[6])
    
    ## updating the form from Bar plot with variable names and country names
    updateSelectInput(session, "barPlotVariables", "Variables for Bar Plot : ",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[6])
    updateSelectInput(session, "barPlotCountries", "Countries for Bar Plot : ",  choices = ISO3$Country , selected=ISO3$Country[1])
    
    ## updating the form from chi squared test with variable names
    updateSelectInput(session, "ChiX", "Variables for X axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[6])
    updateSelectInput(session, "ChiY", "Variables for Y axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[7])
    
    ## return the ISO3 data object
    ISO3
  })
  
  ## function to gemerate scatter plot
  getScatterPlot <- function(ProjectData, histX, histY){
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
    
    hist
  }
  
  ## reading from data excel sheet and ploting the graph.
  output$hist <- renderPlot({
    histX <- input$histX
    histY <- input$histY
    ProjectData <- read_data()
    
    ## call the function to plot
    hist <- getScatterPlot(ProjectData, histX, histY)
    
    ## show the plot
    print(hist)
    
  })
  
  ## getting data for bar plot 1
  getBarPlot1Data <- reactive({
    countries <- input$barPlotCountries
    variables <- input$barPlotVariables
    
    ## get the whole data
    ProjectData <- read_data()
    
    ## get the subset of the data
    dataforplot <- ProjectData[ProjectData$Country %in% countries, variables]
    dataforplot[, "Country"] <- countries
    
    #change the data format to plot
    dataforplot1 <- melt(dataforplot, variable.name="Variable", value.name="Score")
    dataforplot1$Variable <- apply(dataforplot1, 1, function(row) gsub("[.]", " ",row['Variable']))
    #colnames(dataforplot1) <- c("Country", "Variable", "Score")
    
    dataforplot1
  })
  
  ## function to generate a bar plot
  getBarPlot1 <- function(dataforplot1){
    ## need to make sure the variable names are correct
    ggplot(dataforplot1, aes(Country, Score, fill=Variable)) + geom_bar(stat="identity",position="dodge") + theme_bw()
  }
  
  ## plotting bar plot 1
  output$barPlot1 <- renderPlot({
    ## get the data for bar plot 1
    dataforplot1 <- getBarPlot1Data()
    
    ## get the plot generated by a function
    barplot1 <- getBarPlot1(dataforplot1)
    
    print(barplot1)    
  })
  
  ## get the Correlation result of input variables
  correlationHist <- reactive({
    ProjectData <- read_data()
    histX <- input$histX
    histY <- input$histY
    
    cor(ProjectData[,histX], ProjectData[, histY], use="pairwise.complete.obs")
  })
  
  ## output the correlation result
  output$correlation <- renderText({
    correlationResult = correlationHist()
    histX <- input$histX
    histY <- input$histY
    
    c(paste("The correlation between", gsub("[.]", " ",histX), "and", gsub("[.]", " ",histY), ":", round(correlationResult, 4), sep=" "))
  })
  
  ## generate the data for chi squared test
  getDataForChi <- reactive({
    ProjectData <- read_data()
    chiX <- input$ChiX
    chiY <- input$ChiY
    
    if(input$ChiXHigh < 100){
      ProjectData[, "ChiX"] <- apply(ProjectData, 1, function(row) ifelse(is.na(row[chiX]), NA, 
                                                                          ifelse(as.integer(row[chiX]) < input$ChiXLow, "Low", 
                                                                                 ifelse(as.integer(row[chiX]) < input$ChiXMed, "Low-Mid",
                                                                                        ifelse(as.integer(row[chiX]) < input$ChiXHigh, "Mid","High")))))
    }else{
      ProjectData[, "ChiX"] <- apply(ProjectData, 1, function(row) ifelse(is.na(row[chiX]), NA, 
                                                                          ifelse(as.integer(row[chiX]) < input$ChiXLow, "Low", 
                                                                                 ifelse(as.integer(row[chiX]) < input$ChiXMed, "Mid", "High"))))
    }
    
    if(input$ChiYHigh < 100){
      ProjectData[, "ChiY"] <- apply(ProjectData, 1, function(row) ifelse(is.na(row[chiY]), NA, 
                                                                          ifelse(as.integer(row[chiY]) < input$ChiYLow, "Low", 
                                                                                 ifelse(as.integer(row[chiY]) < input$ChiYMed, "Low-Mid",
                                                                                        ifelse(as.integer(row[chiY]) < input$ChiYHigh, "Mid","High")))))
    }else{
      ProjectData[, "ChiY"] <- apply(ProjectData, 1, function(row) ifelse(is.na(row[chiY]), NA, 
                                                                          ifelse(as.integer(row[chiY]) < input$ChiYLow, "Low", 
                                                                                 ifelse(as.integer(row[chiX]) < input$ChiYMed, "Mid", "High"))))
    }
    
    ProjectData
  })
  
  ## output the cross tabs
  output$ChisquaredTest <- renderTable({
    ProjectData <- getDataForChi()
    
    table(ProjectData[, "ChiY"], ProjectData[, "ChiX"])
  })
  
  ## output the correlation result
  output$chiTest <- renderText({
    ProjectData <- getDataForChi()
    
    tbl <- table(ProjectData[, "ChiY"], ProjectData[, "ChiX"])
    
    chi <- chisq.test(tbl) 
    
    Significance <- ifelse(0.05 < chi$p.value & chi$p.value < 0.1, ".",
                    ifelse(0.01 < chi$p.value & chi$p.value < 0.05, "*", 
                    ifelse(0.001 < chi$p.value &chi$p.value < 0.01, "**", 
                    ifelse(chi$p.value < 0.001, "***", ""))))
    
    c(paste("Pearson's Chi-squared test result : X-squared =", round(as.double(chi$statistic), 5), ", df =", as.integer(chi$parameter), ", p-value =", chi$p.value, ", significance =", Significance, sep=" "))
  })
  
  ## output the histogram of variable X from chi-squared test
  output$chiXHist <- renderPlot({
    ProjectData <- read_data()
    
    hist(ProjectData[, input$ChiX], xlab="", main=paste("Histogram of ", gsub("[.]", " ",input$ChiX), sep=""))
  })
  
  ## output the histogram of variable Y from chi-squared test
  output$chiYHist <- renderPlot({
    ProjectData <- read_data()
    
    hist(ProjectData[, input$ChiY], xlab="", main=paste("Histogram of ", gsub("[.]", " ",input$ChiY), sep=""))
  })
  
  ## function to download the scatter plot in PDF
  output$downloadScatter <- downloadHandler(  
    filename = function() {
      paste(gsub("[.]", " ",input$histX), " Vs ", gsub("[.]", " ",input$histY), ' scatter plot.pdf', sep='')
    },
    
    content = function(file) {
      histX <- input$histX
      histY <- input$histY
      ProjectData <- read_data()
      
      hist <- getScatterPlot(ProjectData, histX, histY)
      
      pdf(file, bg = "white", width=11, height=8, paper="a4r")
      print(hist)  
      dev.off()
    },
    contentType = 'application/pdf'
  )
  
  ## function to download the bar plot 1 in PDF
  output$downloadBarPlot1 <- downloadHandler(  
    filename = function() {
      paste('bar plot.pdf', sep='')
    },
    
    content = function(file) {
      ## get the data for bar plot
      dataforplot1 <- getBarPlot1Data()
      
      ## get the plot generated by a function
      barplot1 <- getBarPlot1(dataforplot1)
      
      pdf(file, bg = "white", width=11, height=8, paper="a4r")
      print(barplot1)  
      dev.off()
    },
    contentType = 'application/pdf'
  )
})