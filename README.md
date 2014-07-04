## GTCI 2014

The folders in the repository are as following:

* 1) data

This folder will have all the original data files in EXCEL format. The files are taken from individual folders of GTCI dropbox.

* 2) export

This folder will have all the exported files, mainly for PDF rankings.

* 3) graphs

This folder will have all the graphs that we did. However, this year, we haven't done much yet.

* 4) scripts

This folder will have all the scripts to clean and merge the data. PCA and functions files to generate PDF reports are also inside this folder.

* 5) webapp

This folder will have the codes for web application. Details of this folder can be found in following sessions.

## Dependent packages

This respository and codes made use of following packages and are recommended to install them before running the codes.

_XLConnect, seqinr, knitr, xtable, foreign, devtools, graphics, grDevices, 
Hmisc, vegan, fpc, GPArotation, FactoMineR, cluster, psych, stringr, googleVis
png, ggplot2, googleVis, gridExtra_


## Scripts

#### Data Cleaning

Data cleaning consists of mainly matching the country names with ISO3 code and getting the lastest year with threshold 2002. However, a few steps such as changning the long format from wide format, etc, are carried out in the functions. The data cleaning functions are written in Scripts > functions.R . Based on the type and format of the original data, appropriate functions should be used. Each sub-pillar will have an individual data cleaning file. After running the file, data objects wil be generated and it can be merged using ISO3 as "by variable".

Merging is done inside Scripts > merging folder. each file will merge a pillar and finally, "master.R" will merge all the pillars. Merging should be done on a powerful computer with a lot of extra RAM. 

#### PDF report

To export PDF, create a data object for desired variable. Then use _generate.pdf_ function to generate. Function variables are as following :

* variable.object = data object to be exported as PDF
* variable.to.sort = variable name to be sorted when exported to PDF. Need to provide as string.
* name = name to be given to the exported PDF.
* note = note message to provide below the variable name inside the PDF.

Example calls for this functions are at Scripts > PDFexport.R and PDF files are inside "export"" folder.

#### PCA


## Webapp

#### Data upload file format