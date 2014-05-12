################ Labour productivity per person employed
labour.productivity.per.person.employed <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                               source.sheet="LP-person EKS",
                                                               source.countries="B3:EM3",
                                                               source.data.region="B69:EM69",
                                                               source.date.field="A69",
                                                               result.colname="labour productivity per person employed", 
                                                               single.year=TRUE)


################# Pay and productivity
pay.and.productivity <- get.WEF(source.file="WEF.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="DL8:DL155",
                                  source.colname="DL6", 
                                  source.date="C7", 
                                  source.countries="C8:C155")
pay.and.productivity[, "Year"] <- 2013


## for trade Data WITS
## result variable name is : TradeDataWITS
## to check column names : colnames(TradeDataWITS)
source("scripts/trade data WITS.R")

## for trade Data UNCTAD
## result variable name is : tradeUNCTADdata
## to check column names : colnames(tradeUNCTADdata)
source("scripts/trade data UNCTAD.R")