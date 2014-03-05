## to remove all the variables and functions
rm(list=ls())

## to load the functions
source("scripts/functions.R")

## to load a particular sub-pillar
source("scripts/1.1 RegulatoryLandscape.R")


#### data checking for year
## replace the variable name to check
x <- Part.time.employment.rate.25

## to get the frequency table
table(x$Year)

## to get the histogram
hist(x$Year, xlim=c(min(x$Year)-1, max(x$Year)))

## TODO
# 2.2.4 Solution 7
# 4.2.4 Maternity and paternity leave 
