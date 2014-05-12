################# LinkedIn users
linkedIn.users  <- get.WEF(source.file="[R] Linkedin users (numerator).xlsx", 
                           source.sheet="Sheet1", 
                           source.data.region="B4:B97",
                           source.colname="B3", 
                           source.date="A1", 
                           source.countries="A4:A97")

labor.force <- get.ILO.latest( source.file="labour force.csv",
                               source.sheet="KILM 1a",
                               source.region="A3:G104331", 
                               source.gender="MF",
                               source.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force...000."),
                               result.colnames=c("Country.Name", "ISO3", "Year", "Sex", "Age.group", "Labour.force.000"),
                               source.age="15-64",
                               result.cut.year=2003,
                               data.format="csv")

linkedIn.users.ratio <- merge(linkedIn.users, labor.force, by="ISO3", all.x=T, sort=F)
linkedIn.users.ratio[, 9] <- lapply(linkedIn.users.ratio[9], function(x) ifelse(is.na(x), NA, as.numeric(gsub(" ", "", as.character(x)))))

linkedIn.users.ratio[, "ratio"] <- linkedIn.users.ratio[, 3]/(linkedIn.users.ratio[, 9]*1000)
colnames(linkedIn.users.ratio)[9] <- "Labour force (000)"
colnames(linkedIn.users.ratio)[2] <- "Country.Name"
colnames(linkedIn.users.ratio)[6] <- "Year"

################ New LinkedIn

ISO3 <- get.ISO3()

internet.users <- get.UNESCO.format(source.file="[R] [ITU] Percentage of individuals using internet.xls",
                                    source.sheet="DataExtract", 
                                    source.data.region="A3:N230",
                                    source.colnames="A2:N2", 
                                    result.colnames="internet.users",
                                    result.cut.year=2003)

internet.users <- internet.users[, c(1:3, 5)]
colnames(internet.users)[2] <- "internet.users.percent"

data.ws <- loadWorkbook("data/[R] [ITU] Percentage of individuals using internet.xls")
countries <- readWorksheet(data.ws, sheet="DataExtract", region="A3:A230", header=F)
colnames(countries) <- "Country.Name"
notes <- readWorksheet(data.ws, sheet="DataExtract", region="AN3:AN230", header=F)

countriesn <- countries[c(1:216),] 
countriesn <- cbind(countriesn, notes)
colnames(countriesn) <- c("Country.Name", "note")

countries <- merge(countries, countriesn, by=c("Country.Name"), all.x=TRUE)
countries[, "Country.Name"] <- tolower(countries[, "Country.Name"])

internet.users <- merge(internet.users, countries, by="Country.Name", all.x=TRUE)


data.ws <- loadWorkbook("data/[R] [UN] Population by ages.xls")
population.ages <- readWorksheet(data.ws, sheet="MEDIUM FERTILITY", region="C17:AA21257", header=T)
colnames(population.ages)[4] <- "Year"
population.ages <- population.ages[population.ages$Year == 2012, ]

population.ages.up.to.74 <- population.ages[, c(5:19)]
population.ages.up.to.74[, "total up to 74"] <- apply(population.ages.up.to.74, 1, function(row) sum(as.numeric(row)))

population.ages.up.to.100 <- population.ages[, c(5:25)]
population.ages.up.to.100[, "total up to 100"] <- apply(population.ages.up.to.100, 1, function(row) sum(as.numeric(row)))

population.ages.up.to.14 <- population.ages[, c(5:7)]
population.ages.up.to.14[, "total up to 14"] <- apply(population.ages.up.to.14, 1, function(row) sum(as.numeric(row)))

population.ages <- cbind(population.ages[, c(1,4:6)], population.ages.up.to.14[,4], population.ages.up.to.100[, 22], population.ages.up.to.74[, 16])
colnames(population.ages)[1] <- "Country.Name"
population.ages[, "Country.Name"] <- tolower(population.ages[, "Country.Name"])

population.ages <- merge(population.ages, ISO3, by="Country.Name", all.x=T)

internet.users <- merge(internet.users, population.ages, by=c("ISO3", "Year"), all.x=TRUE)

linkedIn.users <- merge(linkedIn.users, internet.users, by=c("ISO3"), all.x=TRUE)

linkedIn.users <- linkedIn.users[, c(1:5, 7:8, 10:14)]

linkedIn.users <- linkedIn.users[!linkedIn.users$ISO3 %in% c("NAC", "TWN"),]

get.linkedin.deno <- function(row){
  if(is.na(row["note"]) | row["note"] == "Estimate to December based on ENDUTIH survey. Refers to total population." | row["note"] == "Refers to total population."){
    return(as.numeric(row["population.ages.up.to.100[, 22]"]))
  }else if(row["note"] == "Population age 15-74 in the last 3 months (exc. population living in working camps)." | row["note"] == "Population age 16-74."){
    return(as.numeric(row["population.ages.up.to.74[, 16]"]) - as.numeric(row["population.ages.up.to.14[, 4]"]))
  }else if(row["note"] == "Population age 15+." | row["note"] == "In the last 6 months. Population age 14+." | row["note"] == "Represents population aged 15+ living in households (i.e. excl. population living in working camps)."){
    return(as.numeric(row["population.ages.up.to.100[, 22]"]) - as.numeric(row["population.ages.up.to.14[, 4]"]))
  }else if(row["note"] == "Estimated based on surveys' results. Population age 5+." | row["note"] == "Population age 5+." | row["note"] == "Population age 5+ using Internet in the last 3 months." | row["note"] == "Population age 3+." | row["note"] == "Population age 6+."){
    return(as.numeric(row["population.ages.up.to.100[, 22]"]) - as.numeric(row["X0.4"]))
  }else if(row["note"] == "Population age 10+."){
    return(as.numeric(row["population.ages.up.to.100[, 22]"]) - as.numeric(row["X0.4"]) - as.numeric(row["X5.9"]))
  }else if(row["note"] == "Estimate for population age 6-74 living in electrified areas."){
    return(as.numeric(row["population.ages.up.to.74[, 16]"]) - as.numeric(row["X0.4"]))
  }  
}

get.linkedin.deno.note <- function(row){
  if(is.na(row["note"]) | row["note"] == "Estimate to December based on ENDUTIH survey. Refers to total population." | row["note"] == "Refers to total population."){
    return("population.ages.up.to.100")
  }else if(row["note"] == "Population age 15-74 in the last 3 months (exc. population living in working camps)." | row["note"] == "Population age 16-74."){
    return("population.ages.up.to.74 - population.ages.up.to.14")
  }else if(row["note"] == "Population age 15+." | row["note"] == "In the last 6 months. Population age 14+." | row["note"] == "Represents population aged 15+ living in households (i.e. excl. population living in working camps)."){
    return("population.ages.up.to.100 - population.ages.up.to.14")
  }else if(row["note"] == "Estimated based on surveys' results. Population age 5+." | row["note"] == "Population age 5+." | row["note"] == "Population age 5+ using Internet in the last 3 months." | row["note"] == "Population age 3+." | row["note"] == "Population age 6+."){
    return("population.ages.up.to.100 - X0.4")
  }else if(row["note"] == "Population age 10+."){
    return("population.ages.up.to.100 - X0.4 - X5.9")
  }else if(row["note"] == "Estimate for population age 6-74 living in electrified areas."){
    return("population.ages.up.to.74 - X0.4")
  }  
}

linkedIn.users[, "population.for.internet"] <- apply(linkedIn.users, 1, function(row) get.linkedin.deno(row))
linkedIn.users[, "population.for.internet"] <- apply(linkedIn.users, 1, function(row) as.numeric(row["population.for.internet"])*1000)
linkedIn.users[, "population.for.internet.note"] <- apply(linkedIn.users, 1, function(row) get.linkedin.deno.note(row))

linkedIn.users[, "internet.users.population"] <- linkedIn.users[, "population.for.internet"] * (linkedIn.users[, "internet.users.percent"]/100)

linkedIn.users[, "linkedin.ratio"] <- linkedIn.users[, "Number of Linkedin users"] / linkedIn.users[, "internet.users.population"]

linkedIn.users[, "Year"] <- 2014

rm(population.ages, population.ages.up.to.74, population.ages.up.to.100, population.ages.up.to.14, countriesn, notes, internet.users, countries)


