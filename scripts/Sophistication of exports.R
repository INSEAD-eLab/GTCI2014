rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")

Exports <- data.frame()

filenames <- list.files("data/Sophistication of exports", pattern="*.xls", full.names=TRUE)
  
for(j in 1:length(filenames)){
  Exports.file <- loadWorkbook(filenames[j])
  Exports.new <- readWorksheet(Exports.file, sheet="Sheet1", header=T)  
  Exports <- rbind(Exports, Exports.new)
}

Exports <- Exports[, c(3,6:8)]
colnames(Exports)[1] <- "Country.Name"

ISO3 <- get.ISO3()

Exports[, "Country.Name"] <- tolower(Exports[, "Country.Name"])
Exports <- merge(ISO3, Exports, by="Country.Name", all.y=T, sort=F)

Exports.sorted <- Exports[order(Exports$Country.Name, Exports$Year, decreasing=T),]
Exports <- Exports.sorted[!duplicated(Exports.sorted$Country.Name),]

Exports <- Exports[!is.na(Exports$ISO3),]

