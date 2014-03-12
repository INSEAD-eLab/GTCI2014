## to remove all the variables and functions
rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")

## to load a particular sub-pillar
source("scripts/1.1 RegulatoryLandscape.R")

## to find out which country is only available in 68 but not in 88 and 08
setdiff(tech.asso.68.MF.latest$Country.Name, union(tech.asso.88.MF.latest$Country.Name, tech.asso.08.MF.latest$Country.Name))

#### data checking for year
## replace the variable name to check
x <- Part.time.employment.rate.25

## to get the frequency table
table(x$Year)

## to get the histogram
hist(x$Year, xlim=c(min(x$Year)-1, max(x$Year)))

## to download to excel, give the relevant names and run 4 lines
filename <- "myWorkbook.xlsx"
sheetname <- "data"
data.to.write <- female.gross.enrolment.ratio.tertiary

wb <- loadWorkbook(filename, create = TRUE)
createSheet(wb, name = sheetname)
writeWorksheet(wb, data.to.write, sheet = sheetname)
saveWorkbook(wb)

## TODO
# 2.2.4 Solution 7
# 4.2.4 Maternity and paternity leave 
