#3 files - 
###readme.md - to explain the derivation of tidy data set using run_analysis.R script
###run_analysis.R - R script to generate tidy data set
###codebook.md - explanation of variable selections and experiment details


###Step by step explanation to obtain tidy data set using run_analysis.R script

1. Load necessary libraries - dplyr, data.table, plyr, reshape2

2 - assuming data unzipped already to /UCI HAR Dataset folder - create data frames for all files using read table function - 8 files in total

3. - Creating a master_data set that combines all the data

	features.txt will be the names of 561 columns in all the tables. Clean it up to all lower case, remove ()

	Create Master table for test data set - column bind activity and subject, row bind test and train tables

	verify proper length/rows


4.  - extract only required mean and std measurements into clean_data - ignoring meanfreq and angle(...) tests


5.  Melt Data to reshape and re-cast into meaningful table. Final table will be cast_data which summarized tests by activity type

6. write data to tidy data file Human_Activity_Recognition_Using_Smartphones_tidy.csv


