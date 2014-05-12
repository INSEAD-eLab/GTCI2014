
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


## labor force
## change the variables to choose
labor.force <- get.ILO.latest( source.file="labour force.csv",
                               source.sheet="KILM 1a",
                               source.region="A3:G104331", 
                               source.gender="MF",
                               source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force...000."),
                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force.000"),
                               source.age="15-64",
                               result.cut.year=2003,
                               data.format="csv")


################################# Gini Coefficients index
GINI <- get.UNESCO.format(source.file="[R] [WB WDI] Gini coefficient.xls",
                          source.sheet="Data", 
                          source.data.region="AV4:BE254",
                          source.colnames="AU3:BE3", 
                          result.colnames="GINI index",
                          result.cut.year=2003,
                          names.separated=TRUE, 
                          country.names="A4:A254")

############# GDP PPP 2013
GDP.PPP.2013 <- get.WEF(source.file="[R] [IMF] WEO GDP PPP$ (denominator).xls", 
                      source.sheet="weoreptc.aspx", 
                      source.data.region="J2:J189",
                      source.colname="B2", 
                      source.date="J1", 
                      source.countries="A2:A189")