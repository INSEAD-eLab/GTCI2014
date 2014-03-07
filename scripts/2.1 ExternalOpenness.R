################# FDI and technology transfer
FDI.technology.transfer <- get.WEF(source.file="WEF.xlsx", 
                                             source.sheet="Sheet1", 
                                             source.data.region="Y8:Y155",
                                             source.colname="Y6", 
                                             source.date="C7", 
                                             source.countries="C8:C155")


################# Country capacity to attract talent
Country.capacity.attract.talent <- get.WEF(source.file="WEF.xlsx", 
                                   source.sheet="Sheet1", 
                                   source.data.region="DG8:DG155",
                                   source.colname="DG6", 
                                   source.date="C7", 
                                   source.countries="C8:C155")


################# Country capacity to retain talent
Country.capacity.retain.talent <- get.WEF(source.file="WEF.xlsx", 
                                           source.sheet="Sheet1", 
                                           source.data.region="DF8:DF155",
                                           source.colname="DF6", 
                                           source.date="C7", 
                                           source.countries="C8:C155")

################# Prevalence of foreign ownership
Prevalence.foreign.ownership <- get.WEF(source.file="WEF.xlsx", 
                                          source.sheet="Sheet1", 
                                          source.data.region="BI8:BI155",
                                          source.colname="BI6", 
                                          source.date="C7", 
                                          source.countries="C8:C155")


## WDI data has same format as UNESCO and used that function
################################# Net migration
net.migration <- get.UNESCO.format(source.file="[R] [WDI] Net migration (stock) five-year estimates.xls",
                                           source.sheet="Data", 
                                           source.data.region="BD4:BD255",
                                           source.colnames="BC3:BD3", 
                                           result.colnames="net.migration",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A4:A255")