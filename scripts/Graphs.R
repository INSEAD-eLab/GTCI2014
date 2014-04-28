## female tertiary graduates
female.graphs <- merge(GDP.PPP.2013[, 2:4], female.tertiary.graduates, by="ISO3", all.y=T)
female.graphs <- female.graphs[!is.na(female.graphs$Year.x), ]

colnames(female.graphs)[2] <- "GDP.PPP.billions"

LVGK <- ggplot(data=female.graphs, aes(x=female.tertiary.graduates, y=GDP.PPP.billions, label=ISO3))
#LVGK + geom_point(shape = 19, alpha = .7) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2)
LVGK + geom_point(shape = 19, alpha = .7)

female.graph2 <- merge(population[, 2:4], female.tertiary.graduates, by="ISO3", all.y=T)
female.graph2 <- female.graph2[!is.na(female.graph2$Year.x), ]

colnames(female.graph2)[2] <- "Population.thousands"

LVGK <- ggplot(data=female.graph2, aes(x=female.tertiary.graduates, y=Population.thousands, label=ISO3))
LVGK + geom_point(shape = 19, alpha = .7) + geom_text(alpha=.75, size=3, hjust=-0.5, vjust=.2)
LVGK + geom_point(shape = 19, alpha = .7)