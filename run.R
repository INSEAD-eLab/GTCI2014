rm(list=ls())

source("functions.R")

################# Political Stability
Political.Stability <- get.Political.Stability()

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


tech.asso.68.MF.latest <- get.tech.asso.latest( source.file="[R] [ILO] [ISCO-68] Technicians and associate professionals.xls",
                                                source.sheet="KILM 5c",
                                                source.region="A3:AN1976", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                  "X0.1...000.", "X0.1....", "X2...000.", "X2...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                                  "01.000.68", "01.percent.68", "2.000.68", "2.percent.68"),
                                                result.cut.year=2003)


tech.asso.88.MF.latest <- get.tech.asso.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                               source.sheet="KILM 5b", 
                                               source.region="A3:AR3888", 
                                               source.gender="MF",
                                               source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                 "X3...000.", "X3...."),
                                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                                 "3.000.88", "3.percent.88"),
                                               result.cut.year=2003)


tech.asso.08.MF.latest <- get.tech.asso.latest(source.file="[R] [ILO] [ISCO-08] Technicians and associate professionals.xls",
                                               source.sheet="KILM 5a",
                                               source.region="A3:AR217", 
                                               source.gender="MF",
                                               source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment...000.",
                                                                 "X3...000.", "X3...."),
                                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
                                                                 "3.000.88", "3.percent.88"), 
                                               result.cut.year=2003)


## to find out which country is only available in 68 but not in 88 and 08
setdiff(tech.asso.68.MF.latest$Country.Name, union(tech.asso.88.MF.latest$Country.Name, tech.asso.08.MF.latest$Country.Name))

################# Gross expenditure on R&D
R.D.expenditure <- get.UNESCO.format(source.file="[R] [UNESCO] Gross expenditure on R&D (% of GDP).xls",
                                       source.sheet="download-8", 
                                       source.data.region="A6:R220",
                                       source.colnames="A4:R4", 
                                       result.colnames="RnD.expenditure",
                                       result.cut.year=2003)

################# Female tertiary students
Female.tertiary.students <- get.UNESCO.format(source.file="[R] [UNESCO] Female tertiary students.xlsx",
                                             source.sheet="download-10", 
                                             source.data.region="A6:P222",
                                             source.colnames="A4:P4", 
                                             result.colnames="female.tertiary.students",
                                             result.cut.year=2003)

################# Gender parity index of gross graduation ratio (ISCED 5A)
gender.parity.index.gross.graduation.ratio <- get.UNESCO.format(source.file="[R] [UNESCO] Gender parity index of gross graduation ratio (ISCED 5A).xlsx",
                                                                source.sheet="download-12", 
                                                                source.data.region="A6:P222",
                                                                source.colnames="A4:P4", 
                                                                result.colnames="gender.parity.index",
                                                                result.cut.year=2003)

