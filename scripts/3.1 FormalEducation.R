
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
combined4[,"raios"] <- (combined4[,"graduates.science"] + combined4[,"graduates.engineering"]) / combined4[,"graduates.total"]


################# QS University Ranking
QS.university.ranking  <- get.WEF(source.file="[R] [QS] QS University ranking.xlsx", 
                                      source.sheet="Sheet1", 
                                      source.data.region="M2:M72",
                                      source.colname="M1", 
                                      source.date="O2", 
                                      source.countries="B2:B72")
