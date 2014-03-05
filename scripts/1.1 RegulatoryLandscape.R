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


busienss.gov.relations <- get.WEF(source.file="Business-government relations.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="K8:K155",
                                  source.colname="K6", 
                                  source.date="C7", 
                                  source.countries="C8:C155")

