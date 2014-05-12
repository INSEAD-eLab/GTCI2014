################# ARCHIVE

################################# Part time female employment rate (25+)
Part.time.employment.rate.25.female <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                       source.sheet="KILM 6",
                                                       source.region="A3:AC9936", 
                                                       source.gender="F",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment.percent"),
                                                       source.age="25+",
                                                       result.cut.year=2003)

## countries in 15 but not in 25
setdiff(Part.time.employment.rate.15.female$Country.Name, Part.time.employment.rate.25.female$Country.Name)

## countries in 25 but not in 15
setdiff(Part.time.employment.rate.25.female$Country.Name, Part.time.employment.rate.15.female$Country.Name)


################################# Part time total employment rate (25+)
Part.time.employment.rate.25 <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                source.age="25+",
                                                result.cut.year=2003)

## countries which are in 15 but not in 25
setdiff(Part.time.employment.rate.15$Country.Name, Part.time.employment.rate.25$Country.Name)

## countries which are in 25 but not in 15
setdiff(Part.time.employment.rate.25$Country.Name, Part.time.employment.rate.15$Country.Name)