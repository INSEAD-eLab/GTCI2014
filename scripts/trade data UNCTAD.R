gc()

## to load the functions
source("scripts/functions.R")

ISO3 <- get.ISO3()

tradeUNCTAD <- loadWorkbook("data/[R] [UNCTAD] Low, Medium, and High-skill and technology.xlsx")

tradeUNCTADdata <- readWorksheet(tradeUNCTAD, sheet="us_tradematrix_e_groups_2788865", region="A18:O2217", header=FALSE)

tradeUNCTADColn <- readWorksheet(tradeUNCTAD, sheet="us_tradematrix_e_groups_2788865", region="C6:O6", header=FALSE)
tradeUNCTADColn <- apply(tradeUNCTADColn, 1, function(row) trimSpace(row))

colnames(tradeUNCTADdata) <- c("Country.Name", "Year", tradeUNCTADColn)

tradeUNCTADdataTBC <- tradeUNCTADdata[, -c(1:2)]

tradeUNCTADdataTBC <- apply(tradeUNCTADdataTBC, 1:2, function(x) ifelse(x=="_", NA, ifelse(x=="..", NA, as.numeric(x))))

tradeUNCTADdata[, 1] <- lapply(tradeUNCTADdata[1], function(x) tolower(trimSpace(x)))

tradeUNCTADdata <- cbind(tradeUNCTADdata[, 1:2], tradeUNCTADdataTBC)

tradeUNCTADdata <- merge(tradeUNCTADdata, ISO3, by="Country.Name")

tradeUNCTADdata <- tradeUNCTADdata[, c(16, 1:2, 3:8, 12)]

## order the data
tradeUNCTADdata <- tradeUNCTADdata[order(tradeUNCTADdata$Country.Name, tradeUNCTADdata$Year, decreasing=T), ]

## get the latest year and country name
tradeUNCTADdata <- tradeUNCTADdata[!duplicated(tradeUNCTADdata$Country.Name), ]

tradeUNCTADdata[, "Labour-intensiveByTotal"] <- tradeUNCTADdata[, 7] / tradeUNCTADdata[, 4]
tradeUNCTADdata[, "Low-skillByTotal"] <- tradeUNCTADdata[, 8] / tradeUNCTADdata[, 4]
tradeUNCTADdata[, "Med-skillByTotal"] <- tradeUNCTADdata[, 9] / tradeUNCTADdata[, 4]
tradeUNCTADdata[, "High-skillByTotal"] <- tradeUNCTADdata[, 10] / tradeUNCTADdata[, 4]

tradeUNCTADdata[, "Labour-intensiveByManuGoods"] <- tradeUNCTADdata[, 7] / tradeUNCTADdata[, 5]
tradeUNCTADdata[, "Low-skillByManuGoods"] <- tradeUNCTADdata[, 8] / tradeUNCTADdata[, 5]
tradeUNCTADdata[, "Med-skillByManuGoods"] <- tradeUNCTADdata[, 9] / tradeUNCTADdata[, 5]
tradeUNCTADdata[, "High-skillByManuGoods"] <- tradeUNCTADdata[, 10] / tradeUNCTADdata[, 5]

tradeUNCTADdata[, "Labour-intensiveByManuGoodsByDegree"] <- tradeUNCTADdata[, 7] / tradeUNCTADdata[, 6]
tradeUNCTADdata[, "Low-skillByManuGoodsByDegree"] <- tradeUNCTADdata[, 8] / tradeUNCTADdata[, 6]
tradeUNCTADdata[, "Med-skillByManuGoodsByDegree"] <- tradeUNCTADdata[, 9] / tradeUNCTADdata[, 6]
tradeUNCTADdata[, "High-skillByManuGoodsByDegree"] <- tradeUNCTADdata[, 10] / tradeUNCTADdata[, 6]

tradeUNCTADdata <- tradeUNCTADdata[!tradeUNCTADdata$ISO3 %in% c("ESH", "SRB", "ANT"),]

rm(ISO3, tradeUNCTADColn, tradeUNCTADdataTBC, tradeUNCTAD)
