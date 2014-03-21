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

generate.pdf( , "", "")

