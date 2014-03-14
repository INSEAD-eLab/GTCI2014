
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

## countries which are in 15 but not in 25
setdiff(Part.time.employment.rate.15$Country.Name, Part.time.employment.rate.25$Country.Name)

## countries which are in 25 but not in 15
setdiff(Part.time.employment.rate.25$Country.Name, Part.time.employment.rate.15$Country.Name)

################################# female part-time workers

Part.time.employment.rate.15.female <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                       source.sheet="KILM 6",
                                                       source.region="A3:AC9936", 
                                                       source.gender="F",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                       source.age="15+",
                                                       result.cut.year=2003)

Part.time.employment.rate.25.female <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                       source.sheet="KILM 6",
                                                       source.region="A3:AC9936", 
                                                       source.gender="F",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                       source.age="25+",
                                                       result.cut.year=2003)

part.time.employment.rate.15.female.ratio <- merge(Part.time.employment.rate.15.female, Part.time.employment.rate.15, by=c("Country.Name", "ISO3", "Year", "Age.group"))
part.time.employment.rate.15.female.ratio[, "ratio"] <- part.time.employment.rate.15.female.ratio[, 6]/part.time.employment.rate.15.female.ratio[, 8]

part.time.employment.rate.25.female.ratio <- merge(Part.time.employment.rate.25.female, Part.time.employment.rate.25, by=c("Country.Name", "ISO3", "Year", "Age.group"))
part.time.employment.rate.25.female.ratio[, "ratio"] <- part.time.employment.rate.25.female.ratio[, 6]/part.time.employment.rate.25.female.ratio[, 8]

## countries in 15 but not in 25
setdiff(part.time.employment.rate.15.female.ratio$Country.Name, part.time.employment.rate.25.female.ratio$Country.Name)

## countries in 25 but not in 15
setdiff(part.time.employment.rate.25.female.ratio$Country.Name, part.time.employment.rate.15.female.ratio$Country.Name)


################# Use of virtual social networks
Use.virtual.social.networks  <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="AR8:AR155",
                                        source.colname="AR6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


################# State of cluster development
State.cluster.development  <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="BQ8:BQ155",
                                        source.colname="BQ6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


################# Quality of scientific research institutions
Quality.scientific.research.institutions <- get.WEF(source.file="WEF.xlsx", 
                                      source.sheet="Sheet1", 
                                      source.data.region="Z8:Z155",
                                      source.colname="Z6", 
                                      source.date="C7", 
                                      source.countries="C8:C155")