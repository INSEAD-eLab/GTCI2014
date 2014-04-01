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


################################ Top manager's experience
top.manager.experience <- get.WB.format(source.file="[R] [WB ES] Top manager's experience.xlsx",
                                         source.sheet="Workforce", 
                                         source.data.region="A9:J707",
                                         source.colnames="A1:J1", 
                                         source.result.col="Years of the top manager's experience working in the firm's sector",
                                         result.row="Average",
                                         result.cut.year=2003)


################# Labour market flexibility
Labour.market.flexibility <- get.WEF(source.file="[R] [FI EFW] Labour market flexibility.xls", 
                                     source.sheet="2011", 
                                     source.data.region="BF2:BF154",
                                     source.colname="BF1", 
                                     source.date="A2", 
                                     source.date.sheet="Chain-linked Index",
                                     source.countries="A2:A154",
                                     date.on.diff.sheet=TRUE)


################# Difficulty of hiring index score
Difficulty.of.hiring.index.score <- get.WEF(source.file="[R] [WB EODB] Employing workers.xlsx", 
                                     source.sheet="Rigidity of employment index", 
                                     source.data.region="C3:C191",
                                     source.colname="C2", 
                                     source.date="H2",
                                     source.countries="B3:B191")


################# Rigidity of hours index score
Rigidity.of.hours.index.score <- get.WEF(source.file="[R] [WB EODB] Employing workers.xlsx", 
                                            source.sheet="Rigidity of employment index", 
                                            source.data.region="D3:D191",
                                            source.colname="D2", 
                                            source.date="H2",
                                            source.countries="B3:B191")


################# Difficulty of redundancy index score
Difficulty.of.redundancy.index.score <- get.WEF(source.file="[R] [WB EODB] Employing workers.xlsx", 
                                         source.sheet="Rigidity of employment index", 
                                         source.data.region="E3:E191",
                                         source.colname="E2", 
                                         source.date="H2",
                                         source.countries="B3:B191")


################# Rigidity of employment index score
Rigidity.of.employment.index.score <- get.WEF(source.file="[R] [WB EODB] Employing workers.xlsx", 
                                         source.sheet="Rigidity of employment index", 
                                         source.data.region="F3:F191",
                                         source.colname="F2", 
                                         source.date="H2",
                                         source.countries="B3:B191")
