################################ Firms offering formal training
firms.offering.training <- get.WB.format(source.file="[R] [WB ES] Firms offering formal training.xlsx",
                                         source.sheet="Workforce", 
                                         source.data.region="A9:J707",
                                         source.colnames="A1:J1", 
                                         source.result.col="Percent of firms offering formal training",
                                         result.row="Average",
                                         result.cut.year=2003)


################# Quality of management schools
Quality.management.schools  <- get.WEF(source.file="WEF.xlsx", 
                                    source.sheet="Sheet1", 
                                    source.data.region="DD8:DD155",
                                    source.colname="DD6", 
                                    source.date="C7", 
                                    source.countries="C8:C155")

################# Extent of staff training
Extent.staff.training  <- get.WEF(source.file="WEF.xlsx", 
                                       source.sheet="Sheet1", 
                                       source.data.region="DN8:DN155",
                                       source.colname="DN6", 
                                       source.date="C7", 
                                       source.countries="C8:C155")

################################# Part time employment rate (15+)
Part.time.employment.rate.15 <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                source.age="15+",
                                                result.cut.year=2003)