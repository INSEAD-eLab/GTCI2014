## Sub-pillar: Employable Skills
source("scripts/6.1 HigherSkillsAndCompetencies.R")

## rename the column accordingly
head (tertiary.educated.population.above15.ILO.total)
head (tertiary.educated.population.above15.ILO.total.usa)
head (Legislators.senior.officials.managers.88)
head (Female.legislators.senior.officials.managers.88)
head (legislators.senior.officials.managers.88.f)
head (Professional.88)
head (female.professional.88)
head (professional.88.f)
head (researchers.FTE)
head (researchers.HC.patched)
head (tertiary.educated.population.tertiary.UNESCO)
colnames(tertiary.educated.population.above15.ILO.total)[6] <- "Tertiary-educated workforce wo usa"
colnames(tertiary.educated.population.above15.ILO.total.usa)[6] <- "Tertiary-educated workforce w usa"
colnames(Legislators.senior.officials.managers.88)[7] <- "Legislators, senior officials and managers"
colnames(Female.legislators.senior.officials.managers.88)[7] <- "Female legislators, senior officials and managers (ALT1)"
colnames(legislators.senior.officials.managers.88.f)[12]     <- "Female legislators, senior officials and managers (ALT2)"
colnames(Professional.88)[7] <- "Professionals"
colnames(female.professional.88)[7] <- "Female professionals (ALT1)"
colnames(professional.88.f)[12] <- "Female professionals (ALT2)"
colnames(researchers.FTE)[3] <- "Researchers"
colnames(researchers.HC.patched)[3] <- "Researchers (GTCI2013)"
colnames(tertiary.educated.population.tertiary.UNESCO)[2] <- "Tertiary-educated workforce (GTCI2013)"

## merge
merge61 <- merge(tertiary.educated.population.above15.ILO.total[, c(2,6)], tertiary.educated.population.above15.ILO.total.usa[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,Legislators.senior.officials.managers.88[, c(1,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,Female.legislators.senior.officials.managers.88[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,legislators.senior.officials.managers.88.f[, c(1,12)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,Professional.88[, c(1,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,female.professional.88[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,professional.88.f[, c(1,12)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,researchers.FTE[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,researchers.HC.patched[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,tertiary.educated.population.tertiary.UNESCO[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)

save(merge61, file="scripts/merging/61.Rdata")
## clean the memory
rm(list=ls())
gc()
source("scripts/functions.R")

## Sub-pillar: Talent impact
source("scripts/6.2 TalentImpact.R")
## rename the column accordingly
head (innovation.output)
head (New.product.entrepreneurial.act)
head (New.business.density)
head (TradeDataWITS)
head (tradeUNCTADdata)

colnames(innovation.output)[3] <- "Innovation output"
colnames(New.product.entrepreneurial.act)[3] <- "New product entrepreneurial activity"
colnames(New.business.density)[3] <- "New business density"
colnames(TradeDataWITS)[24] <- "High -technology manufactures WITS"
colnames(tradeUNCTADdata)[14] <- "High -tech export UNCTAD"
merge62 <- merge (innovation.output[, c(3,4)], New.product.entrepreneurial.act[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge62 <- merge (merge62, New.business.density[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge62 <- merge (merge62, TradeDataWITS[, c(24,36)], by="ISO3", all=TRUE, sort=FALSE)
merge62 <- merge (merge62, tradeUNCTADdata[, c(1,14)], by="ISO3", all=TRUE, sort=FALSE)
merge62 <- merge (merge62, Exports[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
save(merge62, file="scripts/merging/62.Rdata")

## clean the memory
rm(list=ls())
gc()

load("scripts/merging/61.Rdata")
load("scripts/merging/62.Rdata")

merge6 <- merge(merge61, merge62, by="ISO3", all=TRUE)

save(merge6, file="scripts/merging/P6.Rdata")
unlink("scripts/merging/61.Rdata")
unlink("scripts/merging/62.Rdata")

## clean the memory
rm(list=ls())
gc()
source("scripts/functions.R")
