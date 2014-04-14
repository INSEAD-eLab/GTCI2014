rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")

ISO3 <- get.ISO3()

tradeWITS <- loadWorkbook("data/[R] [WITS] Low, Medium, and High-Technology.xlsx")

## get the data only without the column names and the country names
tradeWITS <- readWorksheet(tradeWITS, sheet="DataJobID-521090_521090_Comtr1", region="A1:J15189", header=TRUE)

## order the data
tradeWITS <- tradeWITS[order(tradeWITS$ReporterName, tradeWITS$Year, tradeWITS$TradeFlowName, tradeWITS$ProductCode, decreasing=T), ]

## get the latest year and country name
tradeWITSlatestyear <- tradeWITS[!duplicated(tradeWITS$ReporterName), c("ReporterName", "Year")]

## merge to get the latest year
tradeWITSwithLatestYear <- merge(tradeWITSlatestyear, tradeWITS, by=c("ReporterName", "Year"), sort=FALSE)

## order the data
tradeWITSwithLatestYear <- tradeWITSwithLatestYear[order(tradeWITSwithLatestYear$ReporterName, tradeWITSwithLatestYear$TradeFlowName, tradeWITSwithLatestYear$ProductCode, decreasing=FALSE), ]

## get the desired columns
tradeWITSwithLatestYear <- tradeWITSwithLatestYear[, c("ReporterName", "Year", "ProductCode", "TradeFlowName", "TradeValue.in.1000.USD")]
colnames(tradeWITSwithLatestYear)[1] <- "Country.Name"

############## Export

## Export Total
tradeWITSExTotal <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == " Total",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExTotal) <- c("Country.Name", "Year", "Export Total - trade value in 1000USD")

## Export Manuf
tradeWITSExManuf <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "manuf",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExManuf) <- c("Country.Name", "Year", "Export Total manufacturing - trade value in 1000USD")

## Export High tech
tradeWITSExHighTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "HighTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExHighTec) <- c("Country.Name", "Year", "Export High Tech - trade value in 1000USD")

## Export Med tech
tradeWITSExMedTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "MediumTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExMedTec) <- c("Country.Name", "Year", "Export Medium Tech - trade value in 1000USD")

## Export Low tech
tradeWITSExLowTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "LowTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExLowTec) <- c("Country.Name", "Year", "Export Low Tech - trade value in 1000USD")

## Export Primary products
tradeWITSExPrimary <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "PrimaryProds",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExPrimary) <- c("Country.Name", "Year", "Export Primary Products - trade value in 1000USD")

## Export Resource Based
tradeWITSExRes <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Export" & tradeWITSwithLatestYear$ProductCode == "ResourceBased",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSExRes) <- c("Country.Name", "Year", "Export Resource based - trade value in 1000USD")

merged1 <- merge(tradeWITSExManuf, tradeWITSExTotal, by=c("Country.Name", "Year"), all=TRUE)
merged2 <- merge(tradeWITSExHighTec, tradeWITSExMedTec, by=c("Country.Name", "Year"), all=TRUE)
merged3 <- merge(tradeWITSExLowTec, tradeWITSExPrimary, by=c("Country.Name", "Year"), all=TRUE)
merged4 <- merge(merged3, tradeWITSExRes, by=c("Country.Name", "Year"), all=TRUE)
merged5 <- merge(merged1, merged2, by=c("Country.Name", "Year"), all=TRUE)

Export <- merge(merged5, merged4, by=c("Country.Name", "Year"), all=TRUE)

############## Re-export

## Re-Export Total
tradeWITSReTotal <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == " Total",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReTotal) <- c("Country.Name", "Year", "Re-Export Total - trade value in 1000USD")

## Re-Export Manuf
tradeWITSReManuf <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "manuf",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReManuf) <- c("Country.Name", "Year", "Re-Export Total manufacturing - trade value in 1000USD")

## Re-Export High tech
tradeWITSReHighTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "HighTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReHighTec) <- c("Country.Name", "Year", "Re-Export High Tech - trade value in 1000USD")

## Re-Export Med tech
tradeWITSReMedTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "MediumTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReMedTec) <- c("Country.Name", "Year", "Re-Export Medium Tech - trade value in 1000USD")

## Re-Export Low tech
tradeWITSReLowTec <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "LowTech",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReLowTec) <- c("Country.Name", "Year", "Re-Export Low Tech - trade value in 1000USD")

## Re-Export Primary products
tradeWITSRePrimary <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "PrimaryProds",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSRePrimary) <- c("Country.Name", "Year", "Re-Export Primary Products - trade value in 1000USD")

## Re-Export Resource Based
tradeWITSReRes <- tradeWITSwithLatestYear[tradeWITSwithLatestYear$TradeFlowName == "Re-Export" & tradeWITSwithLatestYear$ProductCode == "ResourceBased",c("Country.Name", "Year", "TradeValue.in.1000.USD")]
colnames(tradeWITSReRes) <- c("Country.Name", "Year", "Re-Export Resource based - trade value in 1000USD")


merged1 <- merge(tradeWITSReTotal, tradeWITSReManuf, by=c("Country.Name", "Year"), all=TRUE)
merged2 <- merge(tradeWITSReHighTec, tradeWITSReMedTec, by=c("Country.Name", "Year"), all=TRUE)
merged3 <- merge(tradeWITSReLowTec, tradeWITSRePrimary, by=c("Country.Name", "Year"), all=TRUE)
merged4 <- merge(merged3, tradeWITSReRes, by=c("Country.Name", "Year"), all=TRUE)
merged5 <- merge(merged1, merged2, by=c("Country.Name", "Year"), all=TRUE)

ReExport <- merge(merged5, merged4, by=c("Country.Name", "Year"), all=TRUE)

TradeDataWITS <- merge(Export, ReExport, by=c("Country.Name", "Year"), all=TRUE)

## cleaning the R environment
rm(Export, ReExport, tradeWITSReTotal, tradeWITSReManuf, tradeWITSReHighTec, tradeWITSReMedTec, tradeWITSReLowTec, tradeWITSRePrimary, tradeWITSReRes, merged1, merged2,
   merged3, merged4, merged5, tradeWITSExManuf, tradeWITSExTotal, tradeWITSExHighTec, tradeWITSExMedTec, tradeWITSExLowTec, tradeWITSExPrimary, tradeWITSExRes)

### getting net
TradeDataWITS[, "netTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Total - trade value in 1000USD"]), as.numeric(row["Export Total - trade value in 1000USD"]), as.numeric(row["Export Total - trade value in 1000USD"]) - as.numeric(row["Re-Export Total - trade value in 1000USD"])))
TradeDataWITS[, "netTotalManuf"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Total manufacturing - trade value in 1000USD"]), as.numeric(row["Export Total manufacturing - trade value in 1000USD"]), as.numeric(row["Export Total manufacturing - trade value in 1000USD"]) - as.numeric(row["Re-Export Total manufacturing - trade value in 1000USD"])))
TradeDataWITS[, "netHighTech"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export High Tech - trade value in 1000USD"]), as.numeric(row["Export High Tech - trade value in 1000USD"]), as.numeric(row["Export High Tech - trade value in 1000USD"]) - as.numeric(row["Re-Export High Tech - trade value in 1000USD"])))
TradeDataWITS[, "netMedTech"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Medium Tech - trade value in 1000USD"]), as.numeric(row["Export Medium Tech - trade value in 1000USD"]), as.numeric(row["Export Medium Tech - trade value in 1000USD"]) - as.numeric(row["Re-Export Medium Tech - trade value in 1000USD"])))
TradeDataWITS[, "netLowTech"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Low Tech - trade value in 1000USD"]), as.numeric(row["Export Low Tech - trade value in 1000USD"]), as.numeric(row["Export Low Tech - trade value in 1000USD"]) - as.numeric(row["Re-Export Low Tech - trade value in 1000USD"])))
TradeDataWITS[, "netPrimaryProd"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Primary Products - trade value in 1000USD"]), as.numeric(row["Export Primary Products - trade value in 1000USD"]), as.numeric(row["Export Primary Products - trade value in 1000USD"]) - as.numeric(row["Re-Export Primary Products - trade value in 1000USD"])))
TradeDataWITS[, "netResourceBased"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["Re-Export Resource based - trade value in 1000USD"]), as.numeric(row["Export Resource based - trade value in 1000USD"]), as.numeric(row["Export Resource based - trade value in 1000USD"]) - as.numeric(row["Re-Export Resource based - trade value in 1000USD"])))

### getting ratios
TradeDataWITS[, "netHighTechbyTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netHighTech"]), NA, as.numeric(row["netHighTech"]) / as.numeric(row["netTotal"])))
TradeDataWITS[, "netMedTechbyTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netMedTech"]), NA, as.numeric(row["netMedTech"]) / as.numeric(row["netTotal"])))
TradeDataWITS[, "netLowTechbyTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netLowTech"]), NA, as.numeric(row["netLowTech"]) / as.numeric(row["netTotal"])))
TradeDataWITS[, "netPrimaryProdbyTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netPrimaryProd"]), NA, as.numeric(row["netPrimaryProd"]) / as.numeric(row["netTotal"])))
TradeDataWITS[, "netResourceBasedbyTotal"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netResourceBased"]), NA, as.numeric(row["netResourceBased"]) / as.numeric(row["netTotal"])))

TradeDataWITS[, "netHighMedTechbyTotal"] <- apply(TradeDataWITS, 1, function(row) getHighMedTech(as.numeric(row["netHighTech"]), as.numeric(row["netMedTech"]), as.numeric(row["netTotal"])))

TradeDataWITS[, "netHighTechbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netHighTech"]), NA, as.numeric(row["netHighTech"]) / as.numeric(row["netTotalManuf"])))
TradeDataWITS[, "netMedTechbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netMedTech"]), NA, as.numeric(row["netMedTech"]) / as.numeric(row["netTotalManuf"])))
TradeDataWITS[, "netLowTechbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netLowTech"]), NA, as.numeric(row["netLowTech"]) / as.numeric(row["netTotalManuf"])))
TradeDataWITS[, "netPrimaryProdbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netPrimaryProd"]), NA, as.numeric(row["netPrimaryProd"]) / as.numeric(row["netTotalManuf"])))
TradeDataWITS[, "netResourceBasedbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) ifelse(is.na(row["netResourceBased"]), NA, as.numeric(row["netResourceBased"]) / as.numeric(row["netTotalManuf"])))

TradeDataWITS[, "netHighMedTechbyTotalManu"] <- apply(TradeDataWITS, 1, function(row) getHighMedTech(as.numeric(row["netHighTech"]), as.numeric(row["netMedTech"]), as.numeric(row["netTotalManuf"])))

TradeDataWITS[, "Country.Name"] <- tolower(TradeDataWITS[, "Country.Name"])
TradeDataWITS <- merge(TradeDataWITS, ISO3, by="Country.Name", sort=FALSE, all.x=TRUE)

rm(ISO3, tradeWITS, tradeWITSlatestyear, tradeWITSwithLatestYear)
