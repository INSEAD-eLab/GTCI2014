################# Cooperation in labor-employer relations
Cooperation.labor.employer.relations <- get.WEF(source.file="WEF.xlsx", 
                                      source.sheet="Sheet1", 
                                      source.data.region="DJ8:DJ155",
                                      source.colname="DJ6", 
                                      source.date="C7", 
                                      source.countries="C8:C155")


################# Flexibility of wage determination
Flexibility.wage.determination <- get.WEF(source.file="WEF.xlsx", 
                                                source.sheet="Sheet1", 
                                                source.data.region="DK8:DK155",
                                                source.colname="DK6", 
                                                source.date="C7", 
                                                source.countries="C8:C155")


################# Hiring and firing practices
Hiring.firing.practices <- get.WEF(source.file="WEF.xlsx", 
                                          source.sheet="Sheet1", 
                                          source.data.region="DI8:DI155",
                                          source.colname="DI6", 
                                          source.date="C7", 
                                          source.countries="C8:C155")

################# Reliance on professional management
Reliance.professional.management <- get.WEF(source.file="WEF.xlsx", 
                                   source.sheet="Sheet1", 
                                   source.data.region="CD8:CD155",
                                   source.colname="CD6", 
                                   source.date="C7", 
                                   source.countries="C8:C155")


################# Efficacy of corporate boards
Efficacy.corporate.boards <- get.WEF(source.file="WEF.xlsx", 
                                            source.sheet="Sheet1", 
                                            source.data.region="CE8:CE155",
                                            source.colname="CE6", 
                                            source.date="C7", 
                                            source.countries="C8:C155")


################# Willingness to delegate authority
Willingness.to.delegate.authority <- get.WEF(source.file="WEF.xlsx", 
                                     source.sheet="Sheet1", 
                                     source.data.region="CB8:CB155",
                                     source.colname="CB6", 
                                     source.date="C7", 
                                     source.countries="C8:C155")