################# Extent and effect of taxation (on incentives to work)
Extent.effect.taxation.on.incentives.to.work <- get.WEF(source.file="WEF.xlsx", 
                                                    source.sheet="Sheet1", 
                                                    source.data.region="CO8:CO155",
                                                    source.colname="CO6", 
                                                    source.date="C7", 
                                                    source.countries="C8:C155")


################# Extent and effect of taxation (on incentives to invest)
Extent.effect.taxation.on.incentives.to.invest <- get.WEF(source.file="WEF.xlsx", 
                                                        source.sheet="Sheet1", 
                                                        source.data.region="CP8:CP155",
                                                        source.colname="CP6", 
                                                        source.date="C7", 
                                                        source.countries="C8:C155")


## WDI data has same format as UNESCO and used that function
################################# Labour tax and contributions
Labour.tax.and.contributions <- get.UNESCO.format(source.file="[R] [WDI] Labour tax and contributions.xls",
                                           source.sheet="Data", 
                                           source.data.region="BD4:BE255",
                                           source.colnames="BC3:BE3", 
                                           result.colnames="Labour.tax.and.contributions",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A4:A255")