################# Retail price index
## Variable names : RPI1 and RPI2
source("scripts/Retail price index.R")

source("scripts/LPI.R")

################# Environmental performance
environmental.performance <- get.WEF(source.file="[R] [Yale] Environmental performance.xls", 
                                  source.sheet="Indicator Scores", 
                                  source.data.region="C2:C179",
                                  source.colname="C1", 
                                  source.date="A3", 
                                  source.date.sheet="Title Page",
                                  source.countries="B2:B179",
                                  date.on.diff.sheet=TRUE)


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

################# Percentage of trained teachers (primary)
Percentage.trained.teachers.primary <- get.UNESCO.format(source.file="[R] [UNESCO] Percentage of trained teachers (primary).xlsx",
                                                         source.sheet="download-14", 
                                                         source.data.region="A6:P222",
                                                         source.colnames="A4:P4", 
                                                         result.colnames="Percentage.trained.teachers.primary",
                                                         result.cut.year=2003)

