library (foreign)
rm(GTCI)
gtci<-read.dta("C:/Users/merdikawati/Desktop/gtci.dta")
install.packages("ggplot2")
library(ggplot2)
gtci_gdp <- ggplot(autold, aes(x=gdppercapitappp, y=gtciscore))

##ggplot with regression line instead of shadow
gtci_gdp2 <- ggplot(autold, aes(x=gdppercapitappp, y=gtciscore,colour=col))+geom_point()
##create quadratic variable
x2<-autold$gdppercapitappp*autold$gdppercapitappp
gtci_gdp2+stat_smooth(method="lm", formula =y~x+x2,se=F)

##ggplot with colours and income group differentiation
gtci_gdp + geom_point(aes(color=autold$incomegroup),alpha = 2/3) + geom_smooth(method="lm")
gtci_gdp + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method=lm)

## GTCI vs GDP for with ISO3##not working, only works in plot, similar result with STATA
install.packages("calibrate")
library(calibrate)
#use the textxy() function to add labels to the preexisting plot's points
#add labels for the total enrollment
plot(autold$gdppercapitappp,autold$gtciscore)
textxy(autold$gdppercapitappp,autold$gtciscore,autold$ISO3)


gtci_gdp <- ggplot(autold, aes(gdppercapitappp, gtciscore))
gtci_gdp + geom_point(aes(color=autold$incomegroup), alpha = 2/3) + geom_smooth(method="auto")

load("GTCI.Rdata")

##input vs output for all countries
InputOutput <- ggplot(autold, aes(input, output))
InputOutput + geom_point(aes(color=autold$incomegroup), alpha = 2/3) + geom_smooth(method="lm")

##Attract vs Grow
AttractGrow<-ggplot (autold, aes(attract, grow))
AttractGrow + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
AttractGrow + geom_point(aes(color=autold$incomegroup), alpha = 2/3) + geom_smooth(method="lm")

##Grow vs Retain
GrowRetain<-ggplot (autold, aes(grow, retain))
GrowRetain + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
GrowRetain + geom_point(aes(color=autold$incomegroup), alpha = 2/3) + geom_smooth(method="lm")

##Attract vs Grow for big countries
attractgrow.big<-subset(autold,pop_75==1)
AttractGrow.big<-ggplot (attractgrow.big, aes(attract, grow))
AttractGrow.big + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
AttractGrow.big + geom_point(aes(color=attractgrow.big$incomegroup), alpha = 2/3) + geom_smooth(method="lm")

##Attract vs Grow for small countries
attractgrow.small<-subset(autold,pop_75==0)
AttractGrow.small<-ggplot (attractgrow.small, aes(attract, grow))
AttractGrow.small + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
AttractGrow.small + geom_point(aes(color=attractgrow.small$incomegroup), alpha = 2/3) + geom_smooth(method="lm")

##Grow vs Retain for big countries
growretain.big<-subset(autold,pop_75==1)
Growretain.big<-ggplot (growretain.big, aes(grow, retain))
Growretain.big + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
Growretain.big + geom_point(aes(color=growretain.big$incomegroup), alpha = 1/3) + geom_smooth(method="lm")

##Grow vs Retain for small countries
growretain.small<-subset(autold,pop_75==0)
Growretain.small<-ggplot (growretain.small, aes(grow, retain))
Growretain.small + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")
Growretain.small + geom_point(aes(color=growretain.small$incomegroup), alpha = 2/3) + geom_smooth(method="lm")