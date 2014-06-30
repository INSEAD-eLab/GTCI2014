library(shiny)
library(ggplot2)
library(reshape2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  ## function to read the data from Excel
  read_data <- reactive({

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
    updateSelectInput(session, "histX", "Variables for X axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[5])
    updateSelectInput(session, "histY", "Variables for Y axis :",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[6])
    
    ## updating the form from Bar plot with variable names and country names
    updateSelectInput(session, "barPlotVariables", "Variables for Bar Plot : ",  choices = colnames(ISO3)[-c(1:4)], selected=colnames(ISO3)[6])
    updateSelectInput(session, "barPlotCountries", "Countries for Bar Plot : ",  choices = ISO3$Country , selected=ISO3$Country[1])
    
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
    dataforplot1 <- melt(dataforplot)
    
    dataforplot1
  })
  
  ## plotting bar plot 1
  output$barPlot1 <- renderPlot({
    dataforplot1 <- getBarPlot1Data()
    
    barplot1 <- ggplot(dataforplot1, aes(Country, value, fill=variable)) + geom_bar(stat="identity",position="dodge") + theme_bw()
    
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
  
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    datafrominput <- read.csv(inFile$datapath, header=TRUE)
    
    table(datafrominput$Income.group)
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
      
      dataforplot1 <- getBarPlot1Data()
      
      barplot1 <- ggplot(dataforplot1, aes(Country, value, fill=variable)) + geom_bar(stat="identity",position="dodge") + theme_bw()
      
      pdf(file, bg = "white", width=11, height=8, paper="a4r")
      print(barplot1)  
      dev.off()
    },
    contentType = 'application/pdf'
  )
})



#library(reshape2)

#dataforplot <- ISO3[ISO3$Country %in% c("Albania", "Algeria", "Japan", "Singapore"), c("Corruption", "Political.stability", "Government.effectiveness")]
#dataforplot[, "Country"] <- c("Albania", "Algeria", "Japan", "Singapore")

#dataforplot1 <- melt(dataforplot)

#ggplot(data=dataforplot, aes(x=Political.stability, y=Corruption, fill=Country)) + geom_bar(stat="identity", position=position_dodge())

#ggplot(dataforplot1, aes(Country, value,fill=variable))+
#  geom_bar(stat="identity",position="dodge")