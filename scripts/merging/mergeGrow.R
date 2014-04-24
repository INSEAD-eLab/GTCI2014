## Sub-pillar: Formal Education
source("scripts/3.1 FormalEducation.R")

## rename the column accordingly
head (Technical.vocational.enrolment)
head (Tertiary.enrolment)
head (science.engineering.ratios)
head (PISA.latest)
head (QS.university.ranking)
head (Tertiary.inbound.mobility.ratio)
head (Tertiary.outbound.mobility.rate)
colnames(Technical.vocational.enrolment)[3] <- "Technical/vocational enrolment"
colnames(Tertiary.enrolment)[3] <- "Tertiary enrolment"
colnames(science.engineering.ratios)[7] <- "Graduates in science and engineering"
colnames(science.engineering.ratios)[8] <- "Graduates in science"
colnames(science.engineering.ratios)[9] <- "Graduates in engineering"
colnames(PISA.latest)[7] <- "Reading, maths, and science scores"
colnames(QS.university.ranking)[2] <- "QS university ranking"
colnames(Tertiary.inbound.mobility.ratio)[3] <- "International students inflow"
colnames(Tertiary.outbound.mobility.rate)[3] <- "International students outflow"


## merge
merge31 <- merge(Technical.vocational.enrolment[, c(3,4)], Tertiary.enrolment[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge31 <- merge (merge31,science.engineering.ratios[, c(6:9)], by="ISO3", all=TRUE, sort=FALSE)
merge31 <- merge (merge31,PISA.latest[, c(1,7)], by="ISO3", all=TRUE, sort=FALSE)
merge31 <- merge (merge31,QS.university.ranking[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge31 <- merge (merge31,Tertiary.inbound.mobility.ratio[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge31 <- merge (merge31,Tertiary.outbound.mobility.rate[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)

## Sub-pillar: Lifelong learning
source("scripts/3.2 LifelongLearning.R")
source("scripts/3.3 AccessToGrowthOpportunities.R")

## rename the column accordingly
head (Quality.management.schools)
head (Extent.staff.training)
head (firms.offering.training)
head (Part.time.employment.rate.15)
colnames(Quality.management.schools)[2] <- "Quality of management schools"
colnames(Extent.staff.training)[2] <- "Extent of staff training"
colnames(firms.offering.training)[3] <- "Firms offering formal training"
colnames(Part.time.employment.rate.15)[6] <- "Part-time employment rate"

## merge
merge32 <- merge(Quality.management.schools[, c(2,4)], Extent.staff.training[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge32 <- merge (merge32,firms.offering.training[, c(3,4)], by="ISO3", all=TRUE, sort=FALSE)
merge32 <- merge (merge32,Part.time.employment.rate.15[, c(2,6)], by="ISO3", all=TRUE, sort=FALSE)

## Sub-pillar: Access to growth opportunities
source("scripts/3.3 AccessToGrowthOpportunities.R")
source("scripts/1.3 Business.Landscape.R")

## rename the column accordingly
head (Use.virtual.social.networks)
head (linkedIn.users)
head (State.cluster.development)
head (Quality.scientific.research.institutions)
# head (scientific and technical journals)
head (Willingness.to.delegate.authority)
colnames(Use.virtual.social.networks)[2] <- "Use of virtual social networks"
colnames(linkedIn.users)[16] <- "Linkedin users"
colnames(State.cluster.development)[2] <- "State of cluster development"
colnames(Quality.scientific.research.institutions)[2] <- "Quality of scientific research institutions"
colnames(Willingness.to.delegate.authority)[2] <- "Willingness to delegate authority"

## merge
merge33 <- merge(Use.virtual.social.networks[, c(2,4)], linkedIn.users[, c(1,16)], by="ISO3", all=TRUE, sort=FALSE)
merge33 <- merge (merge33,State.cluster.development[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge33 <- merge (merge33,Quality.scientific.research.institutions[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
merge33 <- merge (merge33,Willingness.to.delegate.authority[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
