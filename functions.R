#nstall.packages("XLConnect")
library (XLConnect)

################# Master ISO3 and country names sheet
get.ISO3 <- function(){
  
  ISO3<-loadWorkbook("Country List with ISO3.xlsx")
  ISO3<-readWorksheet(ISO3, sheet="Country Code", region="B3:C450", header=T)
  ISO3[,1] <- tolower(ISO3[,1])
  
  return(ISO3)
}

################# Political stability
get.Political.Stability <- function(){
  
  ISO3 <- get.ISO3()
  
  Political.Stability <- loadWorkbook("[R] [WGI] Political stability.xlsx")
  
  ## get the data only without the column names and the country names
  Political.Stability.Data <- readWorksheet(Political.Stability, sheet="Political StabilityNoViolence", region="C16:CH230", header=F)
  
  ## get the column names without the country names
  Political.Stability.Data.Header <- readWorksheet(Political.Stability, sheet="Political StabilityNoViolence", region="C14:CH15", header=F)
  Political.Stability.Data.Header[3,] <- paste(Political.Stability.Data.Header[1,], Political.Stability.Data.Header[2,], sep=" ")
  
  ## assign the column names into Data object
  colnames(Political.Stability.Data) <- Political.Stability.Data.Header[3,]
  
  ## get the country names
  Political.Stability.Country <- readWorksheet(Political.Stability, sheet="Political StabilityNoViolence", region="A16:A230", header=F)
  colnames(Political.Stability.Country) <- c("Country.Name")
  Political.Stability.Country[,1] <- tolower(Political.Stability.Country[,1])
  
  ## get the ISO3 for country names
  Political.Stability.Country <- merge(Political.Stability.Country, ISO3, by="Country.Name", all.x=T)
  
  ## check if there is any country without ISO3
  subset(Political.Stability.Country, is.na(Political.Stability.Country[,2]))
  
  ## merging
  Political.Stability.Complete <- cbind(Political.Stability.Country, Political.Stability.Data)
  
  ## get only the latest data
  Political.Stability.Latest <- Political.Stability.Complete[,c("Country.Name", "ISO3", "2012 Estimate")]
  
  return(Political.Stability.Latest)
}

################# Technicians and associate professionals
tech.asso.86.MF.latest <- function(){
  
  ISO3 <- get.ISO3()
  
  Technicians.Associates.68.WS <- loadWorkbook("[R] [ILO] [ISCO-68] Technicians and associate professionals.xls")
  
  ## Get the data
  Technicians.Associates.68 <- readWorksheet(Technicians.Associates.68.WS, sheet="KILM 5c", region="A3:AN1976", header=T)
  
  ## Remove the CountryCode and get the country lowercase
  Technicians.Associates.68 <- Technicians.Associates.68[,-1]
  Technicians.Associates.68[,1] <- tolower(Technicians.Associates.68[,1])
  
  ## Get the ISO3 for country names
  Technicians.Associates.68 <- merge(ISO3, Technicians.Associates.68, by.x="Country.Name", by.y="Country", all.y=T)
  
  ## check if there is any country without ISO3
  NoISO3 <- subset(Technicians.Associates.68, is.na(Technicians.Associates.68[,2]))
  NoISO3[,1:5]
  
  ## Since the country without ISO3 is Germany, federal republic of western and year is from 1982 to 1989, we can just remove them.
  Technicians.Associates.68.ISO3 <- subset(Technicians.Associates.68, !is.na(Technicians.Associates.68[,2]))
  
  ## Get the name of unique Countries
  unique(Technicians.Associates.68.ISO3[,1])
  
  ## Get the gender total total
  Technicians.Associates.68.ISO3.MF <- Technicians.Associates.68.ISO3[Technicians.Associates.68.ISO3$Sex..code.=="MF",]
  
  ## Sort by the name and year. Then get the maximum
  Technicians.Associates.68.ISO3.MF.sorted <- Technicians.Associates.68.ISO3.MF[order(Technicians.Associates.68.ISO3.MF$Country.Name, Technicians.Associates.68.ISO3.MF$Year, decreasing=T),]
  Technicians.Associates.68.ISO3.MF.latest <- Technicians.Associates.68.ISO3.MF.sorted[!duplicated(Technicians.Associates.68.ISO3.MF.sorted$Country.Name),]
  
  ## Get the columns
  Technicians.Associates.ISO3.MF.68.latest <- Technicians.Associates.ISO3.MF.latest[, c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                                       "X0.1...000.", "X0.1....", "X2...000.", "X2....")]
  
  ## Change the column names
  colnames(Technicians.Associates.ISO3.MF.68.latest) <- c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                          "01.000.68", "01.percent.68", "2.000.68", "2.percent.68")
  
  return(Technicians.Associates.ISO3.MF.68.latest)
}