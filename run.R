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
                                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Total.employment.000.08",
                                                                 "3.000.08", "3.percent.08"), 
                                               result.cut.year=2003)

## to find out which country is only available in 68 but not in 88 and 08
setdiff(tech.asso.68.MF.latest$Country.Name, union(tech.asso.88.MF.latest$Country.Name, tech.asso.08.MF.latest$Country.Name))


################### Female professional and technical workers (2.2.4 Solution 1)

## read the data for Female
Female.pro.tech.88.latest <- get.tech.asso.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
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
Male.pro.tech.88.latest <- get.tech.asso.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
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
total.pro.tech.88.latest <- get.tech.asso.latest(source.file="[R] [ILO] [ISCO-88] Technicians and associate professionals.xls",
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


################# female tertiary graduates
famale.tertiary.graduates <- get.UNESCO.format(source.file="[R] [UNESCO] Female tertiary graduates.xlsx",
                                     source.sheet="download-9", 
                                     source.data.region="A6:P222",
                                     source.colnames="A4:P4", 
                                     result.colnames="famale.tertiary.graduates",
                                     result.cut.year=2003)


################# science graduates
graduates.science <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                               source.sheet="download-19", 
                                               source.data.region="Q6:AE222",
                                               source.colnames="A4:P4", 
                                               result.colnames="graduates.science",
                                               result.cut.year=2003,
                                               names.separated=TRUE, 
                                               country.names="A6:A222")


################# engineering graduates
graduates.engineering <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                       source.sheet="download-19", 
                                       source.data.region="AF6:AT222",
                                       source.colnames="A4:P4", 
                                       result.colnames="graduates.engineering",
                                       result.cut.year=2003,
                                       names.separated=TRUE, 
                                       country.names="A6:A222")


################# engineering graduates
graduates.total <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                           source.sheet="download-19", 
                                           source.data.region="A6:P222",
                                           source.colnames="A4:P4", 
                                           result.colnames="graduates.total",
                                           result.cut.year=2003)


## combine science and engineering graduates
combined1 <- merge(graduates.science, graduates.engineering, by=c("ISO3", "Country.Name", "Year"), all=T)
key <- combined1$ISO3
combined2 <- do.call(rbind, by(combined1[, 3:5], key, colSums, na.rm=T))
combined2 <- data.frame(combined2, stringsAsFactors=F)

combined2[combined2$Year>2015,]
combined2[,"ISO3"] <- rownames(combined2)

## combine with graduates.total
combined3 <- merge(combined2, graduates.total, by=c("ISO3", "Year"), all=T)
key <- combined3$ISO3
combined4 <- do.call(rbind, by(combined3[, c(2,3,4,6)], key, colSums, na.rm=T))
combined4 <- data.frame(combined4, stringsAsFactors=F)

## check Country coverage
combined4[combined4$Year>2015,]

#### data checking for year

x <- combined1

table(x$Year)
hist(x$Year, xlim=c(min(x$Year)-1, max(x$Year)))


## TODO
# 2.2.4 Solution 7
# 3.1.3 graduates in science and engineering needs to be discussed
# 3.2.2 firms offering formal training (WB)
# 3.3.4 part time employment rate (file missing)
