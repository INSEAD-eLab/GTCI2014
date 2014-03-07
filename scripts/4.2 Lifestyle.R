
## WDI data has same format as UNESCO and used that function
################################# Improved water source
improved.sanitation.facilities <- get.UNESCO.format(source.file="[R] [WDI] Improved sanitation facilities.xls",
                                                    source.sheet="Data", 
                                                    source.data.region="AH4:BC255",
                                                    source.colnames="AG3:BC3", 
                                                    result.colnames="improved.sanitation.facilities",
                                                    result.cut.year=2003,
                                                    names.separated=TRUE, 
                                                    country.names="A4:A255")


## WDI data has same format as UNESCO and used that function
################################# Improved water source
improved.water.source <- get.UNESCO.format(source.file="[R] [WDI] Improved water source.xls",
                                           source.sheet="Data", 
                                           source.data.region="AH4:BC255",
                                           source.colnames="AG3:BC3", 
                                           result.colnames="improved.water.source",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A4:A255")


## WDI data has same format as UNESCO and used that function
################################# Physicians density
Physicians.density <- get.UNESCO.format(source.file="[R] [WDI] Physicians density.xls",
                                           source.sheet="Data", 
                                           source.data.region="AU4:BD255",
                                           source.colnames="AT3:BD3", 
                                           result.colnames="Physicians.density",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A4:A255")


## UNODC data has same format as UNESCO and used that function
################################# Labour tax and contributions
Intentional.homicide <- get.UNESCO.format(source.file="[R] [UNODC] Intentional homicide.xls",
                                          source.sheet="UNODC Homicide Statistics", 
                                          source.data.region="O8:W424",
                                          source.colnames="N7:W7", 
                                          result.colnames="Intentional.homicide",
                                          result.cut.year=2003,
                                          names.separated=TRUE, 
                                          country.names="C8:C424")

