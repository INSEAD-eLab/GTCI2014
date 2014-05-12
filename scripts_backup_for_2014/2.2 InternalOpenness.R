source("scripts/LPI.R")

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

################### Female professional and technical workers (2.2.4 Solution 1)

## read the data for Female
Female.pro.tech.88.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                            source.sheet="KILM 5b",
                                            source.region="A3:AR3888", 
                                            source.gender="F",
                                            source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "X2...000.", "X3...000."),
                                            result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "2.000.88","3.000.88"), 
                                            result.cut.year=2003)
## add variable 2 and 3
Female.pro.tech.88.latest[,"total.2.3"] <- apply(Female.pro.tech.88.latest, 1, function(row) sum(as.numeric(row[5]), as.numeric(row[6]), na.rm=T) )

## add comment
### if variable 2 is missing *
### if variable 3 is missing **
### if both is missing *** (this will be removed later)
Female.pro.tech.88.latest[,"comment"] <- apply(Female.pro.tech.88.latest, 1, function(row) {
  if(is.na(row[5]) & is.na(row[6])){
    "***"
  }else if(is.na(row[5])){
    "*"
  }else if(is.na(row[6])){
    "**"
  }else{
    ""
  }
} )

## read the data for male
Male.pro.tech.88.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                          source.sheet="KILM 5b",
                                          source.region="A3:AR3888", 
                                          source.gender="M",
                                          source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "X2...000.", "X3...000."),
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "2.000.88","3.000.88"), 
                                          result.cut.year=2003)

## add variable 2 and 3
Male.pro.tech.88.latest[,"total.2.3"] <- apply(Male.pro.tech.88.latest, 1, function(row) sum(as.numeric(row[5]), as.numeric(row[6]), na.rm=T) )

## add comment
Male.pro.tech.88.latest[,"comment"] <- apply(Male.pro.tech.88.latest, 1, function(row) {
  if(is.na(row[5]) & is.na(row[6])){
    "***"
  }else if(is.na(row[5])){
    "*"
  }else if(is.na(row[6])){
    "**"
  }else{
    ""
  }
} )

## combine female and male
combined <- merge(Female.pro.tech.88.latest, Male.pro.tech.88.latest, by=c("ISO3", "Country.Name", "Year"))

## find the ratio
Female.pro.tech.ratio.88.latest.s1 <- cbind(combined[,c("ISO3", "Country.Name", "Year")], combined[,"total.2.3.x"]/combined[,"total.2.3.y"])

## remove combined object
rm(combined)

## rename the variable
colnames(Female.pro.tech.ratio.88.latest.s1)[4] <- "Female.pro.tech.ratio.88.latest.s1"

## remove NaN and NA
Female.pro.tech.ratio.88.latest.s1 <- Female.pro.tech.ratio.88.latest.s1[complete.cases(Female.pro.tech.ratio.88.latest.s1),]


################### Female professional and technical workers (2.2.4 Solution 2)

## read the data for male
total.pro.tech.88.latest <- get.ILO.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
                                           source.sheet="KILM 5b",
                                           source.region="A3:AR3888", 
                                           source.gender="MF",
                                           source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "X2...000.", "X3...000."),
                                           result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "2.000.88","3.000.88"), 
                                           result.cut.year=2003)

## add variable 2 and 3
total.pro.tech.88.latest[,"total.2.3"] <- apply(total.pro.tech.88.latest, 1, function(row) sum(as.numeric(row[5]), as.numeric(row[6]), na.rm=T) )

## add comment
total.pro.tech.88.latest[,"comment"] <- apply(total.pro.tech.88.latest, 1, function(row) {
  if(is.na(row[5]) & is.na(row[6])){
    "***"
  }else if(is.na(row[5])){
    "*"
  }else if(is.na(row[6])){
    "**"
  }else{
    ""
  }
} )

## combine female and male
combined <- merge(Female.pro.tech.88.latest, total.pro.tech.88.latest, by=c("ISO3", "Country.Name", "Year"))

## find the ratio
Female.pro.tech.ratio.88.latest.s2 <- cbind(combined[,c("ISO3", "Country.Name", "Year")], combined[,"total.2.3.x"]/combined[,"total.2.3.y"])

## remove combined object
rm(combined)

## rename the variable
colnames(Female.pro.tech.ratio.88.latest.s2)[4] <- "Female.pro.tech.ratio.88.latest.s2"

## remove NaN and NA
Female.pro.tech.ratio.88.latest.s2 <- Female.pro.tech.ratio.88.latest.s2[complete.cases(Female.pro.tech.ratio.88.latest.s2),]

##################################################


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


################# female tertiary graduates
female.tertiary.graduates <- get.UNESCO.format(source.file="[R] [UNESCO] Female tertiary graduates.xlsx",
                                               source.sheet="download-9", 
                                               source.data.region="A6:P222",
                                               source.colnames="A4:P4", 
                                               result.colnames="female.tertiary.graduates",
                                               result.cut.year=2003)

################# Female gross enrolment ratio in tertiary level
female.gross.enrolment.ratio.tertiary <- get.UNESCO.format(source.file="[R] [UNESCO] Female gross enrolment ratio in tertiary level.xlsx",
                                               source.sheet="download-11", 
                                               source.data.region="A6:P222",
                                               source.colnames="A4:P4", 
                                               result.colnames="Female gross enrolment ratio in tertiary level",
                                               result.cut.year=2003)

################# Social mobility 
Social.mobility  <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="EA8:EA155",
                                        source.colname="EA6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


################# Wage equality between men and women
Wage.equality.men.women  <- get.WEF(source.file="WEF.xlsx", 
                            source.sheet="Sheet1", 
                            source.data.region="DO8:DO155",
                            source.colname="DO6", 
                            source.date="C7", 
                            source.countries="C8:C155")

## GEM data and can be used UNESCO function
################# High status successful entrepreneurship
High.status.successful.entrepreneurship <- get.UNESCO.format(source.file="[R] [GEM] High status successful entrepreneurship.xlsx",
                                                             source.sheet="GEM_Dataset_20140122083651", 
                                                             source.data.region="A6:K100",
                                                             source.colnames="A5:K5", 
                                                             result.colnames="High.status.successful.entrepreneurship",
                                                             result.cut.year=2003,
                                                             format="GEM")

## GEM data and can be used UNESCO function
################# Fear of failure rate
Fear.of.failure.rate <- get.UNESCO.format(source.file="[R] [GEM] Fear of failure rate.xlsx",
                                          source.sheet="GEM_Dataset_20140122083615", 
                                          source.data.region="A6:M102",
                                          source.colnames="A5:M5", 
                                          result.colnames="Fear.of.failure.rate",
                                          result.cut.year=2003,
                                          format="GEM")

## GEM data and can be used UNESCO function
################# Entrepreneurship as desirable career choice
Entrepreneurship.as.desirable.career.choice <- get.UNESCO.format(source.file="[R] [GEM] Entrepreneurship as desirable career choice.xlsx",
                                                             source.sheet="GEM_Dataset_20140122083524", 
                                                             source.data.region="A6:K100",
                                                             source.colnames="A5:K5", 
                                                             result.colnames="Entrepreneurship.as.desirable.career.choice",
                                                             result.cut.year=2003,
                                                             format="GEM")

## GEM data and can be used UNESCO function
################# Entrepreneurial intention
Entrepreneurial.intention <- get.UNESCO.format(source.file="[R] [GEM] Entrepreneurial intention.xlsx",
                                               source.sheet="Entrepreneurial intention", 
                                               source.data.region="A5:L101",
                                               source.colnames="A4:L4", 
                                               result.colnames="Entrepreneurial intention",
                                               result.cut.year=2003,
                                               format="GEM")


################# Language diversity index
Language.diversity.index  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                     source.sheet="Sheet1", 
                                     source.data.region="B2:B226",
                                     source.colname="B1", 
                                     source.date="L1", 
                                     source.countries="A2:A226")

Language.diversity.index.cover.age  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                               source.sheet="Sheet1", 
                                               source.data.region="C2:C226",
                                               source.colname="C1", 
                                               source.date="L1", 
                                               source.countries="A2:A226")

Language.diversity.index.total.living.language  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                                           source.sheet="Sheet1", 
                                                           source.data.region="D2:D226",
                                                           source.colname="D1", 
                                                           source.date="L1", 
                                                           source.countries="A2:A226")

Language.diversity.index.percent.living.language  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                                           source.sheet="Sheet1", 
                                                           source.data.region="E2:E226",
                                                           source.colname="E1", 
                                                           source.date="L1", 
                                                           source.countries="A2:A226")

Language.diversity.index.inde.living.language  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                                             source.sheet="Sheet1", 
                                                             source.data.region="F2:F226",
                                                             source.colname="F1", 
                                                             source.date="L1", 
                                                             source.countries="A2:A226")

Language.diversity.index.immi.living.language  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                                          source.sheet="Sheet1", 
                                                          source.data.region="G2:G226",
                                                          source.colname="G1", 
                                                          source.date="L1", 
                                                          source.countries="A2:A226")

Language.diversity.index.count  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                                          source.sheet="Sheet1", 
                                                          source.data.region="H2:H226",
                                                          source.colname="H1", 
                                                          source.date="L1", 
                                                          source.countries="A2:A226")

Language.diversity.index.mean  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                           source.sheet="Sheet1", 
                                           source.data.region="I2:I226",
                                           source.colname="I1", 
                                           source.date="L1", 
                                           source.countries="A2:A226")

Language.diversity.index.median  <- get.WEF(source.file="[R] [Ethnologue] Language diversity index.xlsx", 
                                           source.sheet="Sheet1", 
                                           source.data.region="J2:J226",
                                           source.colname="J1", 
                                           source.date="L1", 
                                           source.countries="A2:A226")
## merging all variables
language.diversity.1 <- merge(Language.diversity.index, Language.diversity.index.cover.age, by=c("Country.Name", "ISO3", "Year"), sort=F)
language.diversity.2 <- merge(Language.diversity.index.total.living.language, Language.diversity.index.percent.living.language, by=c("Country.Name", "ISO3", "Year"), sort=F)
language.diversity.3 <- merge(Language.diversity.index.inde.living.language, Language.diversity.index.immi.living.language, by=c("Country.Name", "ISO3", "Year"), sort=F)
language.diversity.4 <- merge(Language.diversity.index.count, Language.diversity.index.mean, by=c("Country.Name", "ISO3", "Year"), sort=F)
language.diversity.4 <- merge(language.diversity.4, Language.diversity.index.median, by=c("Country.Name", "ISO3", "Year"), sort=F)

language.diversity.5 <- merge(language.diversity.1, language.diversity.2, by=c("Country.Name", "ISO3", "Year"), sort=F)
language.diversity.6 <- merge(language.diversity.3, language.diversity.4, by=c("Country.Name", "ISO3", "Year"), sort=F)

## this is the final one
language.diversity <- merge(language.diversity.5, language.diversity.6, by=c("Country.Name", "ISO3", "Year"), sort=F)

#clearing the data objects
rm(language.diversity.1, language.diversity.2, language.diversity.3, language.diversity.4, language.diversity.5, language.diversity.6,
   Language.diversity.index, Language.diversity.index.cover.age, Language.diversity.index.total.living.language, Language.diversity.index.percent.living.language,
   Language.diversity.index.inde.living.language, Language.diversity.index.immi.living.language, Language.diversity.index.count, Language.diversity.index.mean,
   Language.diversity.index.median)

#language.diversity <- merge(language.diversity, population[, c(4:5)], by="ISO3", all.x=T,sort=F)
#language.diversity[, "ratio"] <- 1000000*(language.diversity[, "Immigrant living language"]/language.diversity[, "total population"])

################################ end of language diversity index

################# Estimated earned income : female
Estimated.earned.income.female  <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                     source.sheet="Sheet1", 
                                     source.data.region="B2:B135",
                                     source.colname="B1", 
                                     source.date="H2", 
                                     source.countries="A2:A135")

################# Estimated earned income : male
Estimated.earned.income.male  <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                           source.sheet="Sheet1", 
                                           source.data.region="C2:C135",
                                           source.colname="C1", 
                                           source.date="H2", 
                                           source.countries="A2:A135")

################# Estimated earned income : Female (with 40,000 cut-off)
Estimated.earned.income.female.40000 <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                           source.sheet="Sheet1", 
                                           source.data.region="D2:D135",
                                           source.colname="D1", 
                                           source.date="H2", 
                                           source.countries="A2:A135")

################# Estimated earned income : male (with 40,000 cut-off)
Estimated.earned.income.male.40000 <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                                source.sheet="Sheet1", 
                                                source.data.region="E2:E135",
                                                source.colname="E1", 
                                                source.date="H2", 
                                                source.countries="A2:A135")

################# Estimated earned income : female to male ratio
Estimated.earned.female.male.ratio <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                              source.sheet="Sheet1", 
                                              source.data.region="F2:F135",
                                              source.colname="F1", 
                                              source.date="H2", 
                                              source.countries="A2:A135")


################# Estimated earned income : rank
Estimated.earned.rank <- get.WEF(source.file="[R] [WEF] Estimated earned income.xlsx", 
                                 source.sheet="Sheet1", 
                                 source.data.region="G2:G135",
                                 source.colname="G1", 
                                 source.date="H2", 
                                 source.countries="A2:A135")

## merging all earned income variables
Estimated.earned.income.1 <- merge(Estimated.earned.income.female, Estimated.earned.income.male, by=c("ISO3", "Country.Name", "Year"))
Estimated.earned.income.2 <- merge(Estimated.earned.income.female.40000, Estimated.earned.income.male.40000, by=c("ISO3", "Country.Name", "Year"))
Estimated.earned.income.3 <- merge(Estimated.earned.female.male.ratio, Estimated.earned.rank, by=c("ISO3", "Country.Name", "Year"))

Estimated.earned.income <- merge(Estimated.earned.income.1, Estimated.earned.income.2, by=c("ISO3", "Country.Name", "Year"))
Estimated.earned.income <- merge(Estimated.earned.income, Estimated.earned.income.3, by=c("ISO3", "Country.Name", "Year"))

rm(Estimated.earned.income.1, Estimated.earned.income.2, Estimated.earned.income.3, Estimated.earned.rank, Estimated.earned.female.male.ratio,
   Estimated.earned.income.male.40000, Estimated.earned.income.female.40000, Estimated.earned.income.male, Estimated.earned.income.female)

## WDI data has same format as UNESCO and used that function
################################# Female parliamentarians
female.parliamentarians <- get.UNESCO.format(source.file="[R] [WDI] Female parliamentarians.xls",
                                                    source.sheet="Data", 
                                                    source.data.region="AU5:BE255",
                                                    source.colnames="AT3:BE3", 
                                                    result.colnames="female.parliamentarians.ratio",
                                                    result.cut.year=2003,
                                                    names.separated=TRUE, 
                                                    country.names="A5:A255")

female.parliamentarians[, "female.male.ratio"] <- female.parliamentarians[,3]/(100-female.parliamentarians[,3])


################# attitude towards entrepreneurial failure
attitude.entrepreneurial.failure  <- get.WEF(source.file="WEF.xlsx", 
                            source.sheet="Sheet1", 
                            source.data.region="AB8:AB155",
                            source.colname="AB6", 
                            source.date="C7", 
                            source.countries="C8:C155")
