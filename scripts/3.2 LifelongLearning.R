################################ Firms offering formal training
firms.offering.training <- get.WB.format(source.file="[R] [WB ES] Firms offering formal training.xlsx",
                                         source.sheet="Workforce", 
                                         source.data.region="A9:J707",
                                         source.colnames="A1:J1", 
                                         source.result.col="Percent of firms offering formal training",
                                         result.row="Average",
                                         result.cut.year=2003)
