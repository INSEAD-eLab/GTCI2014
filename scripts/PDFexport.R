rm(list=ls())
gc()

## to load the functions
source("scripts/functions.R")


## Pillar 6

## subpillar 6.2
generate.pdf(innovation.output, "GII innovation output", "GII Innovation Output")
generate.pdf(scaled.total.patent.resident.applications, "Scaled total patent resident applications", "Total patent resident applications")
generate.pdf(scaled.patent.resident.granted, "Scaled total patent resident granted", "Total patent resident granted")
