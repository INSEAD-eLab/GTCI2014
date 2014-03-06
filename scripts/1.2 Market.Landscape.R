
################# Gross expenditure on R&D
R.D.expenditure <- get.UNESCO.format(source.file="[R] [UNESCO] Gross expenditure on R&D (% of GDP).xls",
                                     source.sheet="download-8", 
                                     source.data.region="A6:R220",
                                     source.colnames="A4:R4", 
                                     result.colnames="RnD.expenditure",
                                     result.cut.year=2003)

################# Business Government relation
intensity.local.competition <- get.WEF(source.file="WEF.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="BK8:BK155",
                                  source.colname="BK6", 
                                  source.date="C7", 
                                  source.countries="C8:C155")

################# Venture capital availability
Venture.capital.availability <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="AX8:AX155",
                                        source.colname="AX6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")