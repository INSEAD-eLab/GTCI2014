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
generate.pdf(New.product.entrepreneurial.act, "New.product.entrepreneurial.act", "New product entrepreneurial activity")
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


## subpillar 6.1
generate.pdf(Unemployment.rate.tertiary.educated[,-4], "Unemployment rate of tertiary educated (percent)", "Unemployment rate of tertiary educated")
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

## subpillar 5.1
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


## subpillar 5.1
generate.pdf(labour.productivity.per.person.employed , "labour productivity per person employed", "Labour productivity per person employed")
generate.pdf(labour.productivity.per.hour.employed , "labour productivity per hour employed", "Labour productivity per hour employed")
generate.pdf(total.factor.productivity.growth , "total factor productivity growth", "Total factor productivity growth")
generate.pdf(labour.productivity.per.person.employed.growth[, -6] , "growth (2013-2012)/2012", "Labour productivity per person employed (growth)")
generate.pdf(pay.and.productivity , "Pay and productivity", "Relationship of pay to productivity")

## subpillar 2.1
generate.pdf(Employing.Skilled.Expatriates[, c(4,1,3,2)] , "Employing Skilled Expatriates Index", "Employing Skilled Expatriates Index")
generate.pdf(total.migrants.15.64[, c(2,1,3:6)] , "Ratio", "Total migrants (age 15 - 64)", "Note : ratio = migrants (age 15-64)/population (age 15-64)")
generate.pdf(total.migrants.below.25[, c(2,1,3:6)] , "Ratio", "Total migrants (age below 25)", "Note : ratio = migrants (age below 25)/population (age below 25)")
generate.pdf(total.migrants.above.25[, c(2,1,3:6)] , "Ratio", "Total migrants (age above 25)", "Note : ratio = migrants (age above 25)/population (age above 25)")
generate.pdf(total.migrants.below.25.male[, c(2,1,3:6)] , "Ratio", "Total migrants (below 25 male)", "Note : ratio = migrants below 25 male/population below 25 male")
generate.pdf(total.migrants.below.25.female[, c(2,1,3:6)] , "Ratio", "Total migrants (below 25 female)", "Note : ratio = migrants below 25 female/population below 25 female")
generate.pdf(total.migrants.above.25.male[, c(2,1,3:6)] , "Ratio", "Total migrants (above 25 male)", "Note : ratio = migrants above 25 male/population above 25 male")
generate.pdf(total.migrants.above.25.female[, c(2,1,3:6)] , "Ratio", "Total migrants (above 25 female)", "Note : ratio = migrants above 25 female/population above 25 female")

## subpillar 2.2
generate.pdf(female.tertiary.graduates[, c(4,1:3)] , "female.tertiary.graduates", "Female tertiary graduates")
generate.pdf(Estimated.earned.income[, c(1:3,8)] , "Female-to- male ratio", "Estimated female income")
generate.pdf(Entrepreneurial.intention[, c(4, 1:3)] , "Entrepreneurial intention", "Entrepreneurial intention", "Source : Global Entrepreneurship Research Association, Global Entrepreneurship Monitor database.")

## subpillar 1.3
generate.pdf(Difficulty.of.hiring.index.score[, c(4,1,3,2)] , "Difficulty of hiring index score", "Difficulty of hiring index score")
generate.pdf(Rigidity.of.hours.index.score[, c(4,1,3,2)] , "Rigidity of hours index score", "Rigidity of hours index score")
generate.pdf(Difficulty.of.redundancy.index.score[, c(4,1,3,2)] , "Difficulty of redundancy index score", "Difficulty of redundancy index score")
generate.pdf(Rigidity.of.employment.index.score[, c(4,1,3,2)] , "Rigidity of employment index score", "Rigidity of employment index score")

## subpillar 3.1
generate.pdf(Tertiary.inbound.mobility.ratio[, c(4,1:3)] , "Tertiary inbound mobility ratio", "International students inflow - Tertiary inbound mobility ratio")

## subpillar 3.3
colnames(Part.time.employment.rate.15.female)[4] <- "Gender"
colnames(Part.time.employment.rate.15.female)[5] <- "Age group"
colnames(Part.time.employment.rate.15.female)[6] <- "Female share of part time employment (percent)"
generate.pdf(Part.time.employment.rate.15.female[, c(2,1,3:6)] , "Female share of part time employment (percent)", "Part time employment rate - Female (percent)")

## subpillar 4.1
generate.pdf(personal.income.tax.rate[, c(4,1:3)] , "personal income tax rate in percent", "Personal Income Tax Rate (in percent)")

generate.pdf( , "", "")

