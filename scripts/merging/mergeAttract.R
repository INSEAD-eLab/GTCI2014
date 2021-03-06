## Sub-pillar: External Openness
source("scripts/2.1 ExternalOpenness.R")

## rename the column accordingly
head (FDI.inflow)
head (FDI.technology.transfer)
head (Employing.Skilled.Expatriates)
head (Prevalence.foreign.ownership)
head (total.migrants.above.25.male)
head (total.migrants.above.25.female)
head (total.migrants.below.25.male)
head (total.migrants.below.25.female)
head (Country.capacity.attract.talent)
head (Country.capacity.retain.talent)
head (Average.country.capacity.retain.attract)
colnames(FDI.inflow)[3] <- "FDI inflow"
colnames(FDI.technology.transfer)[2] <- "FDI and technology transfer"
colnames(Employing.Skilled.Expatriates)[2] <- "Employing skilled expatriates"
colnames(Prevalence.foreign.ownership)[2] <- "Prevalence of foreign ownership"
colnames(total.migrants.above.25.male)[6] <- "Adult male migrant stock"
colnames(total.migrants.above.25.female)[6] <- "Adult female migrant stock"
colnames(total.migrants.below.25.male)[6] <- "Young male migrant stock"
colnames(total.migrants.below.25.female)[6] <- "Young female migrant stock"
colnames(Country.capacity.attract.talent)[2] <- "Country capacity to attract talent/Brain gain"
colnames(Country.capacity.retain.talent)[2] <- "Country capacity to retain talent/Brain drain"
colnames(Average.country.capacity.retain.attract)[6] <- "Qualified labour inflow (GTCI2013)"


## merge
merge21 <- merge(FDI.inflow[, c(3,4)], FDI.technology.transfer[, c(2,4)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,Employing.Skilled.Expatriates[, c(2,4)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,Prevalence.foreign.ownership[, c(2,4)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,total.migrants.above.25.male[, c(2,6)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,total.migrants.above.25.female[, c(2,6)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,total.migrants.below.25.male[, c(2,6)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,total.migrants.below.25.female[, c(2,6)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,Country.capacity.attract.talent[, c(2,4)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,Country.capacity.retain.talent[, c(2,4)], by="ISO3", all=TRUE, sort=T)
merge21 <- merge (merge21,Average.country.capacity.retain.attract[, c(3,6)], by="ISO3", all=TRUE, sort=FALSE)

save(merge21, file="scripts/merging/21.Rdata")

## Sub-pillar: Internal Openness
source("scripts/2.2 InternalOpenness.R")

## rename the column accordingly
# head (tolerance.of.minorities)
# head (tolerance.of.immigrants)
head (language.diversity)
head (attitude.entrepreneurial.failure)
head (Social.mobility)
head (Female.tertiary.students)
head (Estimated.earned.income)
head (tolerance.to.immigrants)
head (tolerance.to.minorities)
head (female.parliamentarians )
head (Female.pro.tech.ratio.88.latest.s1)
colnames(language.diversity)[6] <- "Language diversity"
colnames(attitude.entrepreneurial.failure)[2] <- "Attitudes toward entrepreneurial failure"
colnames(Social.mobility)[2] <- "Social mobility"
colnames(female.tertiary.graduates)[3] <- "Female tertiary graduates"
colnames(Estimated.earned.income)[8] <- "Estimated earned income"
colnames(tolerance.to.immigrants)[3] <- "Tolerance to immigrants"
colnames(tolerance.to.minorities)[3] <- "Tolerance to minorities"
colnames(Female.pro.tech.ratio.88.latest.s1)[4] <- "Female professionals and technical workers (GTCI2013)"
colnames(female.parliamentarians)[5] <- "Female parliamentarians (GTCI2013)"

## merge
merge22 <- merge(attitude.entrepreneurial.failure[, c(2,4)], Social.mobility[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,female.tertiary.graduates[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,Estimated.earned.income[, c(1,8)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,language.diversity[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,tolerance.to.immigrants[, c(1,3)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,tolerance.to.minorities[, c(1,3)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,Female.pro.tech.ratio.88.latest.s1[, c(1,4)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,female.parliamentarians[, c(4,5)], by="ISO3", all=TRUE, sort=FALSE)

save(merge22, file="scripts/merging/22.Rdata")


## clean the memory
rm(list=ls())
gc()

load("scripts/merging/21.Rdata")
load("scripts/merging/22.Rdata")

merge2 <- merge(merge21, merge22, by="ISO3", all=TRUE)

save(merge2, file="scripts/merging/P2.Rdata")
unlink("scripts/merging/21.Rdata")
unlink("scripts/merging/22.Rdata")

## clean the memory
rm(list=ls())
gc()
source("scripts/functions.R")

