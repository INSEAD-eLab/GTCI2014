## Sub-pillar: External Openness
source("scripts/2.1 ExternalOpenness.R")

## rename the column accordingly
# head (FDI.inflow)
# head (FDI.technology.transfer)
# head (Employing.Skilled.Expatriates)
head (Prevalence.foreign.ownership)
head (total.migrants.above.25.male)
head (total.migrants.above.25.female)
head (total.migrants.below.25.male)
head (total.migrants.below.25.female)
head (Country.capacity.attract.talent)
head (Country.capacity.retain.talent)
colnames(FDI.inflow)[3] <- "FDI inflow"
colnames(FDI.technology.transfer)[2] <- "FDI and technology transfer"
colnames(Employing.Skilled.Expatriates)[2] <- "Employing skilled expatriates"
colnames(Prevalence.foreign.ownership)[2] <- "Prevalence of foreign ownership"
colnames(total.migrants.above.25.male)[6] <- "Adult male migrant stock"
colnames(total.migrants.above.25.female)[6] <- "Adult female migrant stock"
colnames(total.migrants.below.25.male)[6] <- "Young male migrant stock"
colnames(Country.capacity.attract.talent)[2] <- "Country capacity to attract talent/Brain gain"
colnames(Country.capacity.retain.talent)[2] <- "Country capacity to retain talent/Brain drain"

## merge
merge21 <- merge(FDI.inflow[, c(3,4)], FDI.technology.transfer[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,Employing.Skilled.Expatriates[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,Prevalence.foreign.ownership[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,total.migrants.above.25.male[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,total.migrants.above.25.female[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,total.migrants.below.25.male[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,total.migrants.below.25.female[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,Country.capacity.attract.talent[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge21 <- merge (merge21,Country.capacity.retain.talent[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)

## Sub-pillar: Internal Openness
source("scripts/2.2 InternalOpenness.R")

## rename the column accordingly
# head (tolerance.of.minorities)
# head (tolerance.of.immigrants)
# head (language.diversity)
head (attitude.entrepreneurial.failure)
head (Social.mobility)
head (Female.tertiary.students)
head (Estimated.earned.income)
colnames(attitude.entrepreneurial.failure)[2] <- "Attitudes toward entrepreneurial failure"
colnames(Social.mobility)[2] <- "Social mobility"
colnames(Female.tertiary.students)[3] <- "Female tertiary students"
colnames(Estimated.earned.income)[8] <- "Estimated earned income"

## merge
merge22 <- merge(attitude.entrepreneurial.failure[, c(2,4)], Social.mobility[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,Female.tertiary.students[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge22 <- merge (merge22,Estimated.earned.income[, c(1,8)], by="ISO3", all=TRUE, sort=FALSE)
