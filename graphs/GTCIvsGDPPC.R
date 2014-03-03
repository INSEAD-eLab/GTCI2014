library(foreign)
library(ggplot2)

GTCI <- read.dta("GDPvsGDPPC.dta")
str(GTCI)

GTCI$lnPopulation <- log(GTCI$Population_m)

## assigning colors based on income group
GTCI$color <- 'c'

for(i in 1:103){
  if(GTCI[i,'incomegroup'] == 'HI'){
    GTCI[i,'color'] <- colors()[563]
  }else if(GTCI[i,'incomegroup'] == 'UM'){
    GTCI[i,'color'] <- colors()[224]
  }else if(GTCI[i,'incomegroup'] == 'LM'){
    GTCI[i,'color'] <- colors()[26]
  }else if(GTCI[i,'incomegroup'] == 'LI'){
    GTCI[i,'color'] <- colors()[179]
  }
}


## save into new variable so that to edit the China and India data
GTCI$Population_mod <- GTCI$Population_m

LVGK <- ggplot(data=min_GTCI, aes(x=log_gdp, y=GTCIScore, label=ISO2))
LVGK + geom_point() + facet_grid(.~ incomegroup) + geom_smooth(method="lm")

## without population size
LVGK + geom_point(shape = 1, alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula= y ~ poly(x,4), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

## with population size
LVGK + geom_point(shape = 1, size=GTCI$lnPopulation*1.5 ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula= y ~ poly(x,4), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

## with normal population but using poly line
LVGK + geom_point(shape = 1, size=(GTCI$Population_mod/15) ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula= y ~ poly(x,2), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

## with normal population but using linear (final)
LVGK + geom_point(color=min_GTCI$color, shape = 16, size=(min_GTCI$Population_mod/15) ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula=y ~ poly(x,4), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

LVGK + geom_point(shape = 1, size=(GTCI$Population_m/25) ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula= y ~ poly(x,4), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

Ed <- read.dta("Dataset_final_raw.dta")
#ds$q1[is.na(ds$q1)] <- 0

Ed[1:5,c("q58_1","q58_2")]

name <- paste("q58_",1,sep="")
name

Ed[,name]

is.na(Ed[,name])
Ed[is.na(Ed[,name]),name] <- 0

## read the data
Ed <- read.dta("Dataset_final_raw.dta")

## start of the loop from 1 to 8
for(i in 1:8){
  varname <- paste("q58_",i,sep="")     # every loop will generate varname from q58_1, q58_2, etc
  NArows  <- is.na(Ed[,varname])        # getting the rows with NA for each varname
  Ed[NArows, varname] <- 0              # will replace NA rows with 0
}

LVGK <- ggplot(data=GTCI_m, aes(x=GK, y=LV, label=ISO2))
LVGK + geom_point(color=min_GTCI$color, shape = 16, size=(GTCI_m$GDP_Per_Capita/2000) ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = "Global Knowledge") + labs(y = "Labour and Vocational")

LVGK + geom_point(shape = 16, alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = "Global Knowledge") + labs(y = "Labour and Vocational")


#### MAP 

df <- read.csv("indicator alcohol consumption  20100830.csv")
install.packages("rworldmap")
library(rworldmap)
sPDF <- joinCountryData2Map(df,
                            , joinCode = "NAME"
                            , nameJoinColumn = "X"
                            , nameCountryColumn = "X"
                            , verbose = TRUE)
mapCountryData(sPDF,nameColumnToPlot='X2005')

sPDF <- joinCountryData2Map(GTCI,
                            , joinCode = "NAME"
                            , nameJoinColumn = "Country"
                            , nameCountryColumn = "Country"
                            , verbose = TRUE)
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "heat")
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "diverging")
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "white2Black")
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = bp)
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "topo")
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "rainbow")
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = "terrain", numCats = 9)

library(RColorBrewer)
bp <- brewer.pal(9,"Blues")

cp <- c("#C6DBEF", "#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#2162A6", "#08519C", "#06417D","#08306B")

mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, oceanCol = colors()[43], colourPalette = bp, numCats = 9)
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', missingCountryCol=colors()[239], mapTitle="GTCI score", addLegend=TRUE, colourPalette = bp, numCats = 9)
mapCountryData(sPDF,nameColumnToPlot='GTCIScore', mapTitle="GTCI score", addLegend=TRUE, colourPalette = bp, numCats = 9, borderCol=colors()[247], lwd=0.1)

mapCountryData(sPDF,nameColumnToPlot='GTCIScore',mapTitle="GTCI score", addLegend=TRUE, colourPalette = cp, numCats = 9, borderCol=colors()[247])


#### for ASIA

Asia <- c("SGP", "AUS", "NZL", "JPN", "KOR", "MYS","KAZ", "CHN", "MNG", "THA", "PHL",
          "LKA", "KGZ", "VNM", "IND", "IDN", "KHM", "PAK", "BGD", "IRN")

GTCI_Asia <- GTCI[GTCI$ISO3 %in% Asia,]
min_GTCI_Asia <- min_GTCI[min_GTCI$ISO3 %in% Asia,]
GTCI_m_Asia <- GTCI_m[GTCI_m$ISO3 %in% Asia,]

min_GTCI$alpha <- 0.2
for(i in 1:nrow(min_GTCI)){
  if(min_GTCI[i, 'ISO3'] %in% Asia){
    min_GTCI[i, 'alpha'] <- 0.8
  }
}

GTCI_m$alpha <- 0.2
for(i in 1:nrow(GTCI_m)){
  if(GTCI_m[i, 'ISO3'] %in% Asia){
    GTCI_m[i, 'alpha'] <- 0.8
  }
}

## log GDP per capita Vs GTCI score (faded)
LogGDPPCvsGTCI <- ggplot(data=min_GTCI, aes(x=log_gdp, y=GTCIScore, label=ISO2))
LogGDPPCvsGTCI + geom_point(color=min_GTCI$color, shape = 16, size=(min_GTCI$Population_mod/15) ,alpha = min_GTCI$alpha) + geom_text(alpha=min_GTCI$alpha, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula=y ~ poly(x,3), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

## log GDP per capita Vs GTCI score (Asia only)
LogGDPPCvsGTCI_Asia <- ggplot(data=min_GTCI_Asia, aes(x=log_gdp, y=GTCIScore, label=ISO2))
LogGDPPCvsGTCI_Asia + geom_point(color=min_GTCI_Asia$color, shape = 16, size=(min_GTCI_Asia$Population_mod/15) ,alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula=y ~ poly(x,3), col = "black") + theme_bw() + labs(x = "GDP per capita in PPP$ (natural log scale)") + labs(y = "GTCI Score")

## LV vs GK (faded)
LVGK <- ggplot(data=GTCI_m, aes(x=GK, y=LV, label=ISO2))
LVGK + geom_point(color=min_GTCI$color, shape = 16, size=(GTCI_m$GDP_Per_Capita/1500) ,alpha = GTCI_m$alpha) + geom_text(alpha=GTCI_m$alpha, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = "Global Knowledge") + labs(y = "Labour and Vocational")

## LV vs GK (Asia only)
LVGK_Asia <- ggplot(data=GTCI_m_Asia, aes(x=GK, y=LV, label=ISO2))
LVGK_Asia + geom_point(color=GTCI_m_Asia$color, shape = 16, size=(GTCI_m_Asia$GDP_Per_Capita/1500) ,alpha = GTCI_m_Asia$alpha) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = "Global Knowledge") + labs(y = "Labour and Vocational")

## getting youth employment data
GTCI_m_Asia$Youth.employment <- GTCI_Asia$Youth.employment

## LV vs GK (Asia only and scaled by youth employment)
LVGK_Asia <- ggplot(data=GTCI_m_Asia, aes(x=GK, y=LV, label=ISO2))
LVGK_Asia + geom_point(color=GTCI_m_Asia$color, shape = 16, size=(as.numeric(GTCI_m_Asia$Youth.employment)/3) ,alpha = GTCI_m_Asia$alpha) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + theme_bw() + labs(x = "Global Knowledge") + labs(y = "Labour and Vocational")

names(GTCI_Asia)

TBE <- GTCI_Asia[,c(1,2,4,118,134,122,70,30,86,66,38,92)]

names(TBE)

write.csv(TBE, file="For Martina.csv")

## charts for Martina on 3 March

iso2<-read.dta("data/GDPvsGDPPC.dta")
ISO3<-loadWorkbook(paste("data/", "youth employment.xlsx", sep=""))
YER<-readWorksheet(ISO3, sheet="Sheet1", region="B2:C105", header=T)

a <- iso2[, c("ISO3", "ISO2", "GTCIScore")]
bb <- merge(a, YER, by.x="ISO3", by.y="ISO3.")

LVGK <- ggplot(data=bb, aes(x=Youth.employment.raw, y=GTCIScore, label=ISO2))
LVGK + geom_point(shape = 19, alpha = .8) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2) + geom_smooth(method="lm", se=FALSE, formula= y ~ poly(x,1), col = "black") + theme_bw() + labs(x = "Youth employment (%)") + labs(y = "GTCI Score")
