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


generate.pdf( , "", "")

