folders <- c("America", "Asia Pacific", "Europe", "MENA", "Sub-Saharan Africa")
LPI <- data.frame()

for(i in 1:length(folders)){
  filenames <- list.files(paste("data/LPI/", folders[i], sep=""), pattern="*.xlsx", full.names=TRUE)
  
  for(j in 1:length(filenames)){
    LPI.file <- loadWorkbook(filenames[j])
    LPI.data <- readWorksheet(LPI.file, sheet="Sheet1", region="A2:GE4", header=T)
    
    LPI <- rbind(LPI, LPI.data[2,])
  }
}

ISO3 <- get.ISO3()
LPI[,1] <- tolower(LPI[,1])
colnames(LPI)[1] <- "Country.Name"

LPI <- merge(LPI, ISO3, by="Country.Name", all.x=T, sort=F)

tolerance.to.minorities <- LPI[, c(188, 1, 168, 169)]
colnames(tolerance.to.minorities)[3] <- "Tolerance to minorities"
colnames(tolerance.to.minorities)[4] <- "Year"

tolerance.to.immigrants <- LPI[, c(188, 1, 166, 167)]
colnames(tolerance.to.immigrants)[3] <- "Tolernace to immigrants"
colnames(tolerance.to.immigrants)[4] <- "Year"

voice.to.officials <- LPI[, c(188, 1, 82, 83)]
colnames(voice.to.officials)[3] <- "Voicing concerns to officials"
colnames(voice.to.officials)[4] <- "Year"

property.stolen <- LPI[, c(188, 1, 142, 143)]
colnames(property.stolen)[3] <- "Property stolen"
colnames(property.stolen)[4] <- "Year"

safe.walking.alone <- LPI[, c(188, 1, 148, 149)]
colnames(safe.walking.alone)[3] <- "Safe walking alone"
colnames(safe.walking.alone)[4] <- "Year"
