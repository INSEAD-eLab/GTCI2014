################# Percentage distribution of a country's total unemployed who holds tertiary education
percent.dist.tertiary.unemployment <- get.ILO.latest( source.file="[R] [ILO] Percentage distribution of tertiary educated unemployment.xls",
                                                      source.sheet="KILM 14b",
                                                      source.region="A3:S4960", 
                                                      source.gender="MF",
                                                      source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Tertiary...."),
                                                      result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Distribution of tertiary educated unemployment (percent)"),
                                                      result.cut.year=cut.off.year)

################# Unemployment rate of tertiary-educated
Unemployment.rate.tertiary.educated <- get.ILO.latest( source.file="[R] [ILO] Unemployment rate of persons with tertiary level education.xls",
                                                       source.sheet="KILM 14c",
                                                       source.region="A3:L8226", 
                                                       source.gender="MF",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Unemployment rate of tertiary educated (percent)"),
                                                       result.cut.year=cut.off.year)

################# Unemployment rate of tertiary-educated (male)
Unemployment.rate.tertiary.educated.male <- get.ILO.latest( source.file="[R] [ILO] Unemployment rate of persons with tertiary level education.xls",
                                                            source.sheet="KILM 14c",
                                                            source.region="A3:L8226", 
                                                            source.gender="M",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Unemployment rate of tertiary educated (percent)"),
                                                            result.cut.year=cut.off.year)

################# Unemployment rate of tertiary-educated (female)
Unemployment.rate.tertiary.educated.female <- get.ILO.latest( source.file="[R] [ILO] Unemployment rate of persons with tertiary level education.xls",
                                                              source.sheet="KILM 14c",
                                                              source.region="A3:L8226", 
                                                              source.gender="F",
                                                              source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Unemployment.rate.of.persons.with.tertiary.level.education...."),
                                                              result.colnames=c("Country.Name", "ISO3", "Year", "Gender", "Unemployment rate of tertiary educated (percent)"),
                                                              result.cut.year=cut.off.year)



################# Archive
#################
################# Female legislators, senior officials and managers 08
Female.legislators.senior.officials.managers.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Female legislators, senior officials and managers.xls",
                                                                   source.sheet="KILM 5a",
                                                                   source.region="A3:AN217", 
                                                                   source.gender="F",
                                                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                                     "X1...000.", "X1...."),
                                                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                                     "1 (000)", "1 (percent)"),
                                                                   result.cut.year=cut.off.year)

################# Female legislators, senior officials and managers 68
Female.legislators.senior.officials.managers.68 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Female legislators, senior officials and managers.xls",
                                                                   source.sheet="KILM 5c",
                                                                   source.region="A3:AN1976", 
                                                                   source.gender="F",
                                                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                                     "X0.1...000.", "X0.1....","X2...000.","X2...."),
                                                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                                     "0/1 (000)", "0/1 (percent)", "2 (000)", "2 (percent)"),
                                                                   result.cut.year=cut.off.year)


################# Legislators, senior officials and managers 08
Legislators.senior.officials.managers.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5a",
                                                            source.region="A3:AN217", 
                                                            source.gender="MF",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X1...000.", "X1...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                              "1 (000)", "1 (percent)"),
                                                            result.cut.year=cut.off.year)

################# Legislators, senior officials and managers 68
Legislators.senior.officials.managers.68 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-68] Legislators, senior officials and managers.xls",
                                                            source.sheet="KILM 5c",
                                                            source.region="A3:AN1976", 
                                                            source.gender="MF",
                                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                              "X0.1...000.", "X0.1....","X2...000.","X2...."),
                                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                                              "0/1 (000)", "0/1 (percent)", "2 (000)", "2 (percent)"),
                                                            result.cut.year=cut.off.year)


################# Female professionals 08
female.professional.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Female professional.xls",
                                          source.sheet="KILM 5a",
                                          source.region="A3:AN217", 
                                          source.gender="F",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                            "X2...000.", "X2...."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                            "2 (000)", "2 (percent)"),
                                          result.cut.year=cut.off.year)

################# Professionals 08
Professional.08 <- get.ILO.latest( source.file="[R] [ILO] [ISCO-08] Professional.xls",
                                   source.sheet="KILM 5a",
                                   source.region="A3:AN217", 
                                   source.gender="MF",
                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                     "X2...000.", "X2...."),
                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total employment (000)",
                                                     "2 (000)", "2 (percent)"),
                                   result.cut.year=cut.off.year)