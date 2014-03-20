## to remove all the variables and functions
rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")

## to load a particular sub-pillar
source("scripts/6.2 TalentImpact.R")

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
filename <- "Data export.xlsx"
sheetname <- "data"
data.to.write <- merged6.2

wb <- loadWorkbook(filename, create = TRUE)
createSheet(wb, name = sheetname)
writeWorksheet(wb, data.to.write, sheet = sheetname)
saveWorkbook(wb)

merged6.2 <- merge(innovation.output[, c(3,4)], scaled.total.patent.resident.applications[, c(1,4,7)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, scaled.patent.resident.granted[, c(1,4,7)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, New.business.density[, c(3,4)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, New.product.entrepreneurial.act[, c(3,4)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, established.business.ownership[, c(3,4)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, new.business.ownership[, c(3,4)], by="ISO3", all=TRUE)
merged6.2 <- merge(merged6.2, innovation.output[, c(1,4)], by="ISO3", all=TRUE)
merged6.2 <- merged6.2[, c(1,11,2:10)]



generate.pdf(PISA.latest[, c(2,1,3:7)], "Average", "PISA Latest Score")
oo <- combined4[, c(1:3,7:9)]
generate.pdf(oo, "science and engineering ratio", "Science and Engineering Graduates")



if(ncol(variable.to.be.printed.sorted) == 4){
  align.option <- "lp{4cm}llp{5cm}"
} else if(ncol(variable.to.be.printed.sorted) == 5){
  align.option <- "lp{4cm}llp{3cm}p{3cm}"
} else if(ncol(variable.to.be.printed.sorted) == 6){
  align.option <- "lp{4cm}llp{2.5cm}p{2.5cm}p{2.5cm}"
}
