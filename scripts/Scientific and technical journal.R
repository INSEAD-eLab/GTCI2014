################# GDP PPP 2013
GDP.PPP.2013 <- get.WEF(source.file="[R] [IMF WEO] GDP PPP$ (denominator).xls", 
                        source.sheet="weoreptc(1)", 
                        source.data.region="I2:I189",
                        source.colname="C2", 
                        source.date="I1", 
                        source.countries="B2:B189",
                        different.source=TRUE)

ISO3 <- get.ISO3()

data.ws <- loadWorkbook("data/[Web of Science] GTCI parameter 2003-2013.xlsx")
stock <- readWorksheet(data.ws, sheet="Sheet1", region="A1:C204", header=T)
stock[, "Country.Name"] <- tolower(stock[, "Country.Name"])
colnames(stock)[2] <- "Record.count.Stock.2003.2013" 

data.ws <- loadWorkbook("data/[Web of Science] GTCI parameter 2013.xlsx")
flow <- readWorksheet(data.ws, sheet="Sheet1", region="A1:C175", header=T)
flow[, "Country.Name"] <- tolower(flow[, "Country.Name"])
colnames(flow)[2] <- "Record.count.Flow.2013" 

journals <- merge(stock, flow, by="Country.Name", all=T)

journals <- merge(journals, ISO3, by="Country.Name", all.x=TRUE)

journals <- journals[!is.na(journals$ISO3),]

journals <- merge(journals, GDP.PPP.2013, by="ISO3", all.x=T)

journals <- journals[, c(1:6,8:9)]

colnames(journals)[2] <- "Country.Name"
journals[, "Stock per million GDP"] <- 1000*journals[, 3]/journals[, 7]
journals[, "Flow per million GDP"] <- 1000*journals[, 5]/journals[, 7]

rm(stock, flow, GDP.PPP.2013, ISO3, data.ws)

## WDI data has same format as UNESCO and used that function
################################# Labour tax and contributions
journals.WB <- get.UNESCO.format(source.file="[R] [WB WDI] Scientific and technical journal articles.xls",
                                 source.sheet="Data", 
                                 source.data.region="AW5:BE255",
                                 source.colnames="AV3:BE3", 
                                 result.colnames="Scientific and technical journal articles",
                                 result.cut.year=cut.off.year,
                                 names.separated=TRUE, 
                                 country.names="B5:B255")


journals.WB.scaled <- scaling(numertor=journals.WB, 
                                        numerator.colname="Scientific and technical journal articles",
                                        denominator.file="[R] [IMF] WEO GDP PPP$ (denominator).xls", 
                                        denominator.sheet="weoreptc.aspx",
                                        denominator.countries="A2:A189", 
                                        denominator.data.region="F2:J189", 
                                        denominator.years="F1:J1", 
                                        result.colname="GDPPPP",
                                        multiplier=1000)

journals.WB.scaled <- journals.WB.scaled[!is.na(journals.WB.scaled$ratio),]
colnames(journals.WB.scaled)[3] <- "Country.Name"

rm(journals.WB)
