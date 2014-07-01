ProjectData <- read.csv("webapp/2014 06 25 GTCI.csv")

ProjectData[, "Deletage.Authority"] <- apply(ProjectData, 1, function(row) ifelse(row['Willingness.to.delegate.authority'] < 25, "Low", 
                                                                                  ifelse(row['Willingness.to.delegate.authority'] < 50, "Low Mid", 
                                                                                         ifelse(row['Willingness.to.delegate.authority'] < 75, "Mid", "High"))))


ProjectData[, "Tertiary.Edu"] <- apply(ProjectData, 1, function(row) ifelse(is.na(row['tertiary.educated.population..UNESCO.']), NA, 
                                                                            ifelse(as.integer(row['tertiary.educated.population..UNESCO.']) < 33, "Low", 
                                                                                   ifelse(as.integer(row['tertiary.educated.population..UNESCO.']) < 66, "Mid", "High"))))
  
#contingency table
ProjectData <- ProjectData[, c("Deletage.Authority", "Tertiary.Edu")]
ProjectData <- ProjectData[complete.cases(ProjectData),]

tbl <- table(ProjectData$Tertiary.Edu, ProjectData$Deletage.Authority)

chisq.test(tbl) 
