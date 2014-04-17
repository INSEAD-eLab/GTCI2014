ISO3 <- get.ISO3()

RPI.2012 <- read.dta("data/[UN] Retail price indices 2012.dta")

data.ws <- loadWorkbook("data/[UN] Retail price indices.xls")
RPI <- readWorksheet(data.ws, sheet="Results", region="A1:J9544", header=T)

RPI <- RPI[, c(1,3,5,6,10)]


colnames(RPI)[1] <- "Country.Name"
RPI[, "Country.Name"] <- tolower(RPI[, "Country.Name"])
RPI[, "period"] <- trimSpace(RPI[, "period"])
RPI[, "Year"] <- as.numeric(substr(RPI[, "period"], 1, 4))
RPI[, "Month"]<- substr(RPI[, "period"], 5, 7)

RPI <- RPI[RPI$Year == 2013 & RPI$Month == "DEC",]
RPI <- merge(RPI, ISO3, by="Country.Name", all.x=T)

RPI <- RPI[!is.na(RPI$ISO3),]

RPI <- merge(RPI, RPI.2012[, c(1,7:9)], by="ISO3", all.x=T)

RPI1 <- RPI[RPI$series == "Price indices - Total retail price indices (RPI) living expenditures for UN officials",]
colnames(RPI1)[6] <- RPI[1, 3]
RPI1 <- RPI1[, -3]

RPI2 <- RPI[RPI$series == "Price indices - Retail price indices (RPI) living expenditures for UN officials; excluding housing",]
colnames(RPI2)[6] <- RPI2[1, 3]
RPI2 <- RPI2[, -3]

rm(RPI.2012, RPI, data.ws, ISO3)
