
################################# Part time employment rate (15+)
Part.time.employment.rate.15 <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="MF",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate...."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.employment.rate.precent"),
                                                source.age="15+",
                                                result.cut.year=cut.off.year)




################################# female part-time workers
Part.time.employment.rate.15.female <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                       source.sheet="KILM 6",
                                                       source.region="A3:AC9936", 
                                                       source.gender="F",
                                                       source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment...."),
                                                       result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Female.share.of.part.time.employment.percent"),
                                                       source.age="15+",
                                                       result.cut.year=cut.off.year)


Part.time.employment.rate.15.F <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                source.sheet="KILM 6",
                                                source.region="A3:AC9936", 
                                                source.gender="F",
                                                source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.workers...000.", "Total.employment...000."),
                                                result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.workers.000.F", "Total.employment.000.F"),
                                                source.age="15+",
                                                result.cut.year=cut.off.year)

Part.time.employment.rate.15.M <- get.ILO.latest( source.file="[R] [ILO] Part-time employment rate.xls",
                                                  source.sheet="KILM 6",
                                                  source.region="A3:AC9936", 
                                                  source.gender="M",
                                                  source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.workers...000.", "Total.employment...000."),
                                                  result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Part.time.workers.000.M", "Total.employment.000.M"),
                                                  source.age="15+",
                                                  result.cut.year=cut.off.year)

Part.time.employment.rate.15.MF <- get.ILO.denominator( source.file="[R] [ILO] Part-time employment rate.xls",
                                                   source.sheet="KILM 6",
                                                   source.region="A3:AC9936", 
                                                   source.gender="MF",
                                                   source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Total.employment...000."),
                                                   result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Total.employment.000.MF"),
                                                   source.age="15+",
                                                   numerator.list=Part.time.employment.rate.15.F)

merge1 <- merge(Part.time.employment.rate.15.F[, -4], Part.time.employment.rate.15.M[, -4], by=c("Country.Name", "ISO3", "Year", "Age.group"), sort=FALSE)
Part.time.employment.rate.15.F.ratios <- merge(merge1, Part.time.employment.rate.15.MF[, -4], by=c("Country.Name", "ISO3", "Year", "Age.group"), sort=FALSE, all.x=TRUE)

rm(merge1, Part.time.employment.rate.15.M, Part.time.employment.rate.15.F, Part.time.employment.rate.15.MF)

Part.time.employment.rate.15.F.ratios[, "Female.part.time.workers.out.of.total"] <- Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.F"] / Part.time.employment.rate.15.F.ratios[, "Total.employment.000.MF"]
Part.time.employment.rate.15.F.ratios[, "Female.part.time.workers.out.of.female.employ"] <- Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.F"] / Part.time.employment.rate.15.F.ratios[, "Total.employment.000.F"]
Part.time.employment.rate.15.F.ratios[, "Female.part.time.workers.by.full.time.female"] <- Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.F"] / (Part.time.employment.rate.15.F.ratios[, "Total.employment.000.F"] - Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.F"])
Part.time.employment.rate.15.F.ratios[, "Male.part.time.workers.by.full.time.male"] <- Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.M"] / (Part.time.employment.rate.15.F.ratios[, "Total.employment.000.M"] - Part.time.employment.rate.15.F.ratios[, "Part.time.workers.000.M"])
colnames(Part.time.employment.rate.15.F.ratios) <- c("Country.Name", "ISO3", "Year", "Age Group", "Female part time workers (000)", "Female total employment (000)", 
                                                     "Male part time workers (000)", "Male total employment (000)", "Total employment (000)",
                                                     "Female part time workers out of total employment", "Female part time workers out of female total employment",
                                                     "Female part time workers by female full time workers", "Male part time workers by male full time workers")


#save(Part.time.employment.rate.15.F.ratios, file="scripts/merging/Part.time.employment.rate.15.F.ratios.Rdata")

## testing for share / another ratio 
## "FEMALE PART TIME WORKERS TO TOTAL PART TIME WORKERS” and deflate this by another ratio, namely 'female employment out of total employment'
merged24 <- merge(Part.time.employment.rate.15.female[, c(2,3,6)], Part.time.employment.rate.15.F.ratios[, c(1,2,3,6,9)], by="ISO3", sort=FALSE)
merged24[, "ratio"] <- merged24[, "Female.share.of.part.time.employment.percent"]/(merged24[, "Female total employment (000)"]/merged24[, "Total employment (000)"])


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



## scripts to run codes for linked in new
## object name : linkedIn.users
## colnames : linkedin.ratio
source("scripts/linkedInUsers.R")

## scripts to run codes for scientific and tech journal
## object name : journals
source("scripts/Scientific and technical journal.R")

source("scripts/LPI.R")

## run the codes for researchers.FTE from 6.1
################# Researchers per million inhabitants (FTE)
researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (FTE).xlsx",
                                     source.sheet="download-27", 
                                     source.data.region="A6:R220",
                                     source.colnames="A4:R4", 
                                     result.colnames="Researchers per million inhabitants (FTE)",
                                     result.cut.year=cut.off.year)


journals.per.researchers.FTE <- merge(journals, researchers.FTE[, -1], by="ISO3", all.x=TRUE)
colnames(journals.per.researchers.FTE)[8] <- "Year"
journals.per.researchers.FTE[, "Stock per researchers FTE"] <- journals.per.researchers.FTE[, "Record.count.Stock.2003.2013"]/journals.per.researchers.FTE[, "Researchers per million inhabitants (FTE)"]
colnames(journals.per.researchers.FTE)[3] <- "Record count 2003-2013(stock)"

################# Willingness to delegate authority
Willingness.to.delegate.authority <- get.WEF(source.file="WEF.xlsx", 
                                             source.sheet="Sheet1", 
                                             source.data.region="CB8:CB155",
                                             source.colname="CB6", 
                                             source.date="C7", 
                                             source.countries="C8:C155")
