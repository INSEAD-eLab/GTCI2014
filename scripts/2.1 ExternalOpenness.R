## UNCTAD data has same format as UNESCO and used that function
################### FDI inflow
FDI.inflow <- get.UNESCO.format(source.file="[R] [UNCTAD] FDI inflow.xlsx",
                                source.sheet="us_fdiflows_fdi_59731862178918", 
                                source.data.region="A8:AR244",
                                source.colnames="A6:AR6", 
                                result.colnames="FDI.inflow",
                                result.cut.year=2003,
                                format="UNCTAD")


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

################# Prevalence of foreign ownership
Prevalence.foreign.ownership <- get.WEF(source.file="WEF.xlsx", 
                                          source.sheet="Sheet1", 
                                          source.data.region="BI8:BI155",
                                          source.colname="BI6", 
                                          source.date="C7", 
                                          source.countries="C8:C155")

################################# Net migration

## WDI data has same format as UNESCO and used that function
net.migration <- get.UNESCO.format(source.file="[R] [WDI] Net migration (stock) five-year estimates.xls",
                                           source.sheet="Data", 
                                           source.data.region="BD4:BD255",
                                           source.colnames="BC3:BD3", 
                                           result.colnames="net.migration",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A4:A255")
## scaled with population data
net.migration.scaled <- scaling(numertor=net.migration, 
                                numerator.colname="net.migration",
                                denominator.file="[R] [UN] Population.xls", 
                                denominator.sheet="CONSTANT FERTILITY",
                                denominator.countries="C27:C285", 
                                denominator.data.region="F27:I285", 
                                denominator.years="F17:I17", 
                                result.colname="Total population, both sexes combined, as of 1 July (thousands)",
                                multiplier=0.001)

## remove the country group and income group 
net.migration.scaled <- net.migration.scaled[complete.cases(net.migration.scaled),]

## calculation for growth
## WDI data has same format as UNESCO and used that function
net.migration.2007 <- get.UNESCO.format(source.file="[R] [WDI] Net migration (stock) five-year estimates.xls",
                                   source.sheet="Data", 
                                   source.data.region="AY4:AY255",
                                   source.colnames="AX3:AY3", 
                                   result.colnames="net.migration",
                                   result.cut.year=2003,
                                   names.separated=TRUE, 
                                   country.names="A4:A255")

net.migration.growth <- merge(net.migration.2007, net.migration, by=c("ISO3", "Country.Name"))
net.migration.growth[, "growth"] <- (net.migration.growth[, 6] - net.migration.growth[, 4]) / net.migration.growth[, 4]


################# end of net migration

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table12Total <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                                    source.sheet="Table 12", 
                                                    source.data.region="T25:T281",
                                                    source.colname="T16", 
                                                    source.date="E10", 
                                                    source.countries="B25:B281")

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table11Total <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                                    source.sheet="Table 11", 
                                                    source.data.region="T25:T281",
                                                    source.colname="T16", 
                                                    source.date="E10", 
                                                    source.countries="B25:B281")


# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table4 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 4", 
                                              source.data.region="F25:T281",
                                              source.colname="F16:T16", 
                                              source.date="E10", 
                                              source.countries="B25:B281",
                                              multi.col=TRUE)

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table3 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 3", 
                                              source.data.region="F25:T281",
                                              source.colname="F16:T16", 
                                              source.date="E10", 
                                              source.countries="B25:B281",
                                              multi.col=TRUE)

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table8 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 8", 
                                              source.data.region="F25:T265",
                                              source.colname="F16:T16", 
                                              source.date="E10", 
                                              source.countries="B25:B265",
                                              multi.col=TRUE)

# UN data format can be used with WEF function
################# International migrant stock
International.migrant.stock.table7 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                              source.sheet="Table 7", 
                                              source.data.region="F25:T265",
                                              source.colname="F16:T16", 
                                              source.date="E10", 
                                              source.countries="B25:B265",
                                              multi.col=TRUE)

## UNCTAD data has same format as UNESCO and used that function
################### Remittance receipts
remittance.receipts <- get.UNESCO.format(source.file="[R] [UNCTAD] Remittance receipts.xlsx",
                                         source.sheet="us_remittances_59770250149134", 
                                         source.data.region="A8:AH244",
                                         source.colnames="A6:AH6", 
                                         result.colnames="remittance.inflow",
                                         result.cut.year=2003,
                                         format="UNCTAD")

## UNCTAD data has same format as UNESCO and used that function
################### Remittance payments
remittance.payments <- get.UNESCO.format(source.file="[R] [UNCTAD] Remittance payments.xlsx",
                                         source.sheet="us_remittances_59777731429002", 
                                         source.data.region="A8:AH244",
                                         source.colnames="A6:AH6", 
                                         result.colnames="remittance.outflow",
                                         result.cut.year=2003,
                                         format="UNCTAD")
