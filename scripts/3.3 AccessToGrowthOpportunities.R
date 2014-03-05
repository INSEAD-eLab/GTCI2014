################################# Part time employment rate (15+)
Part.time.employment.rate.15 <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                source.age="15+",
                                                result.cut.year=2003)


################################# Part time employment rate (25+)
Part.time.employment.rate.25 <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                source.age="25+",
                                                result.cut.year=2003)
