#1 Load necessary libraries
library(data.table)
library(dplyr)
library(reshape2)
library(plyr)

##2 assuming data unzipped already to /UCI HAR Dataset folder - create data frames for all files - 8 files in total


setwd("./UCI HAR Dataset")

Activity_labels <- read.table("activity_labels.txt")
Features <- read.table("features.txt")

Subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")


Subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")


###3 Creating Master Data Set
        #Features will be the names of 561 columns in all the tables. Clean it up to all lower case, remove ()

        Features[,2] <- tolower(Features[,2])
        Features[,2] <- gsub("\\()", "", Features[,2])


        ####Create Master table for test data set

        names(X_test) <- Features[,2]
        names(Y_test) <- "activity"
        names(Subject_test) <- "subject"
        master_test <- cbind(Y_test, Subject_test, X_test)

        ###Create Master table for train data set


        names(X_train) <- Features[,2]
        names(Y_train) <- "activity"
        names(Subject_train) <- "subject"
        master_train <- cbind(Y_train, Subject_train, X_train)




        ####join test and train data sets

        master_data <- rbind(master_train, master_test)

        ###verify proper length/rows
        nrow(master_data)
        nrow(master_test)+nrow(master_train)
        ncol(master_data)
        ncol(master_test)
        ncol(master_train)

## 4 - extract only required mean and std measurements

        ###note - meanFreq is omitted as it is not a pure mean/std measurement and it exists only for f domain datasets

        Master_col_names <- names(master_data)
        substring = "subject|activity|mean|std"
        Master_col_names_2 <- grepl(substring, Master_col_names)&!grepl("meanfreq|angle\\(", Master_col_names)
        clean_data <- master_data[,which(Master_col_names_2)]


#5 Melt Data to reshape and recast into proper summarized table with mean for each variable


        # Objective of the experiment is to see if an activity is accurately monitored across different subjects
        # Summarizing by activity type would show how well each activity was measured across the 30 subjects.


        melt_data <- melt(clean_data, id = c("activity", "subject"))
        cast_data <- dcast(melt_data, activity + subject ~ variable, mean)
                  
#6 write data to tidy data file

        write.table(cast_data, "Human_Activity_Recognition_Using_Smartphones_tidy.txt", row.name=FALSE)

