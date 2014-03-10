
################# Researchers per million inhabitants (HC)
researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (HC).xlsx",
                                    source.sheet="download-28", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (HC)",
                                    result.cut.year=2003)

################# Researchers per million inhabitants (FTE)
researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Researchers per million inhabitants (FTE).xlsx",
                                    source.sheet="download-27", 
                                    source.data.region="A6:R220",
                                    source.colnames="A4:R4", 
                                    result.colnames="Researchers per million inhabitants (FTE)",
                                    result.cut.year=2003)


################# Female researchers (FTE)
female.researchers.FTE <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (FTE).xlsx",
                                            source.sheet="download-30", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (FTE)",
                                            result.cut.year=2003)


################# Female researchers (HC)
female.researchers.HC <- get.UNESCO.format(source.file="[R] [UNESCO] Female researchers (HC).xlsx",
                                            source.sheet="download-29", 
                                            source.data.region="A6:R220",
                                            source.colnames="A4:R4", 
                                            result.colnames="percent of female researchers (HC)",
                                            result.cut.year=2003)

