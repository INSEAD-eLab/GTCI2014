## Sub-pillar: Formal Education
source("scripts/4.1 Sustainability.R")

## rename the column accordingly
head (pension.system)
head (maternity.parental.leave)
head (Extent.effect.taxation.on.incentives.to.work)
head (personal.income.tax.rate)
head (top.management)
head (head.of.IT)
head (sales.n.marketing)
head (Extent.effect.taxation.on.incentives.to.work.and.invest)
colnames(pension.system)[2] <- "Pension system"
colnames(maternity.parental.leave)[2] <- "Maternity and parental leave provision"
colnames(Extent.effect.taxation.on.incentives.to.work)[2] <- "Extent and effect of taxation"
colnames(personal.income.tax.rate)[3] <- "Personal income tax rate"
colnames(top.management)[6] <- "Pay level - head of organisation"
colnames(head.of.IT)[6] <- "Pay level - head of IT"
colnames(sales.n.marketing)[6] <- "Pay level - head of sales and marketing"
colnames(Extent.effect.taxation.on.incentives.to.work.and.invest)[6] <- "Extent and effect of taxation (GTCI2013)"

## merge
merge41 <- merge(pension.system[, c(2,4)], maternity.parental.leave[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,Extent.effect.taxation.on.incentives.to.work[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,personal.income.tax.rate[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,top.management[, c(1,6)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,head.of.IT[, c(1,6)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,sales.n.marketing[, c(1,6)], by="ISO3", all=TRUE, sort=FALSE)
merge41 <- merge (merge41,Extent.effect.taxation.on.incentives.to.work.and.invest[, c(3,6)], by="ISO3", all=TRUE, sort=FALSE)


save(merge41, file="scripts/merging/41.Rdata")

## Sub-pillar: Lifestyle
source("scripts/4.2 Lifestyle.R")

## rename the column accordingly
head (environmental.performance)
head (property.stolen)
head (safe.walking.alone)
head (Intentional.homicide)
head (Physicians.density)
head (improved.sanitation.facilities)
head (Part.time.employment.rate.15.female)
colnames(environmental.performance)[2] <- "Environmental performance"
colnames(Intentional.homicide)[3] <- "Homicide rate"
colnames(Physicians.density)[3] <- "Physician density"
colnames(improved.sanitation.facilities)[3] <- "Improved sanitation facilities"
colnames(Part.time.employment.rate.15.female)[6] <- "Female part-time workers"
# colnames(Part.time.employment.rate.15.F.ratios)[10] <- "Female part-time workers"
colnames(property.stolen)[3] <- "Property stolen (GTCI2013)"
colnames(safe.walking.alone)[3] <- "Safety at night"

## merge
merge42 <- merge(environmental.performance[, c(2,4)], Intentional.homicide[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge42 <- merge (merge42,Part.time.employment.rate.15.female[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
# merge42 <- merge (merge42,Part.time.employment.rate.15.F.ratios[, c(2,10)], by="ISO3", all=TRUE, sort=FALSE)
merge42 <- merge (merge42,Physicians.density[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge42 <- merge (merge42,improved.sanitation.facilities[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge42 <- merge (merge42,property.stolen[, c(1,3)], by="ISO3", all=TRUE, sort=FALSE)
merge42 <- merge (merge42,safe.walking.alone[, c(1,3)], by="ISO3", all=TRUE, sort=FALSE)

save(merge42, file="scripts/merging/42.Rdata")

## clean the memory
rm(list=ls())
gc()

load("scripts/merging/41.Rdata")
load("scripts/merging/42.Rdata")

merge4 <- merge(merge41, merge42, by="ISO3", all=TRUE)

save(merge4, file="scripts/merging/P4.Rdata")
unlink("scripts/merging/41.Rdata")
unlink("scripts/merging/42.Rdata")

## clean the memory
rm(list=ls())
gc()
source("scripts/functions.R")
