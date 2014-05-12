## generating each pillar
source("scripts/merging/mergeEnablers.R")
source("scripts/merging/mergeAttract.R")
source("scripts/merging/mergeGrow.R")
source("scripts/merging/mergeRetain.R")
source("scripts/merging/mergeLV.R")
source("scripts/merging/mergeGK.R")


## merging all pillars
load("scripts/merging/P1.Rdata")
load("scripts/merging/P2.Rdata")

mergedall1 <- merge(merge1, merge2, by="ISO3", all=TRUE)

load("scripts/merging/P3.Rdata")
load("scripts/merging/P4.Rdata")

mergedall2 <- merge(merge3, merge4, by="ISO3", all=TRUE)
mergedall  <- merge(mergedall1, mergedall2, by="ISO3", all=TRUE)

load("scripts/merging/P5.Rdata")
load("scripts/merging/P6.Rdata")

mergedall3 <- merge(merge5, merge6, by="ISO3", all=TRUE)
mergedall <- merge(mergedall, mergedall3, by="ISO3", all=TRUE)

save(mergedall, file="scripts/merging/all.Rdata")


## clean the memory
rm(list=ls())
source("scripts/functions.R")

Country.Names <- get.single.country.name.list()
load("scripts/merging/all.Rdata")

mergedall[is.na(mergedall[, "Venture capital deals"]), "Venture capital deals"] <- 0
mergedall[, "Venture capital deals"] <- mergedall[, "Venture capital deals"]/1000
mergedall[is.na(mergedall[, "QS university ranking"]), "QS university ranking"] <- 0

mergedall <- merge(Country.Names, mergedall, by="ISO3", all.y=TRUE)
mergedall <- mergedall[!is.na(mergedall$Country.Name), ]
mergedall <- mergedall[!mergedall$ISO3=="NFK",]
mergedall <- mergedall[!mergedall$ISO3=="SHN",]
mergedall <- mergedall[!mergedall$ISO3=="WLF",]

get.excel.download(mergedall, "Merged_20140506_1.xlsx")

