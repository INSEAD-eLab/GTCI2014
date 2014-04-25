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

colnames(tertiary.educated.population.above15.ILO.total)[6] <- "Tertiary-educated workforce"
colnames(tertiary.educated.population.above15.ILO.total.usa)[6] <- "Tertiary-educated workforce"
colnames(Legislators.senior.officials.managers.88)[7] <- "Legislators, senior officials and managers"
colnames(Female.legislators.senior.officials.managers.88)[7] <- "Female legislators, senior officials and managers"
colnames(legislators.senior.officials.managers.88.f)[12] <- "Female legislators, senior officials and managers"
colnames(Professional.88)[7] <- "Professionals"
colnames(female.professional.88)[7] <- "Female professionals"
colnames(professional.88.f)[12] <- "Female professionals"
colnames(researchers.FTE)[3] <- "Researchers"

## merge
merge61 <- merge(tertiary.educated.population.above15.ILO.total[, c(2,6)], tertiary.educated.population.above15.ILO.total.usa[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,Legislators.senior.officials.managers.88[, c(1,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,Female.legislators.senior.officials.managers.88[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,legislators.senior.officials.managers.88.f[, c(1,12)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,professionals[, c(1,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,female.professional.88[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,professional.88.F[, c(1,12)], by="ISO3", all=TRUE, sort=FALSE)
merge61 <- merge (merge61,researchers.FTE[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)

## Sub-pillar: Talent impact
source("scripts/6.2 TalentImpact.R")
## rename the column accordingly
head (innovation.output)
head (New.product.entrepreneurial.act)
head (New.business.density)

colnames(innovation.output)[3] <- "Innovation output"
colnames(New.product.entrepreneurial.act)[3] <- "New product entrepreneurial activity"
colnames(New.business.density)[3] <- "New business density"

merge62 <- merge (innovation.output[, c(3,4)], New.product.entrepreneurial.act[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge62 <- merge (merge62, New.business.density[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
