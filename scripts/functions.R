#nstall.packages("XLConnect")
#install.packages("seqinr")
library(XLConnect)
library(seqinr)
library(knitr)
library(xtable)

################# Master ISO3 and country names sheet
get.ISO3 <- function(){
  
  ISO3<-loadWorkbook(paste("data/", "Country List with ISO3.xlsx", sep=""))
  ISO3<-readWorksheet(ISO3, sheet="Country Code", region="B3:C481", header=T)
  ISO3[,1] <- tolower(ISO3[,1])

  return(ISO3)
}

get.single.country.name.list <- function(){
  countries <- read.csv("data/Country.csv")
  
  return(countries)
}

################# Political stability
## Data format : WGI
get.WGI <- function(source.file, source.sheet, source.data.region, 
                    source.colnames, source.countries, result.colnames){
  print("########")
  print(paste("Running get.Political.Stability function to get the data from", source.file, sep=" "))
  
  ISO3 <- get.ISO3()
  
  Political.Stability <- loadWorkbook(paste("data/", source.file, sep=""))
  
  ## get the data only without the column names and the country names
  Political.Stability.Data <- readWorksheet(Political.Stability, sheet=source.sheet, region=source.data.region, header=F)
  
  ## get the column names without the country names
  Political.Stability.Data.Header <- readWorksheet(Political.Stability, sheet=source.sheet, region=source.colnames, header=F)
  Political.Stability.Data.Header[3,] <- paste(Political.Stability.Data.Header[1,], Political.Stability.Data.Header[2,], sep=" ")
  
  ## assign the column names into Data object
  colnames(Political.Stability.Data) <- Political.Stability.Data.Header[3,]
  
  ## get the country names
  Political.Stability.Country <- readWorksheet(Political.Stability, sheet=source.sheet, region=source.countries, header=F)
  colnames(Political.Stability.Country) <- c("Country.Name")
  Political.Stability.Country[,1] <- tolower(Political.Stability.Country[,1])
  
  ## get the ISO3 for country names
  Political.Stability.Country <- merge(Political.Stability.Country, ISO3, by="Country.Name", all.x=T)
  
  ## check if there is any country without ISO3
  subset(Political.Stability.Country, is.na(Political.Stability.Country[,2]))
  
  ## merging
  Political.Stability.Complete <- cbind(Political.Stability.Country, Political.Stability.Data)
  
  ## get only the latest data
  Political.Stability.Latest <- Political.Stability.Complete[, result.colnames]
  
  final.countries <- unique(Political.Stability.Latest[,1])
  print(paste("Total number of unique countries after cleaning ",length(final.countries), sep=""))
  print("###### end #######")
  
  return(Political.Stability.Latest)
}


################# original data : long format
################# Technicians and associate professionals from 88
## the source data structure must be the same as [R] [ILO] [ISCO-68] Technicians and associate professionals.xls
## Data format : ILO
get.ILO.latest <- function(source.file, source.sheet, source.region, source.gender, 
                           source.colnames, result.colnames, result.cut.year, source.age="", data.format=""){
  
  print("########")
  print(paste("Running ILO latest function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  if(data.format=="csv"){
    Technicians.Associates <- read.csv(paste("data/", source.file, sep=""), header=TRUE, sep=",")
  }else{
    Technicians.Associates.WS <- loadWorkbook(paste("data/", source.file, sep=""))
    
    ## Get the data 
    ## This is in Panel data
    Technicians.Associates <- readWorksheet(Technicians.Associates.WS, sheet=source.sheet, region=source.region, header=T)
  }
  
  
  ## Remove the CountryCode and get the country lowercase
  Technicians.Associates <- Technicians.Associates[,-1]
  Technicians.Associates[,1] <- tolower(Technicians.Associates[,1])
  
  original.countries <- unique(Technicians.Associates[,1])
  print(paste("Total number of rows in original datasheet : ", nrow(Technicians.Associates), sep=""))
  print(paste("Total number of unique countries before cleaning : ", length(original.countries), sep=""))
  
  ## Get the ISO3 for country names
  Technicians.Associates <- merge(ISO3, Technicians.Associates, by.x="Country.Name", by.y="Country", all.y=T)
  
  ## Since the country without ISO3 is Germany, federal republic of western and year is from 1982 to 1989, we can just remove them.
  Technicians.Associates.ISO3 <- subset(Technicians.Associates, !is.na(Technicians.Associates[,2]))
  
  ## Get the name of unique Countries
  cleaned.countries <- unique(Technicians.Associates.ISO3[,1])
  print(paste("Total number of unique countries after cleaning : ",length(cleaned.countries), sep=""))
  
  if(length(cleaned.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, cleaned.countries))
  }
  
  ## Get the correct gender
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3[Technicians.Associates.ISO3$Sex..code. == source.gender,]
  
  ## Get the correct age
  if(nchar(source.age) > 0){
    Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[Technicians.Associates.ISO3.MF$Age.group == source.age,]  
  }
  
  ## Get the columns
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[, source.colnames]
  
  ## Change the column names
  colnames(Technicians.Associates.ISO3.MF) <- result.colnames
  
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[complete.cases(Technicians.Associates.ISO3.MF),]
  
  ## Sort by the name and year. Then get the maximum
  Technicians.Associates.ISO3.MF.sorted <- Technicians.Associates.ISO3.MF[order(Technicians.Associates.ISO3.MF$Country.Name, Technicians.Associates.ISO3.MF$Year, decreasing=T),]
  Technicians.Associates.ISO3.MF.latest <- Technicians.Associates.ISO3.MF.sorted[!duplicated(Technicians.Associates.ISO3.MF.sorted$Country.Name),]
  
  ## Order by the ISO3
  Technicians.Associates.ISO3.MF.latest <- Technicians.Associates.ISO3.MF.latest[order(Technicians.Associates.ISO3.MF.latest$ISO3, decreasing=F),]
  
  ## Remove the data which is lower than 2003
  Technicians.Associates.ISO3.MF.latest.cut <- Technicians.Associates.ISO3.MF.latest[Technicians.Associates.ISO3.MF.latest$Year >= result.cut.year,]
  
  ## Get the name of unique Countries
  final.countries <- unique(Technicians.Associates.ISO3.MF.latest.cut[,1])
  print(paste("Total number of unique countries after cutting at ", result.cut.year, " : ", length(final.countries), sep=""))
  
  if(length(final.countries) != length(cleaned.countries)){
    print("Countries removed are :")
    print(setdiff(cleaned.countries, final.countries))
  }
  
  print("###### end #######")
  
  ## return the final result
  return(Technicians.Associates.ISO3.MF.latest.cut)
}


################# original data : long format
################# Technicians and associate professionals from 88
## the source data structure must be the same as [R] [ILO] [ISCO-68] Technicians and associate professionals.xls
## Data format : ILO
## This function will take country name and year from numerator.list variable and will return the data with the same year for calculation of ratios
get.ILO.denominator <- function(source.file, source.sheet, source.region, source.gender, 
                           source.colnames, result.colnames, numerator.list, source.age="", data.format=""){
  
  print("########")
  print(paste("Running ILO latest function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  if(data.format=="csv"){
    Technicians.Associates <- read.csv(paste("data/", source.file, sep=""), header=TRUE, sep=",")
  }else{
    Technicians.Associates.WS <- loadWorkbook(paste("data/", source.file, sep=""))
    
    ## Get the data 
    ## This is in Panel data
    Technicians.Associates <- readWorksheet(Technicians.Associates.WS, sheet=source.sheet, region=source.region, header=T)
  }
  
  
  ## Remove the CountryCode and get the country lowercase
  Technicians.Associates <- Technicians.Associates[,-1]
  Technicians.Associates[,1] <- tolower(Technicians.Associates[,1])
  
  original.countries <- unique(Technicians.Associates[,1])
  print(paste("Total number of rows in original datasheet : ", nrow(Technicians.Associates), sep=""))
  print(paste("Total number of unique countries before cleaning : ", length(original.countries), sep=""))
  
  ## Get the ISO3 for country names
  Technicians.Associates <- merge(ISO3, Technicians.Associates, by.x="Country.Name", by.y="Country", all.y=T)
  
  ## Since the country without ISO3 is Germany, federal republic of western and year is from 1982 to 1989, we can just remove them.
  Technicians.Associates.ISO3 <- subset(Technicians.Associates, !is.na(Technicians.Associates[,2]))
  
  ## Get the name of unique Countries
  cleaned.countries <- unique(Technicians.Associates.ISO3[,1])
  print(paste("Total number of unique countries after cleaning : ",length(cleaned.countries), sep=""))
  
  if(length(cleaned.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, cleaned.countries))
  }
  
  ## Get the correct gender
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3[Technicians.Associates.ISO3$Sex..code. == source.gender,]
  
  ## Get the correct age
  if(nchar(source.age) > 0){
    Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[Technicians.Associates.ISO3.MF$Age.group == source.age,]  
  }
  
  ## Get the columns
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[, source.colnames]
  
  ## Change the column names
  colnames(Technicians.Associates.ISO3.MF) <- result.colnames
  
  Technicians.Associates.ISO3.MF <- Technicians.Associates.ISO3.MF[complete.cases(Technicians.Associates.ISO3.MF),]
  
  ## Order by the ISO3
  Technicians.Associates.ISO3.MF.latest <- Technicians.Associates.ISO3.MF[order(Technicians.Associates.ISO3.MF$ISO3, decreasing=F),]
  
  ## get the numerator list
  numerator.list.country.year <- numerator.list[, c("ISO3", "Country.Name", "Year")]
  
  Technicians.Associates.ISO3.MF.latest.cut <- merge(numerator.list.country.year, Technicians.Associates.ISO3.MF.latest, by=c("ISO3", "Country.Name", "Year"), all.x=TRUE)
  
  ## Get the name of unique Countries
  final.countries <- unique(Technicians.Associates.ISO3.MF.latest.cut[,1])
  print(paste("Total number of unique countries after cutting with numerator years : ", length(final.countries), sep=""))
  
  if(length(final.countries) != length(cleaned.countries)){
    print("Countries removed are :")
    print(setdiff(cleaned.countries, final.countries))
  }
  
  print("###### end #######")
  
  ## return the final result
  return(Technicians.Associates.ISO3.MF.latest.cut)
}


################# Original data : wide format
## Data format : UNESCO & WDI
get.UNESCO.format <- function(source.file, source.sheet, source.data.region, source.colnames, result.colnames, 
                              result.cut.year, names.separated=FALSE, country.names="", format="UNESCO", result.row=""){
  print("########")
  print(paste("Running get.UNESCO.format function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  data.ws <- loadWorkbook(paste("data/", source.file, sep=""))
  
  ## get the column names without the country names
  data.Header <- readWorksheet(data.ws, sheet=source.sheet, region=source.colnames, header=F)
  
  if(format == "WIPO"){
    data.Header <- cbind("Country.Name", data.Header)
  }else{
    data.Header[1, 1] <- "Country.Name"  
  }
  
  ## get the data only without the column names but with the country names
  if(names.separated){
    countries <- readWorksheet(data.ws, sheet=source.sheet, region=country.names, header=F)
    data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
    
    if(format=="UNESCO"){
      data <- apply(data, 1:2, function(x) ifelse(x == ".", NA, ifelse(x == "...", NA, ifelse(x == "-", 0, as.numeric(x)))))
    }else if(format=="GEM"){
      data <- apply(data, 1:2, function(x) ifelse(x == "-", NA, as.numeric(x)))
    }
    
    data <- data.frame(data, stringsAsFactors=F)
    UNESCO.data <- cbind(countries, data)
    
    if(format=="WIPO"){
      ## get the desired result row
      UNESCO.data <- UNESCO.data[UNESCO.data[,2] == result.row,]
      
      ## remove the undesired column
      UNESCO.data <- UNESCO.data[, -2]
      
      ## remove tailing spaces from countries
      UNESCO.data[, 1] <- lapply(UNESCO.data[1], function(x) trimSpace(x))
    }
    
  }else{
    UNESCO.data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
    data <- UNESCO.data[, -1]
    
    if(format=="UNESCO"){
      data <- apply(data, 1:2, function(x) ifelse(x == ".", NA, ifelse(x == "...", NA, ifelse(x == "-", 0, as.numeric(x)))))  
    }else if(format=="GEM"){
      data <- apply(data, 1:2, function(x) ifelse(x == "-", NA, as.numeric(x)))
    }else if(format=="ILOpdf"){
      data <- apply(data, 1:2, function(x) gsub("%", "", x))
      data <- apply(data, 1:2, function(x) ifelse(x == "n.a.", NA, as.numeric(x)))
    }else if(format=="UNCTAD"){
      data <- apply(data, 1:2, function(x) ifelse(x == "..", NA, ifelse(x == "_", NA, as.numeric(x))))
    }

    data <- data.frame(data, stringsAsFactors=F)
    UNESCO.data <- cbind(UNESCO.data[, 1], data)
    
    ## remove tailing spaces from countries
    UNESCO.data[, 1] <- lapply(UNESCO.data[1], function(x) trimSpace(x))
  }
  
  ## Change the names into lower case for merging
  UNESCO.data[, 1] <- tolower(UNESCO.data[, 1])
  
  original.countries <- unique(UNESCO.data[,1])
  print(paste("Total number of rows in original datasheet : ", nrow(UNESCO.data), sep=""))
  print(paste("Total number of unique countries before cleaning : ", length(original.countries), sep=""))
  
  ## assign the column names into Data object
  colnames(UNESCO.data) <- data.Header
  
  if(format=="WIPO"){
    ## colnames correction
    colnames(UNESCO.data)[1] <- "Country.Name"
  }
  
  ## remove the data rows without country names
  UNESCO.data <- subset(UNESCO.data, !is.na(UNESCO.data[, 1]))
  
  ## reshaping to long data
  UNESCO.long.data <- reshape(UNESCO.data, idvar="Country.Name", varying=list(2:ncol(data.Header)), v.names=result.colnames, 
                              direction="long", times=c(min(as.numeric(data.Header[,-1])):max(as.numeric(data.Header[,-1]))), timevar="Year")
  
  UNESCO.long.c.data <- UNESCO.long.data[complete.cases(UNESCO.long.data),]
  
  ## Sort by the name and year. Then get the maximum
  UNESCO.long.c.data <- UNESCO.long.c.data[order(UNESCO.long.c.data$Country.Name, UNESCO.long.c.data$Year, decreasing=T), ]
  UNESCO.long.c.data <- UNESCO.long.c.data[!duplicated(UNESCO.long.c.data$Country.Name), ]
  
  ## Order the data by Name, then time
  UNESCO.long.c.data <- UNESCO.long.c.data[order(UNESCO.long.c.data$Country.Name, UNESCO.long.c.data$Year, decreasing=F),]
  
  ## Remove the data which is lower than 2003
  UNESCO.long.c.data <- UNESCO.long.c.data[UNESCO.long.c.data$Year >= result.cut.year, ]  
  
  ## Get the ISO3 for country names
  UNESCO.long.c.data <- merge(UNESCO.long.c.data, ISO3, by="Country.Name", all.x=T, sort=FALSE)
  
  ## get complete cases only
  UNESCO.long.c.data <- subset(UNESCO.long.c.data, !is.na(UNESCO.long.c.data[, ncol(UNESCO.long.c.data)]))
  
  final.countries <- unique(UNESCO.long.c.data[,1])
  print(paste("Total number of unique countries after cutting and cleaning at ", result.cut.year, " : ",length(final.countries), sep=""))
  
  if(length(final.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, final.countries))
  }
  
  print("###### end #######")
  
  return(UNESCO.long.c.data)
}



################# Special function for science and engineering graduates from 3.1
################# Original data : wide format
## Data format : UNESCO
get.UNESCO.science.engineering.graduates <- function(source.file, source.sheet, data.regions, 
                                                     source.colnames, result.colnames, result.cut.year, names.separated=FALSE, 
                                                     country.names="", format="UNESCO", result.row=""){
  print("########")
  print(paste("Running get.UNESCO.science.engineering.graduates function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  data.ws <- loadWorkbook(paste("data/", source.file, sep=""))
  
  ## get the column names without the country names
  data.Header <- readWorksheet(data.ws, sheet=source.sheet, region=source.colnames, header=F)
  
  if(format == "WIPO"){
    data.Header <- cbind("Country.Name", data.Header)
  }else{
    data.Header[1, 1] <- "Country.Name"  
  }
  
  for(i in 1:3){
    source.data.region <- data.regions[i]
    
    ## get the data only without the column names but with the country names
    if(names.separated){
      countries <- readWorksheet(data.ws, sheet=source.sheet, region=country.names, header=F)
      data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
      
      data <- apply(data, 1:2, function(x) ifelse(x == ".", NA, ifelse(x == "...", NA, ifelse(x == "-", 0, as.numeric(x)))))
      
      data <- data.frame(data, stringsAsFactors=F)
      UNESCO.data <- cbind(countries, data)
      
    }else{
      UNESCO.data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
      data <- UNESCO.data[, -1]
      
      data <- apply(data, 1:2, function(x) ifelse(x == ".", NA, ifelse(x == "...", NA, ifelse(x == "-", 0, as.numeric(x)))))
      
      data <- data.frame(data, stringsAsFactors=F)
      UNESCO.data <- cbind(UNESCO.data[, 1], data)
      
      ## remove tailing spaces from countries
      UNESCO.data[, 1] <- lapply(UNESCO.data[1], function(x) trimSpace(x))
    }
    
    ## Change the names into lower case for merging
    UNESCO.data[, 1] <- tolower(UNESCO.data[, 1])
    
    original.countries <- unique(UNESCO.data[,1])
    print(paste("Total number of rows in original datasheet : ", nrow(UNESCO.data), sep=""))
    print(paste("Total number of unique countries before cleaning : ", length(original.countries), sep=""))
    
    ## assign the column names into Data object
    colnames(UNESCO.data) <- data.Header
    
    ## remove the data rows without country names
    UNESCO.data <- subset(UNESCO.data, !is.na(UNESCO.data[, 1]))
    
    ## reshaping to long data
    individual <- reshape(UNESCO.data, idvar="Country.Name", varying=list(2:ncol(data.Header)), v.names=result.colnames[i], 
                                direction="long", times=c(min(as.numeric(data.Header[,-1])):max(as.numeric(data.Header[,-1]))), timevar="Year")
    
    if(i == 1){
      UNESCO.long.data <- individual
    }else{
      UNESCO.long.data <- merge(UNESCO.long.data, individual, by=c("Country.Name", "Year"), all=TRUE, sort=FALSE)  
    }
  }
  
  
  UNESCO.long.c.data <- UNESCO.long.data[complete.cases(UNESCO.long.data),]
  
  ## Sort by the name and year. Then get the maximum
  UNESCO.long.c.data <- UNESCO.long.c.data[order(UNESCO.long.c.data$Country.Name, UNESCO.long.c.data$Year, decreasing=T), ]
  UNESCO.long.c.data <- UNESCO.long.c.data[!duplicated(UNESCO.long.c.data$Country.Name), ]
  
  ## Order the data by Name, then time
  UNESCO.long.c.data <- UNESCO.long.c.data[order(UNESCO.long.c.data$Country.Name, UNESCO.long.c.data$Year, decreasing=F),]
  
  ## Remove the data which is lower than 2003
  UNESCO.long.c.data <- UNESCO.long.c.data[UNESCO.long.c.data$Year >= result.cut.year, ]  
  
  ## Get the ISO3 for country names
  UNESCO.long.c.data <- merge(UNESCO.long.c.data, ISO3, by="Country.Name", all.x=T, sort=FALSE)
  
  ## get complete cases only
  UNESCO.long.c.data <- subset(UNESCO.long.c.data, !is.na(UNESCO.long.c.data[, ncol(UNESCO.long.c.data)]))
  
  final.countries <- unique(UNESCO.long.c.data[,1])
  print(paste("Total number of unique countries after cutting and cleaning at ", result.cut.year, " : ",length(final.countries), sep=""))
  
  if(length(final.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, final.countries))
  }
  
  print("###### end #######")
  
  return(UNESCO.long.c.data)
}


########################## original data : long format (can be used with cleaned data as well. check 6.2 new business density)
########################## Number of firms offering formal training
## WB data format
get.WB.format <- function(source.file, source.sheet, source.data.region, 
                          source.colnames, source.result.col, result.cut.year, result.row=""){
  
  print("########")
  print(paste("Running get.WB.format function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  ## load the excel sheet
  data.ws <- loadWorkbook(paste("data/", source.file, sep=""))
  
  ## get the column names without the country names
  data.Header <- readWorksheet(data.ws, sheet=source.sheet, region=source.colnames, header=F)
  
  data.Header[1, 1] <- "Country.Name"
  
  WB.data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
  
  print(paste("Total number of rows in original datasheet : ", nrow(WB.data), sep=""))
  
  if(nchar(result.row) > 0){
    WB.data <- WB.data[WB.data[,3] == result.row,]  
  }
  
  data <- WB.data[, -1]
  
  data <- apply(data, 1:2, function(x) ifelse(x == "n.c.", NA, ifelse(x == "...", NA, ifelse(x == "n.a.", NA, as.numeric(x)))))
  
  data <- data.frame(data, stringsAsFactors=F)
  
  WB.data <- cbind(WB.data[, 1], data)
  
  ## Change the names into lower case for merging
  WB.data[, 1] <- tolower(WB.data[, 1])
  
  original.countries <- unique(WB.data[,1])
  print(paste("Total number of unique countries before cleaning : ", length(original.countries), sep=""))
  
  ## Set the column names
  colnames(WB.data) <- data.Header
  
  ## Get the data which has at least cut off year and the required column
  WB.data <- WB.data[WB.data$Year >= result.cut.year, c("Country.Name", "Year", source.result.col)]
  
  ## remove the NA from data points before sorting and seleting
  WB.data <- subset(WB.data, !is.na(WB.data[,3]))
  
  ## Get the ISO3 for country names
  WB.data <- merge(WB.data, ISO3, by="Country.Name", all.x=T)
  
  ## remove the NA from ISO3 before sorting and seleting
  WB.data <- subset(WB.data, !is.na(WB.data[,4]))
  
  ## Order the data with country, year in decreasing order and get the latest data
  WB.data <- WB.data[order(WB.data$Country.Name, WB.data$Year, decreasing=T), ]
  WB.data <- WB.data[!duplicated(WB.data$Country.Name), ]
  
  ## order the data with ISO3
  WB.data <- WB.data[order(WB.data$ISO3, decreasing=F), ]
  
  final.countries <- unique(WB.data[,1])
  print(paste("Total number of unique countries after cutting and cleaning at ", result.cut.year, " : ",length(final.countries), sep=""))
  
  if(length(final.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, final.countries))
  }
  
  print("###### end #######")
  
  return(WB.data)
}


## WEF data format & UN data format & KPMG data & Yale data
## mainly if the countries, year and data columns are separated in 3 columns but need to be in long format.
get.WEF <- function(source.file, source.sheet, source.data.region,
                    source.colname, source.date, source.countries,
                    multi.col=FALSE, different.source=FALSE, cut.off.year="", date.on.diff.sheet=FALSE, source.date.sheet="", result.colname="", source.name=""){
  
  print("########")
  print(paste("Running get.WEF.format function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  ## load the excel sheet
  data.ws <- loadWorkbook(paste("data/", source.file, sep=""))
  
  ## get the column names without the country names
  data.Header <- readWorksheet(data.ws, sheet=source.sheet, region=source.colname, header=F)
  
  ## get the column names without the country names
  if(date.on.diff.sheet){
    data.date <- readWorksheet(data.ws, sheet=source.date.sheet, region=source.date, header=F)  
  }else{
    data.date <- readWorksheet(data.ws, sheet=source.sheet, region=source.date, header=F)  
  }
  
  ## get the country names
  Country <- readWorksheet(data.ws, sheet=source.sheet, region=source.countries, header=F)
  colnames(Country) <- c("Country.Name")
  Country[, 1] <- tolower(Country[, 1])
  Country[, 1] <- lapply(Country[1], function(x) trimSpace(x))
  
  original.countries <- unique(Country[,1])
  print(paste("Total number of unique countries before cleaning : ",length(original.countries), sep=""))
  
  ## get the data
  data <- readWorksheet(data.ws, sheet=source.sheet, region=source.data.region, header=F)
  
  ## for UN data
  if(multi.col){
    colnames(data) <- data.Header
  }else{
    if(nchar(result.colname) > 0){
      colnames(data) <- result.colname
    }else{
      colnames(data) <- data.Header[1, 1]
    }
  }
  
  if(different.source == TRUE){
    if(source.name == "WB"){
      data <- apply(data, 1:2, function(x) gsub("%", "", x))
      data <- apply(data, 1:2, function(x) ifelse(x == "..", NA, ifelse(x == "-", NA, ifelse(x == "NA", NA, as.numeric(x)))))
    }else{
      data <- apply(data, 1:2, function(x) gsub(",", "", x))
      data <- apply(data, 1:2, function(x) ifelse(x == ".", NA, ifelse(x == "...", NA, ifelse(x == "-", 0, ifelse(x == "n/a", NA, as.numeric(x))))))
    }    
  }else{
    data <- apply(data, 1:2, function(x) ifelse(x =="..", NA, ifelse(x == "n.c.", NA, ifelse(x == "...", NA, ifelse(x == "n.a.", NA, as.numeric(x))))))
  }
  
  ## merge with country and data
  WEF <- cbind(Country, data)
  
  if(different.source == TRUE){
    ## assign the year for record
    WEF <- cbind(WEF, data.date)
    colnames(WEF)[ncol(WEF)] <- "Year"
    WEF <- WEF[WEF$Year >= 2003,]
  }else{
    ## assign the year for record
    WEF[, "Year"] <- data.date[1, 1]
  }
  
  ## get ISO3
  WEF <- merge(WEF, ISO3, by="Country.Name", all.x=T, sort=FALSE)
  
  ## get complete cases only
  WEF <- WEF[complete.cases(WEF),]
  
  final.countries <- unique(WEF[,1])
  print(paste("Total number of unique countries after cleaning : ",length(final.countries), sep=""))
  
  if(length(final.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, final.countries))
  }
  
  return(WEF)
}


## simple data format with countries and data are in row. and only one date
get.conferenceboard <- function(source.file, source.sheet, source.data.region,
                                source.countries, source.date.field, result.colname, single.year){
  print("########")
  print(paste("Running get.conferenceboard function to get the data from ", source.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  WS <- loadWorkbook(paste("data/", source.file, sep=""))
  
  countries <- readWorksheet(WS, sheet=source.sheet, region=source.countries, header=F)
  data      <- readWorksheet(WS, sheet=source.sheet, region=source.data.region, header=F)
  date      <- readWorksheet(WS, sheet=source.sheet, region=source.date.field, header=F)
  
  countries[1,] <- tolower(countries[1,])
  
  original.countries <- as.character(unique(countries[1,]))
  print(paste("Total number of unique countries before cleaning : ",length(original.countries), sep=""))
  
  if(ncol(data) != ncol(countries)){
    countries <- countries[1:length(data)]
  }
  
  merged <- rbind(countries, data)
  
  merged <- data.frame(t(merged))
  
  if(single.year==TRUE){
    merged <- merged[complete.cases(merged),]
    colnames(merged) <- c("Country.Name", result.colname) 
    merged[,"Year"] <- date[1,1]
  }else{
    colnames(merged) <- c("Country.Name", date[,1])
    
    merged12 <- reshape(merged, idvar="Country.Name", varying=list(2:ncol(merged)), v.names=result.colname, 
                        direction="long", times=c(min(as.numeric(date[,1])):max(as.numeric(date[,1]))), 
                        new.row.name=1:((ncol(merged)-1)*nrow(merged)), timevar="Year")
    
    merged12 <- merged12[complete.cases(merged12),]
    ## Sort by the name and year. Then get the maximum
    merged12 <- merged12[order(merged12$Country.Name, merged12$Year, decreasing=T), ]
    merged12 <- merged12[!duplicated(merged12$Country.Name), ]
    
    ## changing the order of the column
    merged <- merged12[, c(1,3,2)]
  }
  
  merged <- merge(merged, ISO3, by="Country.Name", all.x=TRUE, sort=FALSE)
  merged <- merged[complete.cases(merged),]
  
  merged[,2] <- lapply(merged[2], function(x) as.numeric(as.character(x)))
  
  final.countries <- unique(merged$Country.Name)
  print(paste("Total number of unique countries after cleaning : ",length(final.countries), sep=""))
  
  if(length(final.countries) != length(original.countries)){
    print("Countries removed are :")
    print(setdiff(original.countries, final.countries))
  }
  
  return(merged)
}


## scaling with wide format denominator or single year long format.
scaling <- function(numertor, numerator.colname, denominator.file, denominator.sheet, denominator.countries, 
                    denominator.data.region, denominator.years, result.colname, multiplier=1){
  print("########")
  print(paste("Running scaling function to get the data from ", denominator.file, sep=""))
  
  ISO3 <- get.ISO3()
  
  WS <- loadWorkbook(paste("data/", denominator.file, sep=""))
  
  countries <- readWorksheet(WS, sheet=denominator.sheet, region=denominator.countries, header=F)
  data      <- readWorksheet(WS, sheet=denominator.sheet, region=denominator.data.region, header=F)
  date      <- readWorksheet(WS, sheet=denominator.sheet, region=denominator.years, header=F)
  
  countries[, 1] <- tolower(countries[, 1])
  data <- apply(data, 1:2, function(x) gsub(",", "", x))
  data <- apply(data, 1:2, function(x) ifelse(x == "n/a", NA, as.numeric(x)))
  
  merged <- cbind(countries, data)

  colnames(merged) <- c("Country.Name", date[1,])
  
  merged12 <- reshape(merged, idvar="Country.Name", varying=list(2:ncol(merged)), v.names=result.colname, 
                      direction="long", times=c(min(as.numeric(date[1,])):max(as.numeric(date[1,]))), 
                      timevar="Year")
  
  merged12 <- merged12[complete.cases(merged12),]
  ## Sort by the name and year. Then get the maximum
  merged12 <- merged12[order(merged12$Country.Name, merged12$Year, decreasing=T), ]
  
  merged <- merged12
  
  merged <- merge(merged, ISO3, by="Country.Name", all.x=TRUE, sort=FALSE)
  
  merged.with.numerator <- merge(numertor, merged, by=c("ISO3", "Year"), all.x=T, sort=FALSE)
  
  merged.with.numerator[, "ratio"] <- multiplier*(merged.with.numerator[, numerator.colname]/merged.with.numerator[, result.colname])
  
  return(merged.with.numerator)
}

generate.pdf <- function(variable.object, variable.to.sort, name, note=""){
  ## variable.object should follow Country.Name, ISO3, Year, Variable1 - Variable3
  ## total 6 columns maximum from minimum 4 columns
  name.to.be.printed <- name
  variable.to.be.printed <- variable.object
  sorting.name <- variable.to.sort
  note.to.be.printed <- note
  
  #variable.to.be.printed <- innovation.output
  #sorting.name <- "GII innovation output"
  #name.to.be.printed <- "GII Innovation Output"
  
  Country.Names <- get.single.country.name.list()
  
  variable.to.be.printed <- variable.to.be.printed[, !names(variable.to.be.printed) %in% c("Country.Name")]
  variable.to.be.printed <- merge(Country.Names, variable.to.be.printed, by="ISO3", all.y=TRUE)
  
  variable.data.only <- variable.to.be.printed[, !names(variable.to.be.printed) %in% c("Country.Name", "ISO3", "Year"), drop=FALSE]
  variable.ID.only   <- variable.to.be.printed[, c("ISO3", "Country.Name", "Year")]
  
  variable.to.be.printed <- cbind(variable.ID.only, variable.data.only)
  
  variable.to.be.printed.sorted <- variable.to.be.printed[order(variable.to.be.printed[, sorting.name], decreasing=T),]
  rownames(variable.to.be.printed.sorted) <- c(1:nrow(variable.to.be.printed.sorted))
  
  knit2pdf("scripts/Export.Rnw")
  file.copy("Export.pdf", "export/", overwrite=TRUE)
  file.rename("export/Export.pdf", paste("export/", name,".pdf", sep=""))
  file.remove("Export.log", "Export.tex", "Export.aux", "Export.pdf")
  
  rm(name.to.be.printed, variable.to.be.printed, variable.to.be.printed.sorted, sorting.name)
}


getHighMedTech <- function(netHigh, netMed, netDeno){
  if(is.na(netHigh) & is.na(netMed)){
    return(NA)
  }else if(is.na(netHigh) & !is.na(netMed)){
    return(netMed/netDeno)
  }else{
    return((netHigh+netMed)/netDeno)
  }
}