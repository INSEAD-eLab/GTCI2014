
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
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment.percent"),
                                                       source.age="15+",
                                                       result.cut.year=2003)

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

################# Citable documents H index
citable.documents.H.index  <- get.WEF(source.file="[R] [SCImago] Citable documents H-index.xlsx", 
                                      source.sheet="excel", 
                                      source.data.region="H2:H239",
                                      source.colname="H1", 
                                      source.date="J1", 
                                      source.countries="B2:B239")


################# LinkedIn users
linkedIn.users  <- get.WEF(source.file="[R] Linkedin users (numerator).xlsx", 
                                      source.sheet="Sheet1", 
                                      source.data.region="B4:B97",
                                      source.colname="B3", 
                                      source.date="A1", 
                                      source.countries="A4:A97")

labor.force <- get.ILO.latest( source.file="labour force.csv",
                               source.sheet="KILM 1a",
                               source.region="A3:G104331", 
                               source.gender="MF",
                               source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force...000."),
                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force.000"),
                               source.age="15-64",
                               result.cut.year=2003,
                               data.format="csv")

linkedIn.users.ratio <- merge(linkedIn.users, labor.force, by="ISO3", all.x=T, sort=F)
linkedIn.users.ratio[, 9] <- lapply(linkedIn.users.ratio[9], function(x) ifelse(is.na(x), NA, as.numeric(gsub(" ", "", as.character(x)))))

linkedIn.users.ratio[, "ratio"] <- linkedIn.users.ratio[, 3]/linkedIn.users.ratio[, 9]
