# Getting-and-Cleaning-Data---Project
Getting and Cleaning Data Course Project



#Step 1 - assuming data unzipped already to /UCI HAR Dataset folder - create data frames for all relevant files

setwd("./UCI HAR Dataset")

Activity_labels <- read.table("activity_labels.txt")
Features <- read.table("features.txt")

Subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")


Subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")

#Create full table for Train & Test - merge 
# Add column - Y_test/Y_train - show type of activity (1-6) - based on Activity_labels
#Add column - Subject_test/Subject_train - show subject identification










#Processing Features - list of all the 561 columns (test results) - to extract only columns with mean/std deviation 
	#Convert all data to lower case
	Features <- tolower(Features[,2])

	#Filter Features to identify tests that show mean/std deviation


	Substring = "mean|std"
	Features_Filtered <- grepl(substring, Features[,2])
