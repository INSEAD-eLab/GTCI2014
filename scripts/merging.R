## run the codes for each subpillar
source("scripts/1.1 RegulatoryLandscape.R")

## rename the column accordingly
colnames(Ease.of.Establishment.Data)[2] <- "Ease of data"

## merge
merge <- merge(Political.Stability[, c(2:3)], Ease.of.Establishment.Data[, c(2,4)], by="ISO3", all=TRUE, sort=FALSE)
