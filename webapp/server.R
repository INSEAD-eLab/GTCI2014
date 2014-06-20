library(shiny)
library(XLConnect)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  read_data <- reactive({
    
    ISO3 <- loadWorkbook("data.xlsx")
    ISO3 <- readWorksheet(ISO3, sheet="Sheet1", region="B6:EW110", header=T)
    
    ISO3[, 'color'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Income.group']), colors()[179],
                                                    ifelse(row['Income.group'] == "High income", colors()[563],
                                                    ifelse(row['Income.group'] == "Upper middle income", colors()[224],
                                                    ifelse(row['Income.group'] == "Lower middle income", colors()[26], colors()[179])))))
    
    ISO3[, 'shape'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Regional.group']), 1,
                                                    ifelse(row['Regional.group'] == "Asia Pacific", 2,
                                                    ifelse(row['Regional.group'] == "CIS and Balkans", 3,
                                                    ifelse(row['Regional.group'] == "Europe", 4, 
                                                    ifelse(row['Regional.group'] == "Latin America and Caribbean", 5,
                                                    ifelse(row['Regional.group'] == "Middle East and North Africa", 6,
                                                    ifelse(row['Regional.group'] == "North America", 7, 8))))))))
    
    ISO3[, 'Income.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Income.group']), "New Country", row['Income.group'])) 
    ISO3[, 'Region.gp'] <- apply(ISO3, 1, function(row) ifelse(is.na(row['Regional.group']), "New Country", row['Regional.group'])) 
    
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
    
    histX <- input$histX
    histY <- input$histY
    ProjectData <- read_data()
    
    
    if(input$shapeByRegion == 1){
      shapeByRegion = ProjectData$shape
    }else{
      shapeByRegion = 16
    }
    
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
    
    #geom_point(aes(size =n_in_stat>4)) + scale_size_manual(values=c(2,5))
    
    print(hist)
    
  })
})
