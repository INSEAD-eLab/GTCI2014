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