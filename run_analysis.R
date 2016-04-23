#Part 1 - assuming data unzipped already to /UCI HAR Dataset folder - create data frames for all files - 8 files in total

setwd("./UCI HAR Dataset")

Activity_labels <- read.table("activity_labels.txt")
Features <- read.table("features.txt")

Subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")


Subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")

#Part 2

#Features will be the names of 561 columns in all the tables.
#Cleaning up column names
# 1 - Remove empty brackets and whitespace
# 2 - Replace "-", "(", ")" and "," with "."
# 3 - Remove "." if it is at end

Features[,2] <- gsub(" ", "", Features[,2], fixed = TRUE)
Features[,2] <- gsub("\\(\\)", "", Features[,2])
Features[,2] <- gsub("\\(|\\)|\\,|\\-", ".", Features[,2])
Features[,2] <- gsub("\\.$", "", Features[,2])


#Create Master table for test data set

names(X_test) <- Features[,2]
names(Y_test) <- "test"
names(Subject_test) <- "subject"
master_test <- cbind(Y_test, Subject_test, X_test)

#Create Master table for train data set


names(X_train) <- Features[,2]
names(Y_train) <- "test"
names(Subject_train) <- "subject"
master_train <- cbind(Y_train, Subject_train, X_train)




#join test and train data sets

master_data <- rbind(master_train, master_test)

#verify proper length/rows
nrow(master_data)
nrow(master_test)+nrow(master_train)
ncol(master_data)
ncol(master_test)
ncol(master_train)

# Part 3 - extract only required mean and std measurements

#note - meanFreq is omitted as it is not a pure mean/std measurement

#Extract column names as a vector

Master_col_names <- names(master_data)
substring = "subject|test|mean|std"
Master_col_names_2 <- grepl(substring, Master_col_names, ignore.case = TRUE)&!grepl("meanfreq|angle\\.", Master_col_names, ignore.case = TRUE)
clean_data <- master_data[,which(Master_col_names_2)]






#Part 4 - create tidy data set

#Average of each variable for each activity(6 activities - column test) and each subject(30 subjects) and save as a tidy data set in .txt format



tidy1 <- aggregate(clean_data, by = list(clean_data$subject, clean_data$test), FUN= "mean", na.rm= TRUE)

write.table(tidy1[,c(3:ncol(tidy1))], "HAR_tidy.txt", row.name=FALSE)

