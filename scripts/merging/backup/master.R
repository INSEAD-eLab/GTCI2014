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
gc()
source("scripts/functions.R")

Country.Names <- get.single.country.name.list()
load("scripts/merging/all.Rdata")
mergedall <- merge(Country.Names, mergedall, by="ISO3", all.y=TRUE)
mergedall <- mergedall[!is.na(mergedall$Country.Name), ]

get.excel.download(mergedall, "Merged_20140428_1.xlsx")

