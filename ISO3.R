install.packages("XLConnect")

library (XLConnect)
ISO3<-loadWorkbook("Country List with ISO3.xlsx")
ISO3<-readWorksheet(ISO3, sheet="Country Code", region="B3:C450", header=T)

head(ISO3)