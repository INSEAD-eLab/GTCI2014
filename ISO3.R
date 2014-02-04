install.packages("XLConnect")

library (XLConnect)
ISO3<-loadWorkbook("Country List with ISO3.xlsx")
ISO3<-readWorksheet(ISO3, sheet="Country Code", region="B3:C450", header=T)

head(ISO3)

ISO3[,1] <- tolower(ISO3[,1])

################# Political stability
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
Political.Stability.Country <- merge(Political.Stability.Country, ISO3, by="Country.Name")

## merging
Political.Stability.Complete <- cbind(Political.Stability.Country, Political.Stability.Data)

## get only the latest data
Political.Stability.Latest <- Political.Stability.Complete[,c("Country.Name", "ISO3", "2012 Estimate")]