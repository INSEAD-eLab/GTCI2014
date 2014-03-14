# UNESCO data format but this is weird and will use WEF function
################# Tertiary educated workforce
tertiary.educated.population.above25.UNESCO <- get.WEF(source.file="[R] [UNESCO] Tertiary educated population.xls", 
                                                       source.sheet="Educational Attainment_by Level", 
                                                       source.data.region="C7:C230",
                                                       source.colname="C2", 
                                                       source.date="B7:B230", 
                                                       source.countries="A7:A230",
                                                       cut.off.year=2003,
                                                       different.source=TRUE)


# UNESCO data format but this is weird and will use WEF function
################# Tertiary educated workforce
## Note : 2 country data are copied from other categories. Cambodia and Alergia
tertiary.educated.population.tertiary.UNESCO <- get.WEF(source.file="[R] [UNESCO] Tertiary educated population.xls", 
                                                        source.sheet="Educational Attainment_by Level", 
                                                        source.data.region="X7:X230",
                                                        source.colname="X2", 
                                                        source.date="B7:B230", 
                                                        source.countries="A7:A230",
                                                        cut.off.year=2003,
                                                        different.source=TRUE)

################################# Tertiary educated workforce 25+
gc()
tertiary.educated.population.above25.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="25+",
                                                                  result.cut.year=2003)

################################# Tertiary educated workforce 15+
gc()
tertiary.educated.population.above15.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="15+",
                                                                  result.cut.year=2003)

## countries in 25 but not in 15
setdiff(tertiary.educated.population.above25.ILO.total$Country.Name, tertiary.educated.population.above15.ILO.total$Country.Name)

## countries in 15 but not in 25
setdiff(tertiary.educated.population.above15.ILO.total$Country.Name, tertiary.educated.population.above25.ILO.total$Country.Name)


################################# Tertiary educated workforce 25+ (female)
gc()
tertiary.educated.population.above25.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="F",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="25+",
                                                                  result.cut.year=2003)

################################# Tertiary educated workforce 15+ (female)
gc()
tertiary.educated.population.above15.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="F",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="15+",
                                                                  result.cut.year=2003)

## countries in 25 but not in 15
setdiff(tertiary.educated.population.above25.ILO.female$Country.Name, tertiary.educated.population.above15.ILO.female$Country.Name)

## countries in 15 but not in 25
setdiff(tertiary.educated.population.above15.ILO.female$Country.Name, tertiary.educated.population.above25.ILO.female$Country.Name)


## Possible colnames ILO data
##[1] "Country..code."               "Country"                      "B"                            "Year"                         "Sex..code."                  
##[6] "Sex"                          "Total.employment...000."      "X0...000."                    "X0...."                       "X1...000."                   
##[11] "X1...."                       "X2...000."                    "X2...."                       "X3...000."                    "X3...."                      
##[16] "X4...000."                    "X4...."                       "X5...000."                    "X5...."                       "X6...000."                   
##[21] "X6...."                       "X7...000."                    "X7...."                       "X8...000."                    "X8...."                      
##[26] "X9...000."                    "X9...."                       "X...000."                     "X...."                        "Repository..code."           
##[31] "Repository"                   "Type.of.source..code."        "Type.of.source"               "Coverage..code."              "Coverage"                    
##[36] "Coverage..employment...code." "Coverage..employment."        "Age"                          "Reference.period"             "Geographic.limitation"       
##[41] "Coverage.limitation"          "Survey.limitation"            "Classification.remark"        "Notes"   

################# Legislators, senior officials and managers 88
Legislators.senior.officials.managers.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5b",
                                                            source.region="A3:AN3888", 
                                                            source.gender="MF",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                                              "1.000.88", "1.percent.88"),
                                                            result.cut.year=2003)

################# Legislators, senior officials and managers 08
Legislators.senior.officials.managers.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5a",
                                                            source.region="A3:AN217", 
                                                            source.gender="MF",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                                              "1.000.08", "1.percent.08"),
                                                            result.cut.year=2003)

################# Legislators, senior officials and managers 68
Legislators.senior.officials.managers.68 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5c",
                                                            source.region="A3:AN1976", 
                                                            source.gender="MF",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X0.1...000.", "X0.1....","X2...000.","X2...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                                              "0/1.000.68", "0/1.percent.68", "2.000.68", "2.percent.68"),
                                                            result.cut.year=2003)

################# Female legislators, senior officials and managers 88
Female.legislators.senior.officials.managers.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Female legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5b",
                                                            source.region="A3:AN3888", 
                                                            source.gender="F",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                                              "1.000.88", "1.percent.88"),
                                                            result.cut.year=2003)

################# Female legislators, senior officials and managers 08
Female.legislators.senior.officials.managers.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Female legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5a",
                                                            source.region="A3:AN217", 
                                                            source.gender="F",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                                              "1.000.08", "1.percent.08"),
                                                            result.cut.year=2003)

################# Female legislators, senior officials and managers 68
Female.legislators.senior.officials.managers.68 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Female legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5c",
                                                            source.region="A3:AN1976", 
                                                            source.gender="F",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X0.1...000.", "X0.1....","X2...000.","X2...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.68",
                                                                              "0/1.000.68", "0/1.percent.68", "2.000.68", "2.percent.68"),
                                                            result.cut.year=2003)

################# Professionals 88
Professional.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Professional.xls",
                                   source.sheet="KILM 5b",
                                   source.region="A3:AN3888", 
                                   source.gender="MF",
                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                     "X2...000.", "X2...."),
                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                     "2.000.88", "2.percent.88"),
                                   result.cut.year=2003)

################# Professionals 08
Professional.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Professional.xls",
                                   source.sheet="KILM 5a",
                                   source.region="A3:AN217", 
                                   source.gender="MF",
                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                     "X2...000.", "X2...."),
                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                     "2.000.08", "2.percent.08"),
                                   result.cut.year=2003)

################# Female professionals 88
female.professional.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Female professional.xls",
                                          source.sheet="KILM 5b",
                                          source.region="A3:AN3888", 
                                          source.gender="F",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                            "2.000.88", "2.percent.88"),
                                          result.cut.year=2003)


################# Female professionals 08
female.professional.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Female professional.xls",
                                          source.sheet="KILM 5a",
                                          source.region="A3:AN217", 
                                          source.gender="F",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                            "2.000.08", "2.percent.08"),
                                          result.cut.year=2003)

################# Researchers per million inhabitants (HC)
researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (HC).xlsx",
                                    source.sheet="download-28", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (HC)",
                                    result.cut.year=2003)

################# Researchers per million inhabitants (FTE)
researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (FTE).xlsx",
                                    source.sheet="download-27", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (FTE)",
                                    result.cut.year=2003)

## countries in HC but not in FTE
setdiff(researchers.HC$Country.Name, researchers.FTE$Country.Name)

## countries in FTE but not in HC
setdiff(researchers.FTE$Country.Name, researchers.HC$Country.Name)

################# Female researchers (FTE)
female.researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (FTE).xlsx",
                                            source.sheet="download-30", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (FTE)",
                                            result.cut.year=2003)


################# Female researchers (HC)
female.researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (HC).xlsx",
                                            source.sheet="download-29", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (HC)",
                                            result.cut.year=2003)

## countries in HC but not in FTE
setdiff(female.researchers.HC$Country.Name, female.researchers.FTE$Country.Name)

## countries in FTE but not in HC
setdiff(female.researchers.FTE$Country.Name, female.researchers.HC$Country.Name)

################# Percentage distribution of a country's total unemployed who holds tertiary education
percent.dist.tertiary.unemployment <- get.ILO.latest( source.file="[R] [ILO] Percentage distribution of tertiary educated unemployment.xls",
                                                      source.sheet="KILM 14b",
                                                      source.region="A3:S4960", 
                                                      source.gender="MF",
                                                      source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Tertiary...."),
                                                      result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Tertiary.educated.employment.percent"),
                                                      result.cut.year=2003)

################# Unemployment rate of tertiary-educated
Unemployment.rate.tertiary.educated <- get.ILO.latest( source.file="[R] [ILO] Unemployment rate of persons with tertiary level education.xls",
                                                      source.sheet="KILM 14c",
                                                      source.region="A3:L8226", 
                                                      source.gender="MF",
                                                      source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education...."),
                                                      result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education.percent"),
                                                      result.cut.year=2003)