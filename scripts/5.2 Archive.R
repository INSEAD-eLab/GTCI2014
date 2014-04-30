################################# youth employment 15-24 (male)
gc()
youth.employment.male <- get.ILO.latest( source.file="[R] [ILO] Youth employment.xls",
                                         source.sheet="KILM 2a",
                                         source.region="A3:L35247", 
                                         source.gender="M",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment..to.population.ratio"),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment to population ratio of youth"),
                                         source.age="15-24",
                                         result.cut.year=2003)

################################# youth employment 15-24 (female)
gc()
youth.employment.female <- get.ILO.latest( source.file="[R] [ILO] Youth employment.xls",
                                           source.sheet="KILM 2a",
                                           source.region="A3:L35247", 
                                           source.gender="F",
                                           source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment..to.population.ratio"),
                                           result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment to population ratio of youth"),
                                           source.age="15-24",
                                           result.cut.year=2003)

################################# youth unemployment 15-24
gc()
youth.unemployment.all <- get.ILO.latest( source.file="[R] [ILO] Youth unemployment (ALL indicators).xls",
                                          source.sheet="KILM 10a",
                                          source.region="A3:P11751", 
                                          source.gender="MF",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Youth.unemployment.rate....", 
                                                            "Ratio.of.youth.unemployment.rate.to.adult.unemployment.rate", "Share.of.youth.unemployed.in.total.unemployed....",
                                                            "Share.of.youth.unemployed.in.youth.population...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Youth unemployment rate (percent)",
                                                            "Ratio of youth unemployment rate to adult unemployment rate", "Share of youth unemployed in total unemployed (percent)",
                                                            "Share of youth unemployed in youth population (percent)"),
                                          result.cut.year=2003)


################################# secondary educated workforce 25+ (female)
gc()
secondary.educated.population.above25.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Secondary educated workforce.xls",
                                                                    source.sheet="KILM 14a",
                                                                    source.region="A3:R15210", 
                                                                    source.gender="F",
                                                                    source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary...."),
                                                                    result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary (percent)"),
                                                                    source.age="25+",
                                                                    result.cut.year=2003)

################################# secondary educated workforce 15+ (female)
gc()
secondary.educated.population.above15.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Secondary educated workforce.xls",
                                                                    source.sheet="KILM 14a",
                                                                    source.region="A3:R15210", 
                                                                    source.gender="F",
                                                                    source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary...."),
                                                                    result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary (percent)"),
                                                                    source.age="15+",
                                                                    result.cut.year=2003)

## countries in above 15 but not in 25
setdiff(secondary.educated.population.above15.ILO.female$Country.Name, secondary.educated.population.above25.ILO.female$Country.Name)

## countries in above 25 but not in 15
setdiff(secondary.educated.population.above25.ILO.female$Country.Name, secondary.educated.population.above15.ILO.female$Country.Name)

## adding US data
secondary.educated.population.above15.ILO.female.usa <- rbind(secondary.educated.population.above15.ILO.female, secondary.educated.population.above25.ILO.female[secondary.educated.population.above25.ILO.female$Country.Name == "united states",])


################ Labour productivity per hour employed
labour.productivity.per.hour.employed <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                             source.sheet="LP-Hour EKS",
                                                             source.countries="B3:EM3",
                                                             source.data.region="B69:EM69",
                                                             source.date.field="A69",
                                                             result.colname="labour productivity per hour employed",
                                                             single.year=TRUE)


################ total factor productivity growth
total.factor.productivity.growth <- get.conferenceboard(source.file="[R] [TCB] Total factor productivity growth.xls",
                                                        source.sheet="TFP %",
                                                        source.countries="B3:EM3",
                                                        source.data.region="B6:EM29",
                                                        source.date.field="A6:A29",
                                                        result.colname="total factor productivity growth",
                                                        single.year=FALSE)

############### Labour productivity per person employed, growth 
labour.productivity.per.person.employed.2013 <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                                    source.sheet="LP-person EKS",
                                                                    source.countries="B3:EM3",
                                                                    source.data.region="B69:EM69",
                                                                    source.date.field="A69",
                                                                    result.colname="labour productivity per person employed", 
                                                                    single.year=TRUE)

labour.productivity.per.person.employed.2012 <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                                    source.sheet="LP-person EKS",
                                                                    source.countries="B3:EM3",
                                                                    source.data.region="B68:EM68",
                                                                    source.date.field="A68",
                                                                    result.colname="labour productivity per person employed", 
                                                                    single.year=TRUE)

labour.productivity.per.person.employed.growth <- merge(labour.productivity.per.person.employed.2013, labour.productivity.per.person.employed.2012, by=c("ISO3", "Country.Name"))
labour.productivity.per.person.employed.growth[,"growth"] <- (labour.productivity.per.person.employed.growth[, 3] - labour.productivity.per.person.employed.growth[, 5])/labour.productivity.per.person.employed.growth[, 5]
colnames(labour.productivity.per.person.employed.growth) <- c("ISO3", "Country.Name", "Labour productivity per person employed (2013)", "Year" ,"Labour productivity per person employed (2012)", "Year", "growth (2013-2012)/2012")


############# end of Labour productivity per person employed, growth 


tech.asso.68.MF.latest <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Technicians and associate professionals.xls",
                                          source.sheet="KILM 5c",
                                          source.region="A3:AN1976", 
                                          source.gender="MF",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X0.1...000.", "X0.1....", "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                            "01.000.68", "01.percent.68", "2.000.68", "2.percent.68"),
                                          result.cut.year=2003)


tech.asso.68.F.latest <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5c",
                                         source.region="A3:AN1976", 
                                         source.gender="F",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                           "X0.1...000.", "X0.1....", "X2...000.", "X2...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                           "01.000.68", "01.percent.68", "2.000.68", "2.percent.68"),
                                         result.cut.year=2003)