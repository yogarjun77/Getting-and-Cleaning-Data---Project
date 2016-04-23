##UCI Human Activity Recognition Using Smartphones - Preparation of Tidy Data Set

###Preparation of 4 files - 
1. readme.md - to explain the derivation of tidy data set using run_analysis.R script
2. run_analysis.R - R script to generate tidy data set
3. codebook.md - explanation of variable selections and experiment details
4. HAR_tidy.txt - as final output


###Step by step explanation to obtain tidy data set using run_analysis.R script

1. Assuming data unzipped already to /UCI HAR Dataset folder - create data frames for all files using read table function - 8 files in total

2. Create a master_data set that combines all the data

a) Clean up Column Names -features.txt will be the names of 561 columns in all the tables. 

b) Create Master table for test data set - column bind activity and subject, row bind test and train tables

c) verify proper length/rows


3.  Extract only required mean and std measurements into clean_data - ignoring meanfreq and angle(...) tests


4. write data to tidy data file HAR_tidy.txt


