
################# Gross expenditure on R&D
R.D.expenditure <- get.UNESCO.format(source.file="[R] [UNESCO] Gross expenditure on R&D (% of GDP).xls",
                                     source.sheet="download-8", 
                                     source.data.region="A6:R220",
                                     source.colnames="A4:R4", 
                                     result.colnames="RnD.expenditure",
                                     result.cut.year=2003)
