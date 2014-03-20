
################# Pupil-teacher ratio (secondary)
pupil.teacher.ratio.secondary <- get.UNESCO.format(source.file="[R] [UNESCO] Pupil-teacher ratio (secondary).xlsx",
                                       source.sheet="download-13", 
                                       source.data.region="A6:P222",
                                       source.colnames="A4:P4", 
                                       result.colnames="Pupil-teacher ratio (secondary)",
                                       result.cut.year=2003)


################# Technical vocational enrolment
Technical.vocational.enrolment <- get.UNESCO.format(source.file="[R] [UNESCO] Technical vocational enrolment.xlsx",
                                                    source.sheet="download-16", 
                                                    source.data.region="A6:P222",
                                                    source.colnames="A4:P4", 
                                                    result.colnames="Technical vocational enrolment",
                                                    result.cut.year=2003)


################# Tertiary enrolment
Tertiary.enrolment <- get.UNESCO.format(source.file="[R] [UNESCO] Tertiary enrolment.xlsx",
                                        source.sheet="download-17", 
                                        source.data.region="A6:P222",
                                        source.colnames="A4:P4", 
                                        result.colnames="Tertiary enrolment",
                                        result.cut.year=2003)


################# Gross graduation ratio
gross.graduation.ratio <- get.UNESCO.format(source.file="[R] [UNESCO] Gross graduation ratio (ISCED 5A).xlsx",
                                            source.sheet="download-18", 
                                            source.data.region="A6:P222",
                                            source.colnames="A4:P4", 
                                            result.colnames="Gross graduation ratio",
                                            result.cut.year=2003)

################# Lower secondary gross graduation ratio
Lower.secondary.gross.graduation.ratio <- get.UNESCO.format(source.file="[R] [UNESCO] Lower secondary gross graduation ratio.xls",
                                            source.sheet="download-21", 
                                            source.data.region="A6:P222",
                                            source.colnames="A4:P4", 
                                            result.colnames="Lower secondary gross graduation ratio",
                                            result.cut.year=2003)

################# Tertiary inbound mobility rate
Tertiary.inbound.mobility.rate <- get.UNESCO.format(source.file="[R] [UNESCO] Tertiary inbound mobility rate.xlsx",
                                                    source.sheet="download-23", 
                                                    source.data.region="A6:P222",
                                                    source.colnames="A4:P4", 
                                                    result.colnames="Tertiary inbound mobility rate",
                                                    result.cut.year=2003)

################# Tertiary outbound mobility rate
Tertiary.outbound.mobility.rate <- get.UNESCO.format(source.file="[R] [UNESCO] Tertiary outbound mobility rate.xlsx",
                                                    source.sheet="download-24", 
                                                    source.data.region="A6:P222",
                                                    source.colnames="A4:P4", 
                                                    result.colnames="Tertiary outbound mobility rate",
                                                    result.cut.year=2003)


################# science graduates
graduates.science <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                       source.sheet="download-19", 
                                       source.data.region="Q6:AE222",
                                       source.colnames="A4:P4", 
                                       result.colnames="graduates.science",
                                       result.cut.year=2003,
                                       names.separated=TRUE, 
                                       country.names="A6:A222")


################# engineering graduates
graduates.engineering <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                           source.sheet="download-19", 
                                           source.data.region="AF6:AT222",
                                           source.colnames="A4:P4", 
                                           result.colnames="graduates.engineering",
                                           result.cut.year=2003,
                                           names.separated=TRUE, 
                                           country.names="A6:A222")


################# engineering graduates
graduates.total <- get.UNESCO.format(source.file="[R] [UNESCO] Graduates in science and engineering.xlsx",
                                     source.sheet="download-19", 
                                     source.data.region="A6:P222",
                                     source.colnames="A4:P4", 
                                     result.colnames="graduates.total",
                                     result.cut.year=2003)


## combine science and engineering graduates
combined1 <- merge(graduates.science, graduates.engineering, by=c("ISO3", "Country.Name", "Year"), all=T)
key <- combined1$ISO3
combined2 <- do.call(rbind, by(combined1[, 3:5], key, colSums, na.rm=T))
combined2 <- data.frame(combined2, stringsAsFactors=F)

combined2[combined2$Year>2015,]
combined2[,"ISO3"] <- rownames(combined2)

## combine with graduates.total
combined3 <- merge(combined2, graduates.total, by=c("ISO3", "Year"), all=T)
key <- combined3$ISO3
combined4 <- do.call(rbind, by(combined3[, c(2,3,4,6)], key, colSums, na.rm=T))
combined4 <- data.frame(combined4, stringsAsFactors=F)

## check Country coverage
combined4[combined4$Year>2015,]

## get the ratio
combined4[,"science.and.engineering.ratio"] <- (combined4[,"graduates.science"] + combined4[,"graduates.engineering"]) / combined4[,"graduates.total"]
combined4[,"science.ratio"] <- combined4[,"graduates.science"] / combined4[,"graduates.total"]
combined4[,"engineering.ratio"] <- combined4[,"graduates.engineering"] / combined4[,"graduates.total"]
combined4[,"ISO3"] <- rownames(combined4)
combined4 <- merge(combined4, graduates.total[, c(1,4)], by="ISO3")
combined4 <- combined4[, c(9, 1:8)]

rm(combined1, combined2, combined3)

####################################################################### PISA scores

### 2012
PISA.maths.2012  <- get.WEF(source.file="[R] [OECD] PISA mathematics score (2012).xls", 
                            source.sheet="Table I.2.3a", 
                            source.data.region="B16:B83",
                            source.colname="A7", 
                            source.date="A1", 
                            source.countries="A16:A83")

PISA.reading.2012  <- get.WEF(source.file="[R] [OECD] PISA reading score (2012).xls", 
                              source.sheet="Table I.4.3a", 
                              source.data.region="B16:B83",
                              source.colname="A7", 
                              source.date="A1", 
                              source.countries="A16:A83")

PISA.science.2012  <- get.WEF(source.file="[R] [OECD] PISA science score (2012).xls", 
                              source.sheet="Table I.5.3a", 
                              source.data.region="B16:B83",
                              source.colname="A7", 
                              source.date="A1", 
                              source.countries="A16:A83")

PISA.2012 <- merge(PISA.maths.2012, PISA.reading.2012, by=c("ISO3", "Country.Name", "Year"))
PISA.2012 <- merge(PISA.2012, PISA.science.2012, by=c("ISO3", "Country.Name", "Year"))
PISA.2012[, "average"] <- (PISA.2012[, 4] + PISA.2012[, 5] + PISA.2012[, 6])/3

rm(PISA.maths.2012, PISA.reading.2012, PISA.science.2012)

### 2009
PISA.reading.2009  <- get.WEF(source.file="[R] [OECD] PISA reading, math and science score (2009).xls", 
                              source.sheet="Table I.A", 
                              source.data.region="B7:B71",
                              source.colname="B5", 
                              source.date="A1", 
                              source.countries="A7:A71")

PISA.maths.2009  <- get.WEF(source.file="[R] [OECD] PISA reading, math and science score (2009).xls", 
                              source.sheet="Table I.A", 
                              source.data.region="H7:H71",
                              source.colname="H5", 
                              source.date="A1", 
                              source.countries="A7:A71")

PISA.science.2009  <- get.WEF(source.file="[R] [OECD] PISA reading, math and science score (2009).xls", 
                              source.sheet="Table I.A", 
                              source.data.region="I7:I71",
                              source.colname="I5", 
                              source.date="A1", 
                              source.countries="A7:A71")

PISA.2009 <- merge(PISA.reading.2009, PISA.maths.2009, by=c("ISO3", "Country.Name", "Year"))
PISA.2009 <- merge(PISA.2009, PISA.science.2009, by=c("ISO3", "Country.Name", "Year"))
PISA.2009[, "average"] <- (PISA.2009[, 4] + PISA.2009[, 5] + PISA.2009[, 6])/3

rm(PISA.maths.2009, PISA.reading.2009, PISA.science.2009)

#########countries which are in 2012 but not in 2009
setdiff(PISA.2012$Country.Name, PISA.2009$Country.Name)

#########countries which are in 2009 but not in 2012
setdiff(PISA.2009$Country.Name, PISA.2012$Country.Name)

## 2009+
PISA.maths.2009.plus  <- get.WEF(source.file="[R] [ACER] PISA maths score (2009+).xlsx", 
                                 source.sheet="Sheet2", 
                                 source.data.region="B2:B7",
                                 source.colname="B1", 
                                 source.date="C1", 
                                 source.countries="A2:A7")

PISA.reading.2009.plus  <- get.WEF(source.file="[R] [ACER] PISA reading score (2009+).xlsx", 
                                   source.sheet="Sheet2", 
                                   source.data.region="B2:B7",
                                   source.colname="B1", 
                                   source.date="C1", 
                                   source.countries="A2:A7")

PISA.science.2009.plus  <- get.WEF(source.file="[R] [ACER] PISA science score (2009+).xlsx", 
                                   source.sheet="Sheet2", 
                                   source.data.region="B2:B7",
                                   source.colname="B1", 
                                   source.date="C1", 
                                   source.countries="A2:A7")

PISA.2009.plus <- merge(PISA.reading.2009.plus, PISA.maths.2009.plus, by=c("ISO3", "Country.Name", "Year"))
PISA.2009.plus <- merge(PISA.2009.plus, PISA.science.2009.plus, by=c("ISO3", "Country.Name", "Year"))
PISA.2009.plus[, "average"] <- (PISA.2009.plus[, 4] + PISA.2009.plus[, 5] + PISA.2009.plus[, 6])/3

rm(PISA.maths.2009.plus, PISA.reading.2009.plus, PISA.science.2009.plus)

## merging
PISA.2009.plus[, "Year"] <- 2010
PISA.2009[, "Year"] <- 2009
PISA.2012[, "Year"] <- 2012

## changing the colnames to be merged
colnames(PISA.2012) <- c("ISO3", "Country.Name", "Year", "Maths", "Reading", "Science", "Average")
PISA.2012 <- PISA.2012[, c(1:3,5,4,6:7)]
colnames(PISA.2009) <- c("ISO3", "Country.Name", "Year", "Reading", "Maths", "Science", "Average")
colnames(PISA.2009.plus) <- c("ISO3", "Country.Name", "Year", "Reading", "Maths", "Science", "Average")

## merged
PISA <- rbind(PISA.2009, PISA.2009.plus, PISA.2012)

## sort by ISO3, year decreasing to get the latest year available
PISA.sorted <- PISA[order(PISA$ISO3, PISA$Year, decreasing=T),]
PISA.latest <- PISA.sorted[!duplicated(PISA.sorted$ISO3),]

## revert back 2009+ data
PISA.latest[PISA.latest$Year == 2010, "Year"] <- "2009+"

####################################################################### end of PISA

################# QS University Ranking
QS.university.ranking  <- get.WEF(source.file="[R] [QS] QS University ranking.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="M2:M72",
                                  source.colname="M1", 
                                  source.date="O2", 
                                  source.countries="B2:B72")
