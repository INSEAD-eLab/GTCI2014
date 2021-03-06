rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")


## Pillar 6

## subpillar 6.2
generate.pdf(innovation.output, "GII innovation output", "GII Innovation Output")
generate.pdf(scaled.total.patent.resident.applications, "Scaled total patent resident applications", "Total patent resident applications")
generate.pdf(scaled.patent.resident.granted, "Scaled total patent resident granted", "Total patent resident granted")
generate.pdf(New.business.density, "New business density", "New business density")
generate.pdf(New.product.entrepreneurial.act, "New.product.entrepreneurial.act", "New product entrepreneurial activity", "Note: Source = GEM.")
generate.pdf(established.business.ownership, "Established business ownership", "Established business ownership")
generate.pdf(new.business.ownership, "New business ownership", "New business ownership")

generate.pdf(TradeDataWITS[, c(36, 1, 2, 24)] , "netHighTechbyTotal", "Net High Tech export by net total export", "Note : netHighTechbyTotal = Net High Tech Export / Net Total Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 25)] , "netMedTechbyTotal", "Net Medium Tech export by net total export", "Note : netMedTechbyTotal = Net Medium Tech Export / Net Total Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 26)] , "netLowTechbyTotal", "Net Low Tech export by net total export", "Note : netLowTechbyTotal = Net Low Tech Export / Net Total Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 27)] , "netPrimaryProdbyTotal", "Net Primary Products export by net total export", "Note : netPrimaryProdbyTotal = Net Primary Products Export / Net Total Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 28)] , "netResourceBasedbyTotal", "Net Resource Based export by net total export", "Note : netResourceBasedbyTotal = Net Resource Based Export / Net Total Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 29)] , "netHighMedTechbyTotal", "Net High and Medium Tech export by net total export", "Note : netHighMedTechbyTotal = Net High + Medium Tech Export / Net Total Export. Net = Export - Re-Export. Source : WITS")

generate.pdf(TradeDataWITS[, c(36, 1, 2, 30)] , "netHighTechbyTotalManu", "Net High Tech export by net total manufacturing export", "Note : netHighTechbyTotalManu = Net High Tech Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 31)] , "netMedTechbyTotalManu", "Net Medium Tech export by net total manufacturing export", "Note : netMedTechbyTotalManu = Net Medium Tech Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 32)] , "netLowTechbyTotalManu", "Net Low Tech export by net totalmanufacturing  export", "Note : netLowTechbyTotalManu = Net Low Tech Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 33)] , "netPrimaryProdbyTotalManu", "Net Primary Products export by net total manufacturing export", "Note : netPrimaryProdbyTotalManu = Net Primary Products Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 34)] , "netResourceBasedbyTotalManu", "Net Resource Based export by net total manufacturing export", "Note : netResourceBasedbyTotalManu = Net Resource Based Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")
generate.pdf(TradeDataWITS[, c(36, 1, 2, 35)] , "netHighMedTechbyTotalManu", "Net High and Medium Tech export by net total manufacturing export", "Note : netHighMedTechbyTotalManu = Net High + Medium Tech Export / Net Total Manufacturing Export. Net = Export - Re-Export. Source : WITS")

generate.pdf(tradeUNCTADdata[, c(1:3, 7, 4, 11)] , "Labour-intensiveByTotal", "UNCTAD labor-intensive by total", "Note : Labour-intensiveByTotal = Labour-intensive and resource-intensive manufactures / Total all products. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 8, 4, 12)] , "Low-skillByTotal", "UNCTAD low-skilled by total", "Note : Low-skillByTotal = Low-skill and technology-intensive manufactures / Total all products. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 9, 4, 13)] , "Med-skillByTotal", "UNCTAD med-skilled by total", "Note : Med-skillByTotal = Med-skill and technology-intensive manufactures / Total all products. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 10, 4, 14)] , "High-skillByTotal", "UNCTAD high-skilled by total", "Note : High-skillByTotal = High-skill and technology-intensive manufactures / Total all products. Source : UNCTAD")

generate.pdf(tradeUNCTADdata[, c(1:3, 7, 5, 15)] , "Labour-intensiveByManuGoods", "UNCTAD labor-intensive by Manu Goods", "Note : Labour-intensiveByManuGoods = Labour-intensive and resource-intensive manufactures / Manufactured goods (SITC 5 to 8 less 667 and 68). Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 8, 5, 16)] , "Low-skillByManuGoods", "UNCTAD low-skilled by Manu Goods", "Note : Low-skillByManuGoods = Low-skill and technology-intensive manufactures / Manufactured goods (SITC 5 to 8 less 667 and 68). Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 9, 5, 17)] , "Med-skillByManuGoods", "UNCTAD med-skilled by Manu Goods", "Note : Med-skillByManuGoods = Med-skill and technology-intensive manufactures / Manufactured goods (SITC 5 to 8 less 667 and 68). Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 10, 5, 18)] , "High-skillByManuGoods", "UNCTAD high-skilled by Manu Goods", "Note : High-skillByManuGoods = High-skill and technology-intensive manufactures / Manufactured goods (SITC 5 to 8 less 667 and 68). Source : UNCTAD")

generate.pdf(tradeUNCTADdata[, c(1:3, 7, 6, 19)] , "Labour-intensiveByManuGoodsByDegree", "UNCTAD labor-intensive by Manu Goods By Degree", "Note : Labour-intensiveByManuGoodsByDegree = Labour-intensive and resource-intensive manufactures / Manufactured goods by degree of manufacturing. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 8, 6, 20)] , "Low-skillByManuGoodsByDegree", "UNCTAD low-skilled by Manu Goods By Degree", "Note : Low-skillByManuGoodsByDegree = Low-skill and technology-intensive manufactures / Manufactured goods by degree of manufacturing. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 9, 6, 21)] , "Med-skillByManuGoodsByDegree", "UNCTAD med-skilled by Manu Goods By Degree", "Note : Med-skillByManuGoodsByDegree = Med-skill and technology-intensive manufactures / Manufactured goods by degree of manufacturing. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 10, 6, 22)] , "High-skillByManuGoodsByDegree", "UNCTAD high-skilled by Manu Goods By Degree", "Note : High-skillByManuGoodsByDegree = High-skill and technology-intensive manufactures / Manufactured goods by degree of manufacturing. Source : UNCTAD")

generate.pdf(tradeUNCTADdata[, c(1:3, 8, 9, 4, 23)] , "Low-MedByTotal", "UNCTAD low and med skills by total", "Note : Low-MedByTotal = Med-skill + Low-skill / Total all products. Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 8, 9, 5, 24)] , "Low-MedByManuGoods", "UNCTAD low and med skills by Manu Goods", "Note : Low-MedByManuGoods = Med-skill + Low-skill / Manufactured goods (SITC 5 to 8 less 667 and 68). Source : UNCTAD")
generate.pdf(tradeUNCTADdata[, c(1:3, 8, 9, 6, 25)] , "Low-MedByManuGoodsByDegree", "UNCTAD low and med skills by Manu Goods By Degree", "Note : Low-MedByManuGoodsByDegree = Med-skill + Low-skill / Manufactured goods by degree of manufacturing. Source : UNCTAD")

## subpillar 6.1
generate.pdf(Unemployment.rate.tertiary.educated[,-4], "Unemployment rate of tertiary educated (percent)", "Unemployment rate of tertiary educated", "Source : ILO")
generate.pdf(percent.dist.tertiary.unemployment[,-4], "Distribution of tertiary educated unemployment (percent)", "Percentage distribution of total unemployed with tertiary education")
generate.pdf(female.researchers.HC, "percent of female researchers (HC)", "Female researchers (HC)")
generate.pdf(female.researchers.FTE, "percent of female researchers (FTE)", "Female researchers (FTE)")
generate.pdf(researchers.HC , "Researchers per million inhabitants (HC)", "Researchers (HC)")
generate.pdf(researchers.FTE , "Researchers per million inhabitants (FTE)", "Researchers (FTE)")
generate.pdf(female.professional.88 , "2 (percent)", "Female professionals (ISCO 88)")
generate.pdf(female.professional.08 , "2 (percent)", "Female professionals (ISCO 08)")
generate.pdf(Professional.88[,-4], "2 (percent)", "Professionals (ISCO 88)")
generate.pdf(Professional.08[,-4], "2 (percent)", "Professionals (ISCO 08)")
generate.pdf(Female.legislators.senior.officials.managers.88[,-c(4)], "1 (percent)", "Female legislators, senior officials and managers (ISCO 88)")
generate.pdf(Female.legislators.senior.officials.managers.08[,-c(4)], "1 (percent)", "Female legislators, senior officials and managers (ISCO 08)")
generate.pdf(Female.legislators.senior.officials.managers.68[,-c(4)], "2 (percent)", "Female legislators, senior officials and managers (ISCO 68)")
generate.pdf(Legislators.senior.officials.managers.88[,-c(4)], "1 (percent)", "Legislators, senior officials and managers (ISCO 88)")
generate.pdf(Legislators.senior.officials.managers.08[,-c(4)], "1 (percent)", "Legislators, senior officials and managers (ISCO 08)")
generate.pdf(Legislators.senior.officials.managers.68[,-c(4)], "2 (percent)", "Legislators, senior officials and managers (ISCO 68)")
generate.pdf(tertiary.educated.population.above25.UNESCO , "Population (25 years and older) (000)", "Tertiary educated workforce (UNESCO - above 25)")
generate.pdf(tertiary.educated.population.tertiary.UNESCO , "Tertiary (ISCED 5-6) (percent)", "Tertiary educated workforce (UNESCO - tertiary percent)")
generate.pdf(tertiary.educated.population.above25.ILO.total[,-4] , "Tertiary (percent)", "Tertiary educated workforce (ILO - above 25 total)")
generate.pdf(tertiary.educated.population.above15.ILO.total[,-4] , "Tertiary (percent)", "Tertiary educated workforce (ILO - above 15 total)")
generate.pdf(tertiary.educated.population.above25.ILO.female[,-4] , "Tertiary (percent)", "Tertiary educated workforce (ILO - above 25 female)")
generate.pdf(tertiary.educated.population.above15.ILO.female[,-4] , "Tertiary (percent)", "Tertiary educated workforce (ILO - above 15 female)")

generate.pdf(professional.88.f[,c(1:3,6,10,12)] , "ratio", "Female professional out of total (male and female) professional", "Note : ratio = female professional (2 (000).x) / total professional (2 (000).y). Source : ILO ISCO 88")

## subpillar 5.1
generate.pdf(Unemployment.rate.secondary.educated[,-4], "Unemployment rate of secondary educated (percent)", "Unemployment rate of secondary educated", "Source : ILO")
generate.pdf(secondary.educated.population.above25.ILO.total[, -4] , "Secondary (percent)", "Secondary educated workforce (ILO - above 25 total)")
generate.pdf(secondary.educated.population.above15.ILO.total[, -4] , "Secondary (percent)", "Secondary educated workforce (ILO - above 15 total)")
generate.pdf(secondary.educated.population.above25.ILO.female[, -4] , "Secondary (percent)", "Secondary educated workforce (ILO - above 25 female)")
generate.pdf(secondary.educated.population.above15.ILO.female[, -4] , "Secondary (percent)", "Secondary educated workforce (ILO - above 15 female)")
generate.pdf(lower.skilled.88.MF.latest[, c(1,2,3,5,15)] , "lower skilled 88 MF ratio", "Lower skilled workers (other than ISCO 1-3)")
generate.pdf(tech.asso.88.F.latest , "3 (percent)", "Female technicians and associate professional (ISCO 88)")
generate.pdf(tech.asso.08.F.latest , "3 (percent)", "Female technicians and associate professional (ISCO 08)")
generate.pdf(youth.employment[, -4] , "Employment to population ratio of youth", "Youth employment (percent of youth population)")
generate.pdf(youth.unemployment.all[, c(1,2,3,5)] , "Youth unemployment rate (percent)", "Youth unemployment rate (youth unemployment as a percentage of the youth labour force)")
generate.pdf(youth.unemployment.all[, c(1,2,3,6)] , "Ratio of youth unemployment rate to adult unemployment rate", "Youth unemployment rate (ratio of the youth unemployment rate to the adult unemployment rate)")
generate.pdf(youth.unemployment.all[, c(1,2,3,7)] , "Share of youth unemployed in total unemployed (percent)", "Youth unemployment rate (youth unemployment as a proportion of total unemployment)")
generate.pdf(youth.unemployment.all[, c(1,2,3,8)] , "Share of youth unemployed in youth population (percent)", "Youth unemployment rate (youth unemployment as a proportion of the youth population)")
generate.pdf(NEET[, -4] , "NEET rate percent", "NEET (The number of young people who are not in employment, education or training (NEET) as a percentage of the youth population)")

## temporary variables 
generate.pdf(employment.to.population.ratio[,-4], "Employment to population ratio", "Employment to population ratio", "Source : ILO")

## subpillar 5.1
generate.pdf(labour.productivity.per.person.employed , "labour productivity per person employed", "Labour productivity per person employed")
generate.pdf(labour.productivity.per.hour.employed , "labour productivity per hour employed", "Labour productivity per hour employed")
generate.pdf(total.factor.productivity.growth , "total factor productivity growth", "Total factor productivity growth")
generate.pdf(labour.productivity.per.person.employed.growth[, -6] , "growth (2013-2012)/2012", "Labour productivity per person employed (growth)")
generate.pdf(pay.and.productivity , "Pay and productivity", "Relationship of pay to productivity")

## subpillar 2.1
generate.pdf(FDI.technology.transfer[, c(4, 1, 3, 2)] , "FDI and technology transfer", "FDI and technology transfer", "Source : WEF")
generate.pdf(Employing.Skilled.Expatriates[, c(4,1,3,2)] , "Employing Skilled Expatriates Index", "Employing Skilled Expatriates Index")
generate.pdf(total.migrants.15.64[, c(2,1,3:6)] , "Ratio", "Total migrants (age 15 - 64)", "Note : ratio = migrants (age 15-64)/population (age 15-64)")
generate.pdf(total.migrants.below.25[, c(2,1,3:6)] , "Ratio", "Total migrants (age below 25)", "Note : ratio = migrants (age below 25)/population (age below 25)")
generate.pdf(total.migrants.above.25[, c(2,1,3:6)] , "Ratio", "Total migrants (age above 25)", "Note : ratio = migrants (age above 25)/population (age above 25)")
generate.pdf(total.migrants.below.25.male[, c(2,1,3:6)] , "Ratio", "Total migrants (below 25 male)", "Note : ratio = migrants below 25 male/population below 25 male")
generate.pdf(total.migrants.below.25.female[, c(2,1,3:6)] , "Ratio", "Total migrants (below 25 female)", "Note : ratio = migrants below 25 female/population below 25 female")
generate.pdf(total.migrants.above.25.male[, c(2,1,3:6)] , "Ratio", "Total migrants (above 25 male)", "Note : ratio = migrants above 25 male/population above 25 male")
generate.pdf(total.migrants.above.25.female[, c(2,1,3:6)] , "Ratio", "Total migrants (above 25 female)", "Note : ratio = migrants above 25 female/population above 25 female")
generate.pdf(Country.capacity.attract.talent[, c(4, 1, 3, 2)] , "Country capacity to attract talent", "Brain gain - Country capacity to attract talent", "Source : WEF")
generate.pdf(Country.capacity.retain.talent[, c(4, 1, 3, 2)] , "Country capacity to retain talent", "Brain drain - Country capacity to retain talent", "Source : WEF")

## subpillar 2.2
generate.pdf(female.tertiary.graduates[, c(4,1:3)] , "female.tertiary.graduates", "Female tertiary graduates")
generate.pdf(Estimated.earned.income[, c(1:3,8)] , "Female-to- male ratio", "Estimated female income")
generate.pdf(Entrepreneurial.intention[, c(4, 1:3)] , "Entrepreneurial intention", "Entrepreneurial intention", "Source : Global Entrepreneurship Research Association, Global Entrepreneurship Monitor database.")
generate.pdf(attitude.entrepreneurial.failure[, c(4, 1, 3, 2)] , "Attitudes towards entrepreneurial failure", "Attitudes towards entrepreneurial failure", "Source : WEF")
generate.pdf(Estimated.earned.income[, c(1:3, 8)] , "Female-to- male ratio", "Female-male earning ratio", "Source : WEF")

generate.pdf(language.diversity[, c(1:3, 9, 13, 14)] , "ratio", "Immigrant living language out of total population ", "Note : ratio = 1000000*(immigrant living language / total population). Source : Ethnologue")
generate.pdf(language.diversity[, c(1:3, 6)] , "Total Living Language", "Total Living Language", "Source : Ethnologue")

generate.pdf(tolerance.to.minorities[, c(1:2,4,3)] , "Tolerance to minorities", "Tolerance to minorities", "Note : Percentage of respondents who answered yes for the question: Is the area where you live a good place or not a good place to live for racial and ethnic minorities? Source : LPI (Legatum Prosperity Index)")
generate.pdf(tolerance.to.immigrants[, c(1:2,4,3)] , "Tolerance to immigrants", "Tolerance to immigrants", "Note : Percentage of respondents who answered yes for the question: Is the area where you live a good place or not a good place to live for immigrants? Source : LPI (Legatum Prosperity Index)")

## subpillar 1.1
generate.pdf(busienss.gov.relations[, c(4, 1, 3, 2)] , "Business-government relations", "Business-government relations", "Source : WEF")
generate.pdf(corruption.perception.index[, c(4, 1, 3, 2)] , "CPI 2013 Score", "Corruption perception index", "Source : TI")

## subpillar 1.2
generate.pdf(Venture.capital.deals.scaled[, c(1,3,2,4,6,7)] , "ratio", "Venture capital deals", "Note : ratio = (No. of Deals / GDPPPP)*1000. Source : Thomson")
colnames(Labour.tax.and.contributions)[3] <- "Labour tax contribution"
generate.pdf(Labour.tax.and.contributions[, c(4,1,2,3)] , "Labour tax contribution", "Labour tax contribution", "Source : WDI")

## subpillar 1.3
generate.pdf(Cooperation.labor.employer.relations[, c(4,1,3,2)] , "Cooperation in labour-employer relations", "Cooperation in labour-employer relations", "Source : WEF.")
generate.pdf(Difficulty.of.hiring.index.score[, c(4,1,3,2)] , "Difficulty of hiring index score", "Difficulty of hiring index score")
generate.pdf(Rigidity.of.hours.index.score[, c(4,1,3,2)] , "Rigidity of hours index score", "Rigidity of hours index score")
generate.pdf(Difficulty.of.redundancy.index.score[, c(4,1,3,2)] , "Difficulty of redundancy index score", "Difficulty of redundancy index score")
generate.pdf(Rigidity.of.employment.index.score[, c(4,1,3,2)] , "Rigidity of employment index score", "Rigidity of employment index score")

## subpillar 3.1
generate.pdf(Tertiary.inbound.mobility.ratio[, c(4,1:3)] , "Tertiary inbound mobility ratio", "International students inflow - Tertiary inbound mobility ratio")
generate.pdf(science.engineering.ratios[, c(6,1:2, 7)] , "science.and.engineering.ratio", "Science and engineering graduates ratio", "Note : science.and.engineering.ratio = (graduates in science + graduates in engineering)/graduates in total. Source : UNESCO")
generate.pdf(Tertiary.outbound.mobility.rate[, c(4,1:3)] , "Tertiary outbound mobility rate", "International students outflow", "Source : UNESCO")

## subpillar 3.2
generate.pdf(firms.offering.training[, c(4,1:3)] , "Percent of firms offering formal training", "Firms offering formal training", "Source : WB Executive Survey")
generate.pdf(Part.time.employment.rate.15[, c(2,1,3,6)] , "Part.time.employment.rate.precent", "Part time employment rate (precent)", "Note : Gender is for both male and female. Age group is 15+. Source : ILO")

## subpillar 3.3
colnames(Part.time.employment.rate.15.female)[4] <- "Gender"
colnames(Part.time.employment.rate.15.female)[5] <- "Age group"
colnames(Part.time.employment.rate.15.female)[6] <- "Female share of part time employment (percent)"
generate.pdf(Part.time.employment.rate.15.female[, c(2,1,3:6)] , "Female share of part time employment (percent)", "Part time employment rate - Female (percent)")

generate.pdf(Part.time.employment.rate.15.F.ratios[, c(2, 1, 3:4, 5, 9, 10)] , "Female part time workers out of total employment", "Female part time workers out of total employment", "Note : Female part time workers out of total employment = Female part time workers (000) / Total employment (000). Source : ILO")
generate.pdf(Part.time.employment.rate.15.F.ratios[, c(2, 1, 3:4, 5, 6, 11)] , "Female part time workers out of female total employment", "Female part time workers out of female total employment", "Note : Female part time workers out of female total employment = Female part time workers (000) / Female total employment (000). SOurce : ILO")
generate.pdf(Part.time.employment.rate.15.F.ratios[, c(2, 1, 3:4, 5, 6, 12)] , "Female part time workers by female full time workers", "Female part time workers by female full time workers", "Note : Female part time workers by female full time workers = Female part time workers (000) / Female full time workers. Full time workers = total employment - part time workers. Source : ILO")
generate.pdf(Part.time.employment.rate.15.F.ratios[, c(2, 1, 3:4, 7, 8, 13)] , "Male part time workers by male full time workers", "Male part time workers by male full time workers", "Note : Male part time workers out of total employment = Male part time workers (000) / Male full time workers. Full time workers = total employment - part time workers. Source : ILO")

generate.pdf(linkedIn.users.ratio[, c(1:2, 6,3,9:10)] , "ratio", "LinkedIn users ratio (Labour force)", "Note : Years for internet users is based on 2012 data. Years for linkedin data is based on March 2014. ratio = Number of Linkedin users / Labour force (000) Age 15-64.")

colnames(linkedIn.users)[15] <- "Internet users population"
colnames(linkedIn.users)[16] <- "LinkedIn users Ratio"
generate.pdf(linkedIn.users[, c("ISO3", "Country.Name", "Year", "Number of Linkedin users", "Internet users population", "LinkedIn users Ratio")] , "LinkedIn users Ratio", "LinkedIn users Ratio", "Note : Years for internet users is based on 2012 data. Years for linkedin data is based on March 2014. LinkedIn Users Ratio = Number of Linkedin users / Internet users population. Source : UN, ITU, LinkedIn")

colnames(journals) <- c("ISO3", "Country.Name", "Record count 2003-2013 (Stock)", "percent.of.918464", "Record count 2013 (Flow)", "percent.of.137643", "GDP (billion)", "Year", "Stock per GDP (million)", "Flow per GDP (million)")
generate.pdf(journals[, c(1:2,8,3,7,9)] , "Stock per GDP (million)", "Journals stock per GDP (million)", "Note : Stock per GDP (million) = 1000*Record count 2003-2013 (Stock)/GDP (billion). Year is for GDP data. Source : Web of science.")
generate.pdf(journals[, c(1:2,8,5,7,10)] , "Flow per GDP (million)", "Journals flow per GDP (million)", "Note : Flow per GDP (million) = 1000*Record count 2013 (Flow)/GDP (billion). Year is for GDP data. Source : Web of science.")
generate.pdf(journals.per.researchers.FTE[, c(1:2,8,3,11,12,13)] , "Stock per researchers FTE", "Stock per researchers FTE", "Note : Stock per researchers FTE = Record count 2003-2013(stock)/Researchers per million inhabitants (FTE). Year is for Journals data. Year.y is for Researchers data. Source : Web of science.")

generate.pdf(journals.WB.scaled[, c(1,3,2,4,6,7)] , "ratio", "Scientific and technical journal articles (WB)", "Note : ratio = (Scientific and technical journal articles/GDPPPP)*1000. Source : WB WDI")


generate.pdf(Willingness.to.delegate.authority[, c(4,1,3,2)] , "Willingness to delegate authority", "Willingness to delegate authority", "Source : WEF")
colnames(merged24)[2] <- "Year"
colnames(merged24)[3] <- "Female share of part time employment (percent)"
generate.pdf(merged24[, c(1,4,2,3,6:8)] , "ratio", "Female part time double ratio", "Note : This is a ratio divided by another ratio. Ratio = Female share of part time employment (percent)/ (Female total employment (000)/Total employment (000)). Source : ILO")

generate.pdf(voice.to.officials[, c(1:2, 4, 3)], "Voicing concerns to officials", "Voicing concerns to officials", "Note : Percentage of respondents who answered yes for the question: Have you voiced your opinion to a public official in the past month? Source : LPI (Legatum Prosperity Index)")

## subpillar 4.1
generate.pdf(personal.income.tax.rate[, c(4,1:3)] , "personal income tax rate in percent", "Personal Income Tax Rate (in percent)")
generate.pdf(top.management[, c(1:2, 4, 3, 5, 6)] , "Pay level deflator (Top Management)", "Pay level deflator (Top Management)", "Note : Pay level deflator (Top Management) = (Mid annual total cash ranges for Top Management/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Top Management are 2012 data. RPI are 2013 Dec data.")
generate.pdf(top.management[, c(1:2, 4, 3, 5, 6)] , "Mid annual total cash ranges for Top Management", "Pay level deflator (Top Management) sorted before deflator", "Note : Pay level deflator (Top Management) = (Mid annual total cash ranges for Top Management/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Top Management are 2012 data. RPI are 2013 Dec data. Sorted by annual total cash values.")

generate.pdf(head.of.IT[, c(1:2, 4, 3, 5, 6)] , "Pay level deflator (Head of IT)", "Pay level deflator (Head of IT)", "Note : Pay level deflator (Head of IT) = (Mid annual total cash ranges for Head of IT/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of IT are 2012 data. RPI are 2013 Dec data.")
generate.pdf(head.of.IT[, c(1:2, 4, 3, 5, 6)] , "Mid annual total cash ranges for Head of IT", "Pay level deflator (Head of IT) sorted before deflator", "Note : Pay level deflator (Head of IT) = (Mid annual total cash ranges for Head of IT/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of IT are 2012 data. RPI are 2013 Dec data. Sorted by annual total cash values.")

generate.pdf(head.of.systems.engineering[, c(1:2, 4, 3, 5, 6)] , "Pay level deflator (Head of Systems Engineering)", "Pay level deflator (Head of Systems Engineering)", "Note : Pay level deflator (Head of Systems Engineering) = (Mid annual total cash ranges for Head of Systems Engineering/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of Systems Engineering are 2012 data. RPI are 2013 Dec data.")
generate.pdf(head.of.systems.engineering[, c(1:2, 4, 3, 5, 6)] , "Mid annual total cash ranges for Head of systems engineering", "Pay level deflator (Head of Systems Engineering) sorted before deflator", "Note : Pay level deflator (Head of Systems Engineering) = (Mid annual total cash ranges for Head of Systems Engineering/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of Systems Engineering are 2012 data. RPI are 2013 Dec data. Sorted by annual total cash values.")

generate.pdf(plant.manager[, c(1:2, 4, 3, 5, 6)] , "Pay level deflator (Plant Manager)", "Pay level deflator (Plant Manager)", "Note : Pay level deflator (Plant Manager) = (Mid annual total cash ranges for Operations Plant Manager/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Plant Manager are 2012 data. RPI are 2013 Dec data.")
generate.pdf(plant.manager[, c(1:2, 4, 3, 5, 6)] , "Mid annual total cash ranges for Operations Plant Manager", "Pay level deflator (Plant Manager) sorted before deflator", "Note : Pay level deflator (Plant Manager) = (Mid annual total cash ranges for Operations Plant Manager/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Plant Manager are 2012 data. RPI are 2013 Dec data. Sorted by annual total cash values.")

generate.pdf(sales.n.marketing[, c(1:2, 4, 3, 5, 6)] , "Pay level deflator (Head of sales and marketing)", "Pay level deflator (Head of sales and marketing)", "Note : Pay level deflator (Head of sales and marketing) = (Mid annual total cash ranges for Head of sales and marketing/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of sales and marketing are 2012 data. RPI are 2013 Dec data.")
generate.pdf(sales.n.marketing[, c(1:2, 4, 3, 5, 6)] , "Mid annual total cash ranges for Head of Sales and Marketing", "Pay level deflator (Head of sales and marketing) sorted before deflator", "Note : Pay level deflator (Head of sales and marketing) = (Mid annual total cash ranges for Head of sales and marketing/Price indices - Total retail price indices (RPI) living expenditures for UN officials)*100. Head of sales and marketing are 2012 data. RPI are 2013 Dec data. Sorted by annual total cash values.")

generate.pdf(maternity.parental.leave[, c(4,1,3,2)] , "Option 4", "Maternity and parental leave", "Note : Option 4 = (a) If there is no parental value, rely on maternity value; (b) If there is no maternity value, rely on parental value; (c) If parental value is higher than maternity value, use the parental value.")

## subpillar 4.2
generate.pdf(Intentional.homicide[, c(4,1:3)] , "Intentional.homicide", "Homicides", "Source : UNODC Homicide Statistics")
generate.pdf(improved.sanitation.facilities[, c(4,1:3)] , "improved.sanitation.facilities", "Improved sanitation facilities", "Source : WDI")

generate.pdf(property.stolen[, c(1:2, 4, 3)], "Property stolen", "Property stolen", "Note : Percentage of respondents who answered yes for the question: Within the past 12 months, have you had money or property stolen from you or another household member? Source : LPI (Legatum Prosperity Index)")
generate.pdf(safe.walking.alone[, c(1:2, 4, 3)], "Safe walking alone", "Safe walking alone", "Note : Percentage of respondents who answered yes for the question: Do you feel safe walking alone at night in the area where you live? Source : LPI (Legatum Prosperity Index)")

## new testing variables
generate.pdf(secondary.educated.population.UNESCO[, c(4,1:3)] , "secondary educated population", "Secondary educated population UNESCO", "Source : UNESCO. Variable description : at least completed upper secondary (ISCED 3 or higher), population 25+ years, both sexes (percent)")
generate.pdf(tertiary.educated.population.UNESCO[, c(4,1:3)] , "tertiary educated population", "Tertiary educated population UNESCO", "Source : UNESCO. Variable description :  completed tertiary (ISCED 5 or 6), population 25+ years, both sexes (percent)")

generate.pdf( , "", "")

