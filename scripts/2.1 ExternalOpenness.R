## UNCTAD data has same format as UNESCO and used that function
################### FDI inflow
FDI.inflow <- get.UNESCO.format(source.file="[R] [UNCTAD] FDI inflow.xlsx",
                                source.sheet="us_fdiflows_fdi_59731862178918", 
                                source.data.region="A8:AR244",
                                source.colnames="A6:AR6", 
                                result.colnames="FDI.inflow",
                                result.cut.year=2003,
                                format="UNCTAD")

FDI.inflow <- FDI.inflow[!(FDI.inflow$ISO3 == "SDN" & FDI.inflow$Year == 2011), ]
FDI.inflow <- FDI.inflow[!(FDI.inflow$ISO3 == "SRB" & FDI.inflow$Year == 2007), ]


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

################ Average of country capacity to attract and retain talent
Average.country.capacity.retain.attract <- merge(Country.capacity.attract.talent, Country.capacity.retain.talent, by=c("Country.Name", "Year", "ISO3"), sort=FALSE)
Average.country.capacity.retain.attract[, "Average of retain and attract"] <- (Average.country.capacity.retain.attract[, "Country capacity to retain talent"] + Average.country.capacity.retain.attract[, "Country capacity to attract talent"])/2

################# Employing Skilled Expatriates
Employing.Skilled.Expatriates <- get.WEF(source.file="[R] [WB] Employing skilled expatriates index.xlsx", 
                                   source.sheet="Sheet1", 
                                   source.data.region="M4:M96",
                                   source.colname="M3", 
                                   source.date="O4", 
                                   source.countries="B4:B96")

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




################# International migrant stock (15 - 64)

total.migrants.15.64 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                source.sheet="Table 4", 
                                source.data.region="I25:R281",
                                source.colname="I16:R16", 
                                source.date="E10", 
                                source.countries="B25:B281",
                                multi.col=TRUE)

total.migrants.15.64.name <- total.migrants.15.64[, c(1,12,13)]
total.migrants.15.64.data <- total.migrants.15.64[, c(2:11)]
total.migrants.15.64.data[, "total.15.64"] <- apply(total.migrants.15.64.data, 1, function(row) sum(row, na.rm=T))
total.migrants.15.64 <- cbind(total.migrants.15.64.name, total.migrants.15.64.data[, 11, drop=F])
total.migrants.15.64[, "Year"] <- as.numeric(substr(total.migrants.15.64[, "Year"], nchar(total.migrants.15.64[, "Year"])-3, nchar(total.migrants.15.64[, "Year"])))

rm(total.migrants.15.64.name, total.migrants.15.64.data)

population.15.64 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                source.sheet="Table 8", 
                                source.data.region="I25:R281",
                                source.colname="I16:R16", 
                                source.date="E10", 
                                source.countries="B25:B281",
                                multi.col=TRUE)

population.15.64.name <- population.15.64[, c(1,12,13)]
population.15.64.data <- population.15.64[, c(2:11)]
population.15.64.data[, "pop.15.64"] <- apply(population.15.64.data, 1, function(row) sum(row, na.rm=T))
population.15.64 <- cbind(population.15.64.name, population.15.64.data[, 11, drop=F])
population.15.64[, "Year"] <- as.numeric(substr(population.15.64[, "Year"], nchar(population.15.64[, "Year"])-15, nchar(population.15.64[, "Year"])-12))
population.15.64[, "pop.15.64"] <- population.15.64[, "pop.15.64"]*1000

rm(population.15.64.name, population.15.64.data)

total.migrants.15.64 <- merge(total.migrants.15.64, population.15.64, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.15.64[, "ratio"] <- total.migrants.15.64[, "total.15.64"]/total.migrants.15.64[, "pop.15.64"]
colnames(total.migrants.15.64) <- c("Country.Name", "ISO3", "Year", "Total migrants (age 15-64)", "Population (age 15-64)", "Ratio")

############################################################################# end of International migrant stock (below 25)

################# International migrant stock (below 25)

total.migrants.below.25 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                source.sheet="Table 4", 
                                source.data.region="F25:J281",
                                source.colname="F16:J16", 
                                source.date="E10", 
                                source.countries="B25:B281",
                                multi.col=TRUE)

total.migrants.below.25.name <- total.migrants.below.25[, c(1,7,8)]
total.migrants.below.25.data <- total.migrants.below.25[, c(2:6)]
total.migrants.below.25.data[, "below.25"] <- apply(total.migrants.below.25.data, 1, function(row) sum(row, na.rm=T))
total.migrants.below.25 <- cbind(total.migrants.below.25.name, total.migrants.below.25.data[, 6, drop=F])
total.migrants.below.25[, "Year"] <- as.numeric(substr(total.migrants.below.25[, "Year"], nchar(total.migrants.below.25[, "Year"])-3, nchar(total.migrants.below.25[, "Year"])))

rm(total.migrants.below.25.name, total.migrants.below.25.data)

population.below.25 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                            source.sheet="Table 8", 
                            source.data.region="F25:J281",
                            source.colname="F16:J16",
                            source.date="E10", 
                            source.countries="B25:B281",
                            multi.col=TRUE)

population.below.25.name <- population.below.25[, c(1,7,8)]
population.below.25.data <- population.below.25[, c(2:6)]
population.below.25.data[, "pop.below.25"] <- apply(population.below.25.data, 1, function(row) sum(row, na.rm=T))
population.below.25 <- cbind(population.below.25.name, population.below.25.data[, 6, drop=F])
population.below.25[, "Year"] <- as.numeric(substr(population.below.25[, "Year"], nchar(population.below.25[, "Year"])-15, nchar(population.below.25[, "Year"])-12))
population.below.25[, "pop.below.25"] <- population.below.25[, "pop.below.25"]*1000

rm(population.below.25.name, population.below.25.data)

total.migrants.below.25 <- merge(total.migrants.below.25, population.below.25, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.below.25[, "ratio"] <- total.migrants.below.25[, "below.25"]/total.migrants.below.25[, "pop.below.25"]
colnames(total.migrants.below.25) <- c("Country.Name", "ISO3", "Year", "Total migrants (age below 25)", "Population (age below 25)", "Ratio")
############################################################################# end of International migrant stock (below 25)

################# International migrant stock (above 25)

total.migrants.above.25 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                   source.sheet="Table 4", 
                                   source.data.region="K25:S281",
                                   source.colname="K16:S16", 
                                   source.date="E10", 
                                   source.countries="B25:B281",
                                   multi.col=TRUE)

total.migrants.above.25.name <- total.migrants.above.25[, c(1,11,12)]
total.migrants.above.25.data <- total.migrants.above.25[, c(2:10)]
total.migrants.above.25.data[, "above.25"] <- apply(total.migrants.above.25.data, 1, function(row) sum(row, na.rm=T))
total.migrants.above.25 <- cbind(total.migrants.above.25.name, total.migrants.above.25.data[, 10, drop=F])
total.migrants.above.25[, "Year"] <- as.numeric(substr(total.migrants.above.25[, "Year"], nchar(total.migrants.above.25[, "Year"])-3, nchar(total.migrants.above.25[, "Year"])))

rm(total.migrants.above.25.name, total.migrants.above.25.data)

population.above.25 <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                               source.sheet="Table 8", 
                               source.data.region="K25:S281",
                               source.colname="K16:S16",
                               source.date="E10", 
                               source.countries="B25:B281",
                               multi.col=TRUE)

population.above.25.name <- population.above.25[, c(1,11,12)]
population.above.25.data <- population.above.25[, c(2:10)]
population.above.25.data[, "pop.above.25"] <- apply(population.above.25.data, 1, function(row) sum(row, na.rm=T))
population.above.25 <- cbind(population.above.25.name, population.above.25.data[, 10, drop=F])
population.above.25[, "Year"] <- as.numeric(substr(population.above.25[, "Year"], nchar(population.above.25[, "Year"])-15, nchar(population.above.25[, "Year"])-12))
population.above.25[, "pop.above.25"] <- population.above.25[, "pop.above.25"]*1000

rm(population.above.25.name, population.above.25.data)

total.migrants.above.25 <- merge(total.migrants.above.25, population.above.25, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.above.25[, "ratio"] <- total.migrants.above.25[, "above.25"]/total.migrants.above.25[, "pop.above.25"]
colnames(total.migrants.above.25) <- c("Country.Name", "ISO3", "Year", "Total migrants (age above 25)", "Population (age above 25)", "Ratio")

############################################################################# end of International migrant stock (above 25)


################# International migrant stock (below 25 male)

total.migrants.below.25.male <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                   source.sheet="Table 4", 
                                   source.data.region="U25:Y281",
                                   source.colname="U16:Y16", 
                                   source.date="E10", 
                                   source.countries="B25:B281",
                                   multi.col=TRUE)

total.migrants.below.25.male.name <- total.migrants.below.25.male[, c(1,7,8)]
total.migrants.below.25.male.data <- total.migrants.below.25.male[, c(2:6)]
total.migrants.below.25.male.data[, "below.25.male"] <- apply(total.migrants.below.25.male.data, 1, function(row) sum(row, na.rm=T))
total.migrants.below.25.male <- cbind(total.migrants.below.25.male.name, total.migrants.below.25.male.data[, 6, drop=F])
total.migrants.below.25.male[, "Year"] <- as.numeric(substr(total.migrants.below.25.male[, "Year"], nchar(total.migrants.below.25.male[, "Year"])-3, nchar(total.migrants.below.25.male[, "Year"])))

rm(total.migrants.below.25.male.name, total.migrants.below.25.male.data)

population.below.25.male <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                               source.sheet="Table 8", 
                               source.data.region="U25:Y281",
                               source.colname="U16:Y16",
                               source.date="E10", 
                               source.countries="B25:B281",
                               multi.col=TRUE)

population.below.25.male.name <- population.below.25.male[, c(1,7,8)]
population.below.25.male.data <- population.below.25.male[, c(2:6)]
population.below.25.male.data[, "pop.below.25.male"] <- apply(population.below.25.male.data, 1, function(row) sum(row, na.rm=T))
population.below.25.male <- cbind(population.below.25.male.name, population.below.25.male.data[, 6, drop=F])
population.below.25.male[, "Year"] <- as.numeric(substr(population.below.25.male[, "Year"], nchar(population.below.25.male[, "Year"])-15, nchar(population.below.25.male[, "Year"])-12))
population.below.25.male[, "pop.below.25.male"] <- population.below.25.male[, "pop.below.25.male"]*1000

rm(population.below.25.male.name, population.below.25.male.data)

total.migrants.below.25.male <- merge(total.migrants.below.25.male, population.below.25.male, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.below.25.male[, "ratio"] <- total.migrants.below.25.male[, "below.25.male"]/total.migrants.below.25.male[, "pop.below.25.male"]
colnames(total.migrants.below.25.male) <- c("Country.Name", "ISO3", "Year", "Male below 25", "Population below 25", "Ratio")

############################################################################# end of International migrant stock (below 25 male)


################# International migrant stock (below 25 female)

total.migrants.below.25.female <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                        source.sheet="Table 4", 
                                        source.data.region="AJ25:AN281",
                                        source.colname="AJ16:AN16", 
                                        source.date="E10", 
                                        source.countries="B25:B281",
                                        multi.col=TRUE)

total.migrants.below.25.female.name <- total.migrants.below.25.female[, c(1,7,8)]
total.migrants.below.25.female.data <- total.migrants.below.25.female[, c(2:6)]
total.migrants.below.25.female.data[, "below.25.female"] <- apply(total.migrants.below.25.female.data, 1, function(row) sum(row, na.rm=T))
total.migrants.below.25.female <- cbind(total.migrants.below.25.female.name, total.migrants.below.25.female.data[, 6, drop=F])
total.migrants.below.25.female[, "Year"] <- as.numeric(substr(total.migrants.below.25.female[, "Year"], nchar(total.migrants.below.25.female[, "Year"])-3, nchar(total.migrants.below.25.female[, "Year"])))

rm(total.migrants.below.25.female.name, total.migrants.below.25.female.data)

population.below.25.female <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                    source.sheet="Table 8", 
                                    source.data.region="AJ25:AN281",
                                    source.colname="AJ16:AN16",
                                    source.date="E10", 
                                    source.countries="B25:B281",
                                    multi.col=TRUE)

population.below.25.female.name <- population.below.25.female[, c(1,7,8)]
population.below.25.female.data <- population.below.25.female[, c(2:6)]
population.below.25.female.data[, "pop.below.25.female"] <- apply(population.below.25.female.data, 1, function(row) sum(row, na.rm=T))
population.below.25.female <- cbind(population.below.25.female.name, population.below.25.female.data[, 6, drop=F])
population.below.25.female[, "Year"] <- as.numeric(substr(population.below.25.female[, "Year"], nchar(population.below.25.female[, "Year"])-15, nchar(population.below.25.female[, "Year"])-12))
population.below.25.female[, "pop.below.25.female"] <- population.below.25.female[, "pop.below.25.female"]*1000

rm(population.below.25.female.name, population.below.25.female.data)

total.migrants.below.25.female <- merge(total.migrants.below.25.female, population.below.25.female, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.below.25.female[, "ratio"] <- total.migrants.below.25.female[, "below.25.female"]/total.migrants.below.25.female[, "pop.below.25.female"]
colnames(total.migrants.below.25.female) <- c("Country.Name", "ISO3", "Year", "Female below 25", "Population below 25", "Ratio")

############################################################################# end of International migrant stock (below 25 female)

################# International migrant stock (above 25 male)

total.migrants.above.25.male <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                   source.sheet="Table 4", 
                                   source.data.region="Z25:AH281",
                                   source.colname="Z16:AH16", 
                                   source.date="E10", 
                                   source.countries="B25:B281",
                                   multi.col=TRUE)

total.migrants.above.25.male.name <- total.migrants.above.25.male[, c(1,11,12)]
total.migrants.above.25.male.data <- total.migrants.above.25.male[, c(2:10)]
total.migrants.above.25.male.data[, "above.25.male"] <- apply(total.migrants.above.25.male.data, 1, function(row) sum(row, na.rm=T))
total.migrants.above.25.male <- cbind(total.migrants.above.25.male.name, total.migrants.above.25.male.data[, 10, drop=F])
total.migrants.above.25.male[, "Year"] <- as.numeric(substr(total.migrants.above.25.male[, "Year"], nchar(total.migrants.above.25.male[, "Year"])-3, nchar(total.migrants.above.25.male[, "Year"])))

rm(total.migrants.above.25.male.name, total.migrants.above.25.male.data)

population.above.25.male <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                               source.sheet="Table 8", 
                               source.data.region="Z25:AH281",
                               source.colname="Z16:AH16",
                               source.date="E10", 
                               source.countries="B25:B281",
                               multi.col=TRUE)

population.above.25.male.name <- population.above.25.male[, c(1,11,12)]
population.above.25.male.data <- population.above.25.male[, c(2:10)]
population.above.25.male.data[, "pop.above.25.male"] <- apply(population.above.25.male.data, 1, function(row) sum(row, na.rm=T))
population.above.25.male <- cbind(population.above.25.male.name, population.above.25.male.data[, 10, drop=F])
population.above.25.male[, "Year"] <- as.numeric(substr(population.above.25.male[, "Year"], nchar(population.above.25.male[, "Year"])-15, nchar(population.above.25.male[, "Year"])-12))
population.above.25.male[, "pop.above.25.male"] <- population.above.25.male[, "pop.above.25.male"]*1000

rm(population.above.25.male.name, population.above.25.male.data)

total.migrants.above.25.male <- merge(total.migrants.above.25.male, population.above.25.male, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.above.25.male[, "ratio"] <- total.migrants.above.25.male[, "above.25.male"]/total.migrants.above.25.male[, "pop.above.25.male"]
colnames(total.migrants.above.25.male) <- c("Country.Name", "ISO3", "Year", "Male above 25", "Population above 25", "Ratio")


############################################################################# end of International migrant stock (above 25 male)


################# International migrant stock (above 25 female)

total.migrants.above.25.female <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                        source.sheet="Table 4", 
                                        source.data.region="AO25:AW281",
                                        source.colname="AO16:AW16", 
                                        source.date="E10", 
                                        source.countries="B25:B281",
                                        multi.col=TRUE)

total.migrants.above.25.female.name <- total.migrants.above.25.female[, c(1,11,12)]
total.migrants.above.25.female.data <- total.migrants.above.25.female[, c(2:10)]
total.migrants.above.25.female.data[, "above.25.female"] <- apply(total.migrants.above.25.female.data, 1, function(row) sum(row, na.rm=T))
total.migrants.above.25.female <- cbind(total.migrants.above.25.female.name, total.migrants.above.25.female.data[, 10, drop=F])
total.migrants.above.25.female[, "Year"] <- as.numeric(substr(total.migrants.above.25.female[, "Year"], nchar(total.migrants.above.25.female[, "Year"])-3, nchar(total.migrants.above.25.female[, "Year"])))

rm(total.migrants.above.25.female.name, total.migrants.above.25.female.data)

population.above.25.female <- get.WEF(source.file="[R] [UN] International migrant stock.xls", 
                                    source.sheet="Table 8", 
                                    source.data.region="AO25:AW281",
                                    source.colname="AO16:AW16",
                                    source.date="E10", 
                                    source.countries="B25:B281",
                                    multi.col=TRUE)

population.above.25.female.name <- population.above.25.female[, c(1,11,12)]
population.above.25.female.data <- population.above.25.female[, c(2:10)]
population.above.25.female.data[, "pop.above.25.female"] <- apply(population.above.25.female.data, 1, function(row) sum(row, na.rm=T))
population.above.25.female <- cbind(population.above.25.female.name, population.above.25.female.data[, 10, drop=F])
population.above.25.female[, "Year"] <- as.numeric(substr(population.above.25.female[, "Year"], nchar(population.above.25.female[, "Year"])-15, nchar(population.above.25.female[, "Year"])-12))
population.above.25.female[, "pop.above.25.female"] <- population.above.25.female[, "pop.above.25.female"]*1000

rm(population.above.25.female.name, population.above.25.female.data)

total.migrants.above.25.female <- merge(total.migrants.above.25.female, population.above.25.female, by=c("Country.Name", "ISO3", "Year"), sort=F, all.x=T)
total.migrants.above.25.female[, "ratio"] <- total.migrants.above.25.female[, "above.25.female"]/total.migrants.above.25.female[, "pop.above.25.female"]
colnames(total.migrants.above.25.female) <- c("Country.Name", "ISO3", "Year", "Female above 25", "Population above 25", "Ratio")

############################################################################# end of International migrant stock (above 25 female)


####### WDI data has same format as UNESCO and used that function
################### Personal remittances
Personal.remittances.received <- get.UNESCO.format(source.file="[R] [WDI] Personal remittances.xls",
                                        source.sheet="Data", 
                                        source.data.region="AU4:BD254",
                                        source.colnames="AT3:BD3", 
                                        result.colnames="Personal.remittances.received",
                                        result.cut.year=2003,
                                        names.separated=TRUE, 
                                        country.names="A4:A254")

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
