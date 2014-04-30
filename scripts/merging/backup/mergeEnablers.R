## Sub-pillar: Regulatory Landscape
source("scripts/1.1 RegulatoryLandscape.R")

## rename the column accordingly
head (Government.effectiveness)
head (busienss.gov.relations)
head (Political.Stability)
head (corruption.perception.index)
head (Ease.of.Establishment.Data)
colnames(Government.effectiveness)[3] <- "Government effectiveness"
colnames(busienss.gov.relations)[2] <- "Business-government relations"
colnames(Political.Stability)[3] <- "Political stability"
colnames(corruption.perception.index)[2] <- "Corruption perception"
colnames(Ease.of.Establishment.Data)[2] <- "Starting a foreign business"

## merge
merge11 <- merge(Government.effectiveness[, c(2,3)], busienss.gov.relations[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge11 <- merge (merge11,Political.Stability[, c(2:3)], by="ISO3", all=TRUE, sort=FALSE)
merge11 <- merge (merge11,corruption.perception.index[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge11 <- merge (merge11,Ease.of.Establishment.Data[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)

## save the object into Rdata file
save(merge11, file="scripts/merging/11.Rdata")

## Sub-pillar: Market Landscape
source("scripts/1.2 Market.Landscape.R")

## rename the column accordingly
head (intensity.local.competition)
head (Venture.capital.deals.scaled)
head (firm.level.tech.absorption)
head (R.D.expenditure)
head (ICT.access)
head (ease.of.doing.business.index)
colnames(intensity.local.competition)[2] <- "Intensity of local competition"
colnames(Venture.capital.deals.scaled)[7] <- "Venture capital deals"
colnames(firm.level.tech.absorption)[2] <- "Firm-level technology absorption"
colnames(R.D.expenditure)[3] <- "R&D expenditure"
colnames(ICT.access)[2] <- "ICT access"
colnames(ease.of.doing.business.index)[2] <- "Ease of doing business"

## merge
merge12 <- merge(intensity.local.competition[, c(2,4)], Venture.capital.deals.scaled[, c(1,4,6,7)], by="ISO3", all=TRUE, sort=FALSE)
merge12 <- merge (merge12,firm.level.tech.absorption[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge12 <- merge (merge12,R.D.expenditure[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge12 <- merge (merge12,ICT.access[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge12 <- merge (merge12,ease.of.doing.business.index[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)

## save the object into Rdata file
save(merge12, file="scripts/merging/12.Rdata")

## Sub-pillar: Business Landscape
source("scripts/1.3 Business.Landscape.R")
source("scripts/4.1 Sustainability.R")

## rename the column accordingly
head (Difficulty.of.hiring.index.score)
head (Rigidity.of.hours.index.score)
head (Difficulty.of.redundancy.index.score)
head (Cooperation.labor.employer.relations)
head (Labour.tax.and.contributions)
head (Reliance.professional.management)
colnames(Difficulty.of.hiring.index.score)[2] <- "Difficulty of hiring"
colnames(Rigidity.of.hours.index.score)[2] <- "Rigidity of hours"
colnames(Difficulty.of.redundancy.index.score)[2] <- "Difficulty of redundancy"
colnames(Cooperation.labor.employer.relations)[2] <- "Cooperation in labour-employer relations"
colnames(Labour.tax.and.contributions)[3] <- "Labour tax and contributions "
colnames(Reliance.professional.management)[2] <- "Reliance on professional management"

## merge
merge13 <- merge(Difficulty.of.hiring.index.score[, c(2,4)], Rigidity.of.hours.index.score[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge13 <- merge (merge13,Difficulty.of.redundancy.index.score[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge13 <- merge (merge13,Cooperation.labor.employer.relations[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge13 <- merge (merge13,Labour.tax.and.contributions[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge13 <- merge (merge13,Reliance.professional.management[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)

## save the object into Rdata file
save(merge13, file="scripts/merging/13.Rdata")

## clean the memory
rm(list=ls())
gc()

load("scripts/merging/11.Rdata")
load("scripts/merging/12.Rdata")
load("scripts/merging/13.Rdata")

merge1 <- merge(merge11, merge12, by="ISO3", all=TRUE)
merge1 <- merge(merge1, merge13, by="ISO3", all=TRUE)

save(merge1, file="scripts/merging/P1.Rdata")
unlink("scripts/merging/11.Rdata")
unlink("scripts/merging/12.Rdata")
unlink("scripts/merging/13.Rdata")

## clean the memory
rm(list=ls())
gc()
source("scripts/functions.R")
