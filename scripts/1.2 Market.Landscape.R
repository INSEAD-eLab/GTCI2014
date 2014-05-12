
################# Gross expenditure on R&D
R.D.expenditure <- get.UNESCO.format(source.file="[R] [UNESCO] Gross expenditure on R&D (% of GDP).xls",
                                     source.sheet="download-8", 
                                     source.data.region="A6:R220",
                                     source.colnames="A4:R4", 
                                     result.colnames="RnD.expenditure",
                                     result.cut.year=cut.off.year)


################# Business Government relation
intensity.local.competition <- get.WEF(source.file="WEF.xlsx", 
                                  source.sheet="Sheet1", 
                                  source.data.region="BK8:BK155",
                                  source.colname="BK6", 
                                  source.date="C7", 
                                  source.countries="C8:C155")


################# Venture capital availability
Venture.capital.availability <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="AX8:AX155",
                                        source.colname="AX6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


################# firm level tech absorption
firm.level.tech.absorption <- get.WEF(source.file="WEF.xlsx", 
                                        source.sheet="Sheet1", 
                                        source.data.region="X8:X155",
                                        source.colname="X6", 
                                        source.date="C7", 
                                        source.countries="C8:C155")


################# Venture capital deals
Venture.capital.deals <- get.WEF(source.file="[R] [Thomson] Venture capital deals (numerator).xls", 
                                 source.sheet="Quick Search", 
                                 source.data.region="B8:B84",
                                 source.colname="B7", 
                                 source.date="C1", 
                                 source.countries="A8:A84")

Venture.capital.deals.scaled <- scaling(numertor=Venture.capital.deals, 
                                numerator.colname="No. of Deals",
                                denominator.file="[R] [IMF WEO] Venture capital deals (denominator).xls", 
                                denominator.sheet="weoreptc(1)",
                                denominator.countries="B2:B189", 
                                denominator.data.region="G2:I189", 
                                denominator.years="G1:I1", 
                                result.colname="GDPPPP",
                                multiplier=1000)

colnames(Venture.capital.deals.scaled)[3] <- "Country.Name"

################# ICT access
ICT.access <- get.WEF(source.file="ICT access.xlsx", 
                      source.sheet="Sheet1", 
                      source.data.region="C3:C159",
                      source.colname="C1", 
                      source.date="C2", 
                      source.countries="A3:A159")


################# Ease of doing business index
ease.of.doing.business.index <- get.WEF(source.file="[R] [WB EODB] Ease of doing business index.xls", 
                                        source.sheet="file", 
                                        source.data.region="C3:C191",
                                        source.colname="C1", 
                                        source.date="B3", 
                                        source.countries="A3:A191")


## WDI data has same format as UNESCO and used that function
################################# Labour tax and contributions
Labour.tax.and.contributions <- get.UNESCO.format(source.file="[R] [WDI] Labour tax and contributions.xls",
                                                  source.sheet="Data", 
                                                  source.data.region="BD4:BE255",
                                                  source.colnames="BC3:BE3", 
                                                  result.colnames="Labour.tax.and.contributions",
                                                  result.cut.year=cut.off.year,
                                                  names.separated=TRUE, 
                                                  country.names="A4:A255")
