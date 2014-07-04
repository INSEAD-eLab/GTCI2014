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

Example calls for this functions are at Scripts > PDFexport.R and PDF files are inside "export" folder.

#### PCA

PCA files are inside scripts > PCA folder. Only after all normalization are done, PCA should be done. So, get the normalized data from playbook and use them. JRC submission files are recommended since they don't have space in between variables. The main file to run PCA is _scripts > PCA > RunPCA 2014 May 19.R_. 

Variables to be updated before running PCA is as following :

* datafile = it is the location of the file and name of the file. This has to be updated once the new data source is used.
* Level = 1 is to run PCA from variables to sub-pillar level, 2 is PCA from sub-pillars to pillar level, and 3 is from pillar to INDEX level. Please change this accordingly.
* ProjectData = Depending on Level, the _sheet_ and data _region_ should be changed accordingly.
* number of variables = this is to let R know how many variables are in each sub-pillar. Check data file and input the counts. Sample is provided. (eg c(5,7, ...) means Regulatory Landscape will have 5 variables and Market Landscape will have 7 variables, .. etc)

After updating all the variables, please press _source_ at the top right of the R Studio. For level 1 and 2, a HTML page with "PCA.html" will be generated inside scripts > PCA > doc folder. Rename it accordingly. For level 3, "PCA Highest.html" will be generated. 

To change the contents at the master file, please use "PCA.Rmd" and "PCA Highest.Rmd".

## Webapp

Webapp folder has mainly 2 files : ui.R and server.R. They are written based on Shiny Application and tutorials and guides can be found at : http://shiny.rstudio.com/ 

Data can be uploaded using CSV file. Sample for CSV file can be found at _webapp > 2014 06 25 GTCI.csv_. Mainly the data should start from first row and its variable names will be used accordingly. However, **Income.group** and **Regional.group** variable names should follow as shown.

Even if you don't have the csv file to upload, webapp will use the built in data. After doing other analysis such as PCA and variable changes, it is recommended to use csv file to upload the data since the built in data can be outdated.
