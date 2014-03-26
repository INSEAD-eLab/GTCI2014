# UNESCO data format but this is weird and will use WEF function
################# Secondary educated workforce
secondary.educated.population.above25.UNESCO <- get.WEF(source.file="[R] [UNESCO] Secondary educated population.xls", 
                                                        source.sheet="Educational Attainment_by Level", 
                                                        source.data.region="C7:C230",
                                                        source.colname="C2", 
                                                        source.date="B7:B230", 
                                                        source.countries="A7:A230",
                                                        cut.off.year=2003,
                                                        different.source=TRUE)


# UNESCO data format but this is weird and will use WEF function
################# Secondary educated workforce
## Note : 3 country data are copied from other categories. Please check original sheet.
secondary.educated.population.upperSec.UNESCO <- get.WEF(source.file="[R] [UNESCO] Secondary educated population.xls", 
                                                        source.sheet="Educational Attainment_by Level", 
                                                        source.data.region="R7:R230",
                                                        source.colname="R2", 
                                                        source.date="B7:B230", 
                                                        source.countries="A7:A230",
                                                        cut.off.year=2003,
                                                        different.source=TRUE)

################################# youth employment 15-24
gc()
youth.employment <- get.ILO.latest( source.file="[R] [ILO] Youth employment.xls",
                                    source.sheet="KILM 2a",
                                    source.region="A3:L35247", 
                                    source.gender="MF",
                                    source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment..to.population.ratio"),
                                    result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Employment to population ratio of youth"),
                                    source.age="15-24",
                                    result.cut.year=2003)

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

################################# NEET 15-24
gc()
NEET <- get.ILO.latest( source.file="[R] [ILO] NEET.xls",
                        source.sheet="KILM 10c",
                        source.region="A3:H2197", 
                        source.gender="MF",
                        source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age", "NEET.rate...."),
                        result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age", "NEET rate percent"),
                        result.cut.year=2003)


################################# youth inactivity rate 15-24
gc()
youth.inactivity.rate <- get.ILO.latest( source.file="inactivity rate.csv",
                                         source.sheet="KILM 13",
                                         source.region="A3:I104331", 
                                         source.gender="MF",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Inactivity.rate...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "inactivity.rate.percent"),
                                         source.age="15-24",
                                         result.cut.year=2003,
                                         data.format="csv")

################################# secondary educated workforce 25+
gc()
secondary.educated.population.above25.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Secondary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:R15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary (percent)"),
                                                                  source.age="25+",
                                                                  result.cut.year=2003)

################################# secondary educated workforce 15+
gc()
secondary.educated.population.above15.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Secondary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:R15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Secondary (percent)"),
                                                                  source.age="15+",
                                                                  result.cut.year=2003)

## countries in above 15 but not in 25
setdiff(secondary.educated.population.above15.ILO.total$Country.Name, secondary.educated.population.above25.ILO.total$Country.Name)

## countries in above 25 but not in 15
setdiff(secondary.educated.population.above25.ILO.total$Country.Name, secondary.educated.population.above15.ILO.total$Country.Name)

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

################# Technicians and associate professionals
##
## Possible colnames for tech and associates (68, 88, 08)
##[1] "Country..code."               "Country"                      "B"                            "Year"                         "Sex..code."                  
##[6] "Sex"                          "Total.employment...000."      "X0...000."                    "X0...."                       "X1...000."                   
##[11] "X1...."                       "X2...000."                    "X2...."                       "X3...000."                    "X3...."                      
##[16] "X4...000."                    "X4...."                       "X5...000."                    "X5...."                       "X6...000."                   
##[21] "X6...."                       "X7...000."                    "X7...."                       "X8...000."                    "X8...."                      
##[26] "X9...000."                    "X9...."                       "X...000."                     "X...."                        "Repository..code."           
##[31] "Repository"                   "Type.of.source..code."        "Type.of.source"               "Coverage..code."              "Coverage"                    
##[36] "Coverage..employment...code." "Coverage..employment."        "Age"                          "Reference.period"             "Geographic.limitation"       
##[41] "Coverage.limitation"          "Survey.limitation"            "Classification.remark"        "Notes"     


lower.skilled.88.MF.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5b", 
                                         source.region="A3:AR3888", 
                                         source.gender="MF",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.", "X1...000.", "X2...000.", "X3...000.", "X4...000.",
                                                           "X5...000.", "X6...000.", "X7...000.", "X8...000.", "X9...000."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)", "1.000.88", "2.000.88", "3.000.88", "4.000.88",
                                                           "5.000.88", "6.000.88", "7.000.88", "8.000.88", "9.000.88"),
                                         result.cut.year=2003)
lower.skilled.88.MF.latest[, "lower skilled 88 MF ratio"] <- rowSums(lower.skilled.88.MF.latest[,9:14], na.rm=TRUE)/lower.skilled.88.MF.latest[, 5]



tech.asso.68.MF.latest <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Technicians and associate professionals.xls",
                                          source.sheet="KILM 5c",
                                          source.region="A3:AN1976", 
                                          source.gender="MF",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X0.1...000.", "X0.1....", "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                            "01.000.68", "01.percent.68", "2.000.68", "2.percent.68"),
                                          result.cut.year=2003)


tech.asso.88.MF.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5b", 
                                         source.region="A3:AR3888", 
                                         source.gender="MF",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                           "X3...000.", "X3...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                           "3.000.88", "3.percent.88"),
                                         result.cut.year=2003)


tech.asso.08.MF.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-08] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5a",
                                         source.region="A3:AR217", 
                                         source.gender="MF",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                           "X3...000.", "X3...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                           "3.000.08", "3.percent.08"), 
                                         result.cut.year=2003)


## to find out which country is only available in 68 but not in 88 and 08
setdiff(tech.asso.68.MF.latest$Country.Name, union(tech.asso.88.MF.latest$Country.Name, tech.asso.08.MF.latest$Country.Name))

############# for female data

tech.asso.68.F.latest <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Technicians and associate professionals.xls",
                                          source.sheet="KILM 5c",
                                          source.region="A3:AN1976", 
                                          source.gender="F",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X0.1...000.", "X0.1....", "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                            "01.000.68", "01.percent.68", "2.000.68", "2.percent.68"),
                                          result.cut.year=2003)


tech.asso.88.F.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5b", 
                                         source.region="A3:AR3888", 
                                         source.gender="F",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                           "X3...000.", "X3...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                           "3 (000)", "3 (percent)"),
                                         result.cut.year=2003)


tech.asso.08.F.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-08] Technicians and associate professionals.xls",
                                         source.sheet="KILM 5a",
                                         source.region="A3:AR217", 
                                         source.gender="F",
                                         source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                           "X3...000.", "X3...."),
                                         result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                           "3 (000)", "3 (percent)"), 
                                         result.cut.year=2003)


###################### addition calculation of ratio

tech.asso.88.F <- merge(tech.asso.88.F.latest, tech.asso.88.MF.latest, by=c("ISO3", "Country.Name", "Year"), all.x=T)
tech.asso.88.F[, "ratio"] <- tech.asso.88.F[, "3 (000)"]/tech.asso.88.F[, "3.000.88"]

#### Take note that 4 countries has different years and they are now "NA" for total employment in tech category. 
#### (morocco, philippines, saudi arabia, uganda)
