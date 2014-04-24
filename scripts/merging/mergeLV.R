## Sub-pillar: Employable Skills
source("scripts/5.1 EmployableSkills.R")

## rename the column accordingly
head (secondary.educated.population.above15.ILO.total)
head (secondary.educated.population.above15.ILO.total.usa)
head (tech.asso.88.MF.latest)
head (tech.asso.88.F.latest)
head (tech.asso.88.F)
head (youth.employment)

colnames(secondary.educated.population.above15.ILO.total)[6] <- "Secondary-educated workforce"
colnames(secondary.educated.population.above15.ILO.total.usa)[6] <- "Secondary-educated workforce"
colnames(tech.asso.88.MF.latest)[7] <- "Technicians and associate professionals"
colnames(tech.asso.88.F.latest)[7] <- "Female technicians and associate professionals"
colnames(tech.asso.88.F)[12] <- "Female technicians and associate professionals"
colnames(youth.employment)[6] <- "Youth employment"

## merge
merge51 <- merge(secondary.educated.population.above15.ILO.total[, c(2,6)], secondary.educated.population.above15.ILO.total.usa[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)
merge51 <- merge (merge51,tech.asso.88.MF.latest[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge51 <- merge (merge51,tech.asso.88.F.latest[, c(2,7)], by="ISO3", all=TRUE, sort=FALSE)
merge51 <- merge (merge51,tech.asso.88.F[, c(1,12)], by="ISO3", all=TRUE, sort=FALSE)
merge51 <- merge (merge51,youth.employment[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)

## Sub-pillar: Employable Skills
source("scripts/5.1 EmployableSkills.R")
## rename the column accordingly
head (labour.productivity.per.person.employed)
head (pay.and.productivity)
colnames(labour.productivity.per.person.employed)[2] <- "Labour productivity per employee"
colnames(pay.and.productivity)[2] <- "Relationship of pay to productivity"

merge52 <- merge (labour.productivity.per.person.employed[, c(2,4)], pay.and.productivity[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
