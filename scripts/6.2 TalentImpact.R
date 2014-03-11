## WIPO data format can be used
################# Total patent resident applications
Total.patent.resident.applications  <- get.UNESCO.format(source.file="[R] [WIPO] Total patent resident applications (numerator).xlsx",
                                             source.sheet="search", 
                                             source.data.region="C7:AI358",
                                             source.colnames="C5:AI5", 
                                             result.colnames="Total.patent.resident.applications",
                                             result.cut.year=2003,
                                             names.separated=TRUE, 
                                             country.names="A7:B358",
                                             format="WIPO",
                                             result.row="Resident")

## WIPO data format can be used
################# Total patent resident granted (direct and PCT national phase entries)
patent.resident.granted <- get.UNESCO.format(source.file="[R] [WIPO] Total patent resident grants (numerator).xlsx",
                                             source.sheet="search-1", 
                                             source.data.region="C7:AI342",
                                             source.colnames="C5:AI5", 
                                             result.colnames="patent.resident.granted",
                                             result.cut.year=2003,
                                             names.separated=TRUE, 
                                             country.names="A7:B342",
                                             format="WIPO",
                                             result.row="Resident")


################################ New business density 
New.business.density  <- get.WB.format(source.file="[R] [WB ES] New business density.xlsx",
                                         source.sheet="EntrepreneurshipData", 
                                         source.data.region="A2:E133",
                                         source.colnames="A1:E1", 
                                         source.result.col="New business density",                                         
                                         result.cut.year=2003)


## GEM data and can be used UNESCO function
################# New product entrepreneurial act
New.product.entrepreneurial.act <- get.UNESCO.format(source.file="[R] [GEM] New product entrepreneurial activity.xlsx",
                                                     source.sheet="New product entrepreneurial act", 
                                                     source.data.region="A6:L102",
                                                     source.colnames="A5:L5", 
                                                     result.colnames="New.product.entrepreneurial.act",
                                                     result.cut.year=2003,
                                                     format="GEM")

## GEM data and can be used UNESCO function
################# Established business ownership
established.business.ownership <- get.UNESCO.format(source.file="[R] [GEM] Established business ownership.xlsx",
                                                    source.sheet="Established business ownership", 
                                                    source.data.region="A6:M102",
                                                    source.colnames="A5:M5", 
                                                    result.colnames="established.business.ownership",
                                                    result.cut.year=2003,
                                                    format="GEM")

## GEM data and can be used UNESCO function
################# New Business Ownership
new.business.ownership <- get.UNESCO.format(source.file="[R] [GEM] New business ownership.xlsx",
                                     source.sheet="GEM_Dataset_20140123090048", 
                                     source.data.region="A6:M102",
                                     source.colnames="A5:M5", 
                                     result.colnames="new.business.ownership",
                                     result.cut.year=2003,
                                     format="GEM")