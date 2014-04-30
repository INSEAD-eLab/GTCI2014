################ Labour productivity per hour employed
labour.productivity.per.hour.employed <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                             source.sheet="LP-Hour EKS",
                                                             source.countries="B3:EM3",
                                                             source.data.region="B69:EM69",
                                                             source.date.field="A69",
                                                             result.colname="labour productivity per hour employed",
                                                             single.year=TRUE)


################ total factor productivity growth
total.factor.productivity.growth <- get.conferenceboard(source.file="[R] [TCB] Total factor productivity growth.xls",
                                                        source.sheet="TFP %",
                                                        source.countries="B3:EM3",
                                                        source.data.region="B6:EM29",
                                                        source.date.field="A6:A29",
                                                        result.colname="total factor productivity growth",
                                                        single.year=FALSE)

############### Labour productivity per person employed, growth 
labour.productivity.per.person.employed.2013 <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                                    source.sheet="LP-person EKS",
                                                                    source.countries="B3:EM3",
                                                                    source.data.region="B69:EM69",
                                                                    source.date.field="A69",
                                                                    result.colname="labour productivity per person employed", 
                                                                    single.year=TRUE)

labour.productivity.per.person.employed.2012 <- get.conferenceboard(source.file="[R] [TCB] Labour productivity per person employed.xls",
                                                                    source.sheet="LP-person EKS",
                                                                    source.countries="B3:EM3",
                                                                    source.data.region="B68:EM68",
                                                                    source.date.field="A68",
                                                                    result.colname="labour productivity per person employed", 
                                                                    single.year=TRUE)

labour.productivity.per.person.employed.growth <- merge(labour.productivity.per.person.employed.2013, labour.productivity.per.person.employed.2012, by=c("ISO3", "Country.Name"))
labour.productivity.per.person.employed.growth[,"growth"] <- (labour.productivity.per.person.employed.growth[, 3] - labour.productivity.per.person.employed.growth[, 5])/labour.productivity.per.person.employed.growth[, 5]
colnames(labour.productivity.per.person.employed.growth) <- c("ISO3", "Country.Name", "Labour productivity per person employed (2013)", "Year" ,"Labour productivity per person employed (2012)", "Year", "growth (2013-2012)/2012")


############# end of Labour productivity per person employed, growth 
