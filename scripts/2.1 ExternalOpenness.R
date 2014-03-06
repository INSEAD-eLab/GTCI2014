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