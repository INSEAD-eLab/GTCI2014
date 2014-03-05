
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
