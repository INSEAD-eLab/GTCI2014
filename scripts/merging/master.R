## generating each pillar
## each line will generate P1, P2, ... P6 data object for each pillar. Then data object will be saved as R data and memory will be cleaned automatically.
source("scripts/merging/mergeEnablers.R") 
source("scripts/merging/mergeAttract.R")  
source("scripts/merging/mergeGrow.R")     
source("scripts/merging/mergeRetain.R")
source("scripts/merging/mergeLV.R")
source("scripts/merging/mergeGK.R")

## merging all pillars

load("scripts/merging/P1.Rdata")
load("scripts/merging/P2.Rdata")

## Merge 1 and 2
mergedall1 <- merge(merge1, merge2, by="ISO3", all=TRUE)

load("scripts/merging/P3.Rdata")
load("scripts/merging/P4.Rdata")

## Merge 3 and 4
mergedall2 <- merge(merge3, merge4, by="ISO3", all=TRUE)

## Merge 1+2 and 3+4
mergedall  <- merge(mergedall1, mergedall2, by="ISO3", all=TRUE)

load("scripts/merging/P5.Rdata")
load("scripts/merging/P6.Rdata")

## Merge 5 and 6
mergedall3 <- merge(merge5, merge6, by="ISO3", all=TRUE)

## Merge 1+2+3+4 and 5+6
mergedall <- merge(mergedall, mergedall3, by="ISO3", all=TRUE)

## save it as all.Rdata
save(mergedall, file="scripts/merging/all.Rdata")


## clean the memory
rm(list=ls())
source("scripts/functions.R")

Country.Names <- get.single.country.name.list()
load("scripts/merging/all.Rdata")

## Manually cleaned a few data points.
mergedall[is.na(mergedall[, "Venture capital deals"]), "Venture capital deals"] <- 0 ## from source, we know that the data covers world wide and if there is no data, it means 0.
mergedall[, "Venture capital deals"] <- mergedall[, "Venture capital deals"]/1000    ## we realized that venture capital deals out of billion is better
mergedall[is.na(mergedall[, "QS university ranking"]), "QS university ranking"] <- 0 ## from source, we know that the data covers world wide and if there is no data, it means 0.

## we want the country with only the names.
mergedall <- merge(Country.Names, mergedall, by="ISO3", all.y=TRUE)
mergedall <- mergedall[!is.na(mergedall$Country.Name), ]

## those 3 countries are duplicated and we want to remove them
mergedall <- mergedall[!mergedall$ISO3=="NFK",]
mergedall <- mergedall[!mergedall$ISO3=="SHN",]
mergedall <- mergedall[!mergedall$ISO3=="WLF",]

## download them as excel and this can be used for "Playbook" Raw sheet.
get.excel.download(mergedall, "Merged_20140512_2002.xlsx")

