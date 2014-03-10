
################# Nature of competitive advantage
Nature.competitive.advantage <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="BS8:BS155",
                                        source.colname="BS6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


# UN data format can be used with WEF function
################# population
population <- get.WEF(source.file="[R] [UN] Population.xls", 
                      source.sheet="CONSTANT FERTILITY", 
                      source.data.region="I27:I285",
                      source.colname="F16", 
                      source.date="I17", 
                      source.countries="C27:C285")

population[, "total population"] <- population[,2]*1000
