
############################################
############################################
# SOME LINES TO MODIFY (if you add/remove lines, these may change!): 24, 28, 29, 30, 34, 38, 42, 46, 49, 52 (typically only 29, 34, 38, 42, 46)
############################################
############################################

# Project Name: "Sessions 2-3 of INSEAD Big Data Analytics for Business Course: "Dimensionality Reduction and Derived Attributes"
rm(list=ls())
######################################################################

# THESE ARE THE PROJECT PARAMETERS NEEDED TO GENERATE THE REPORT

# When running the case on a local computer, modify this in case you saved the case in a different directory 
# (e.g. local_directory <- "C:/user/MyDocuments" )
# type in the Console below help(getwd) and help(setwd) for more information
local_directory <- paste(getwd(), "/scripts/PCA", sep="")

cat("\n *********\n WORKING DIRECTORY IS ", local_directory, "\n PLEASE CHANGE IT IF IT IS NOT CORRECT using setwd(..) - type help(setwd) for more information \n *********")

# Please ENTER the name of the file with the data used. The file should contain a matrix with one row per observation (e.g. person) and one column per attribute. THE NAME OF THIS MATRIX NEEDS TO BE ProjectData (otherwise you will need to replace the name of the ProjectData variable below with whatever your variable name is, which you can see in your Workspace window after you load your file)
datafile_name="Boats" # do not add .csv at the end! make sure the data are numeric!!!! check your file!

# Please ENTER the filename of the Report and Slides (in the doc directory) to generate 
report_file = "PCA"

## change the data file location and name if there is any changes.
datafile <- loadWorkbook(paste(local_directory, "/data/2014 05 06 JRC submission based on GTCI 2013 framework_1 Sub-Pillar and 60 Overall.xlsx", sep=""))

Level <- 3 # or 2 or 3

if(Level == 1){
  ProjectData <- readWorksheet(datafile, sheet="Normalized", region="B6:AY131", header=T)
  
  number_of_variables=c(3,6,2,3,5,6,2,4,2,4,3,2,4,2)
  names_of_factors=c("Regulatory Landscape", "Market Landscape", "Business Landscape", "External Openness", "Internal Openness","Formal Education","Lifelong learning",
                     "Access to growth opportunities", "Sustainability", "Lifestyle", "Employable skills", "Labour productivity", "Higher Skills", "Talent Impact")
  
  level_for_PCA = "Sub-pillar :"
  
  report_file = "PCA"
}else if(Level==2){
  ProjectData <- readWorksheet(datafile, sheet="Calculation", region="B6:Y131", header=T)
  number_of_variables=c(3,2,3,2,2,2)
  names_of_factors=c("Enablers", "Attract", "Grow", "Retain", "Labour and vocational", "Global Knowledge")
  
  level_for_PCA = "Pillar :"
  
  report_file = "PCA"
}else if(Level==3){
  ProjectData <- readWorksheet(datafile, sheet="Calculation", region="B6:Y131", header=T)
  
  factor_attributes_used=c(19:24)
  
  report_file = "PCA_Highest"
}

# Please ENTER the selection criterions for the factors to use. 
# Choices: "eigenvalue", "variance", "manual"
factor_selectionciterion = "eigenvalue"

# Please ENTER the desired minumum variance explained 
# (ONLY USED in case "variance" is the factor selection criterion used). 
minimum_variance_explained = 65  # between 1 and 100

# Please ENTER the number of factors to use 
# (ONLY USED in case "manual" is the factor selection criterion used).
manual_numb_factors_used = 6

# Please ENTER the rotation eventually used (e.g. "none", "varimax", "quatimax", "promax", "oblimin", "simplimax", and "cluster" - see help(principal)). Defauls is "varimax"
rotation_used="varimax"

# Please enter the minimum number below which you would like not to print - this makes the readability of the tables easier. Default values are either 10e6 (to print everything) or 0.5. Try both to see the difference.
MIN_VALUE=0.5

# Now run everything

#factor_attributes_used = unique(sapply(factor_attributes_used,function(i) min(ncol(ProjectData), max(i,1))))
#ProjectDataFactor=ProjectData[,factor_attributes_used]

source(paste(local_directory,"R/library.R", sep="/"))
source(paste(local_directory,"R/runcode.R", sep = "/"))
