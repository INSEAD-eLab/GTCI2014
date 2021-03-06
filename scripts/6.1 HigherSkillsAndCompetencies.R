# UNESCO data format but this is weird and will use WEF function
################# Tertiary educated workforce
tertiary.educated.population.above25.UNESCO <- get.WEF(source.file="[R] [UNESCO] Tertiary educated population.xls", 
                                                       source.sheet="Educational Attainment_by Level", 
                                                       source.data.region="C7:C230",
                                                       source.colname="C2", 
                                                       source.date="B7:B230", 
                                                       source.countries="A7:A230",
                                                       cut.off.year=cut.off.year,
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
                                                        cut.off.year=cut.off.year,
                                                        different.source=TRUE)
colnames(tertiary.educated.population.tertiary.UNESCO)[2] <- "Tertiary (ISCED 5-6) (percent)"

################################# Tertiary educated workforce 25+
gc()
tertiary.educated.population.above25.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="25+",
                                                                  result.cut.year=cut.off.year)

################################# Tertiary educated workforce 15+
gc()
tertiary.educated.population.above15.ILO.total <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="MF",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="15+",
                                                                  result.cut.year=cut.off.year)

## countries in 25 but not in 15
setdiff(tertiary.educated.population.above25.ILO.total$Country.Name, tertiary.educated.population.above15.ILO.total$Country.Name)

## countries in 15 but not in 25
setdiff(tertiary.educated.population.above15.ILO.total$Country.Name, tertiary.educated.population.above25.ILO.total$Country.Name)

## adding US data
tertiary.educated.population.above15.ILO.total.usa <- rbind(tertiary.educated.population.above15.ILO.total, tertiary.educated.population.above25.ILO.total[tertiary.educated.population.above25.ILO.total$Country.Name == "united states",])


################################# Tertiary educated workforce 25+ (female)
gc()
tertiary.educated.population.above25.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="F",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="25+",
                                                                  result.cut.year=cut.off.year)

################################# Tertiary educated workforce 15+ (female)
gc()
tertiary.educated.population.above15.ILO.female <- get.ILO.latest( source.file="[R] [ILO] Tertiary educated workforce.xls",
                                                                  source.sheet="KILM 14a",
                                                                  source.region="A3:T15210", 
                                                                  source.gender="F",
                                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary...."),
                                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Tertiary (percent)"),
                                                                  source.age="15+",
                                                                  result.cut.year=cut.off.year)

## countries in 25 but not in 15
setdiff(tertiary.educated.population.above25.ILO.female$Country.Name, tertiary.educated.population.above15.ILO.female$Country.Name)

## countries in 15 but not in 25
setdiff(tertiary.educated.population.above15.ILO.female$Country.Name, tertiary.educated.population.above25.ILO.female$Country.Name)

## adding US data
tertiary.educated.population.above15.ILO.female.usa <- rbind(tertiary.educated.population.above15.ILO.female, tertiary.educated.population.above25.ILO.female[tertiary.educated.population.above25.ILO.female$Country.Name == "united states",])


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


################# Female legislators, senior officials and managers 88
Female.legislators.senior.officials.managers.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Female legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5b",
                                                            source.region="A3:AN3888", 
                                                            source.gender="F",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                              "1 (000)", "1 (percent)"),
                                                            result.cut.year=cut.off.year)


################# Legislators, senior officials and managers 88
Legislators.senior.officials.managers.88 <- get.ILO.denominator( source.file="[R] [ILO] [ISCO-88] Legislators, senior officials and managers.xls",
                                                                 source.sheet="KILM 5b",
                                                                 source.region="A3:AN3888", 
                                                                 source.gender="MF",
                                                                 source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                                   "X1...000.", "X1...."),
                                                                 result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                                   "1 (000)", "1 (percent)"),
                                                                 numerator.list=Female.legislators.senior.officials.managers.88)

#### addition calculation of ratio
legislators.senior.officials.managers.88.f <- merge(Female.legislators.senior.officials.managers.88, Legislators.senior.officials.managers.88, by=c("ISO3", "Country.Name", "Year"), all.x=T)
legislators.senior.officials.managers.88.f[, "ratio"] <- legislators.senior.officials.managers.88.f[, "1 (000).x"]/legislators.senior.officials.managers.88.f[, "1 (000).y"]


################# Female professionals 88
female.professional.88 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-88] Female professional.xls",
                                          source.sheet="KILM 5b",
                                          source.region="A3:AN3888", 
                                          source.gender="F",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                            "2 (000)", "2 (percent)"),
                                          result.cut.year=cut.off.year)

################# Professionals 88
Professional.88 <- get.ILO.denominator( source.file="[R] [ILO] [ISCO-88] Professional.xls",
                                   source.sheet="KILM 5b",
                                   source.region="A3:AN3888", 
                                   source.gender="MF",
                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                     "X2...000.", "X2...."),
                                   result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Total employment (000)",
                                                     "2 (000)", "2 (percent)"),
                                   numerator.list=female.professional.88)

#### addition calculation of ratio

professional.88.f <- merge(female.professional.88, Professional.88, by=c("ISO3", "Country.Name", "Year"), all.x=T)
professional.88.f[, "ratio"] <- professional.88.f[, "2 (000).x"]/professional.88.f[, "2 (000).y"]

################# Researchers per million inhabitants (HC)
researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (HC).xlsx",
                                    source.sheet="download-28", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (HC)",
                                    result.cut.year=cut.off.year)

################# Researchers per million inhabitants (FTE)
researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (FTE).xlsx",
                                    source.sheet="download-27", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (FTE)",
                                    result.cut.year=cut.off.year)

## countries in HC but not in FTE
setdiff(researchers.HC$Country.Name, researchers.FTE$Country.Name)

## countries in FTE but not in HC
setdiff(researchers.FTE$Country.Name, researchers.HC$Country.Name)

## patching Australia, Canada, india, USA
researchers.FTE.TBP <- researchers.FTE[researchers.FTE$Country.Name %in% c("australia", "canada", "india", "united states of america"), ]
colnames(researchers.FTE.TBP)[3] <- "Researchers per million inhabitants (HC)" 
researchers.HC.patched <- rbind(researchers.HC, researchers.FTE.TBP)
rm(researchers.FTE.TBP)

################# Female researchers (FTE)
female.researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (FTE).xlsx",
                                            source.sheet="download-30", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (FTE)",
                                            result.cut.year=cut.off.year)


################# Female researchers (HC)
female.researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (HC).xlsx",
                                            source.sheet="download-29", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (HC)",
                                            result.cut.year=cut.off.year)

## countries in HC but not in FTE
setdiff(female.researchers.HC$Country.Name, female.researchers.FTE$Country.Name)

## countries in FTE but not in HC
setdiff(female.researchers.FTE$Country.Name, female.researchers.HC$Country.Name)


################# Unemployment rate of tertiary-educated
Unemployment.rate.tertiary.educated <- get.ILO.latest( source.file="[R] [ILO] Unemployment rate of persons with tertiary level education.xls",
                                                       source.sheet="KILM 14c",
                                                       source.region="A3:L8226", 
                                                       source.gender="MF",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Unemployment rate of tertiary educated (percent)"),
                                                       result.cut.year=cut.off.year)


################################ tertiary educated population UNESCO
tertiary.educated.population.UNESCO  <- get.WB.format(source.file="[R] [UNESCO] 2014 06 23 Data ES and GKS.xlsx",
                                                      source.sheet="Education attained (long frmt)", 
                                                      source.data.region="A2:F3421",
                                                      source.colnames="A1:F1", 
                                                      source.result.col="tertiary educated population",                                         
                                                      result.cut.year=cut.off.year)
