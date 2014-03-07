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

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table12Total <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                        source.sheet="Table 12", 
                                        source.data.region="T25:T265",
                                        source.colname="T16", 
                                        source.date="E12", 
                                        source.countries="B25:B265")


# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table4 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 4", 
                                              source.data.region="F25:T265",
                                              source.colname="F16:T16", 
                                              source.date="E12", 
                                              source.countries="B25:B265",
                                              multi.col=TRUE)

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table8 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 8", 
                                              source.data.region="F25:T265",
                                              source.colname="F16:T16", 
                                              source.date="E12", 
                                              source.countries="B25:B265",
                                              multi.col=TRUE)

