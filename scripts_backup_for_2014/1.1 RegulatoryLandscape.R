################# Political Stability
Government.effectiveness <- get.WGI(source.file="[R] [WGI] Government effectiveness.xlsx", 
                               source.sheet="GovernmentEffectiveness", 
                               source.data.region="C16:CH230",
                               source.colnames="C14:CH15", 
                               source.countries="A16:A230", 
                               result.colnames=c("Country.Name", "ISO3", "2012 Estimate"))


################# Political Stability
Political.Stability <- get.WGI(source.file="[R] [WGI] Political stability.xlsx", 
                                               source.sheet="Political StabilityNoViolence", 
                                               source.data.region="C16:CH230",
                                               source.colnames="C14:CH15", 
                                               source.countries="A16:A230", 
                                               result.colnames=c("Country.Name", "ISO3", "2012 Estimate"))

################# Business Government relation
busienss.gov.relations <- get.WEF(source.file="WEF.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="K8:K155",
                                  source.colname="K6", 
                                  source.date="C7", 
                                  source.countries="C8:C155")

################# corruption perception index 
corruption.perception.index  <- get.WEF(source.file="[TI] Corruption perception index.xlsx", 
                                  source.sheet="CPI 2013", 
                                  source.data.region="G5:G181",
                                  source.colname="G3", 
                                  source.date="A1", 
                                  source.countries="B5:B181")

corruption.perception.index[, "Year"] <- 2013


############### Ease of Establishment Data
Ease.of.Establishment.Data  <- get.WEF(source.file="[R] [WB] Ease of Establishment Data.xlsx", 
                                       source.sheet="Calculation", 
                                       source.data.region="AY5:AY104",
                                       source.colname="AY4", 
                                       source.date="AZ4", 
                                       source.countries="B5:B104", 
                                       different.source=TRUE,
                                       source.name="WB")