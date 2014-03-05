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
                                          result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.88",
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
