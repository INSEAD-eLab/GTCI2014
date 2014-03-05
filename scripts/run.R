rm(list=ls())

source("functions.R")

################# Political Stability
Political.Stability <- get.Political.Stability()



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


#### data checking for year
x <- Part.time.employment.rate.25

table(x$Year)
hist(x$Year, xlim=c(min(x$Year)-1, max(x$Year)))

## TODO
# 2.2.4 Solution 7
# 4.1.1 Solution 1 "CP-2b OA - Old age to economically active protection ratio (contributors) (preferred by definition)"
# 4.2.4 Maternity and paternity leave 
