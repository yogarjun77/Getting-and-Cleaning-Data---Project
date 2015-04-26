###The objective of the experiment is to build a database to recognize human activities using the accelerometer and gyroscope sensors available on smartphones.
###The objective of the assignment is to generate a tidy data set of this experiment data to give a meaningful insight of the experiment - a logical summary for initial interpretation

###Experiment brief:

6 key activities are performed by 30 subjects to generate 2 data sets (randomly partitioned)
	- 70% - 21 volunteers 	for actual training data
	- 30% - 9  volunteers 	for test data

Each dataset contains:

	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

###List of files/data used for creating tidy data set
	1. features.txt (list of all the 561 variables)
	2. activity_labels.txt (names of the 6 activities)
		Test Folder:
	3. subject_test.txt - - subject id for each test
	4. X_test.txt - test data set
	5. y_test.txt - activity labels for test
		Train Folder:
	6. subject_train.txt - - subject id for each training
	7. X_train.txt - train data set
	8. y_train.txt - activity labels for train
	
	
	Ignored - Inertial signals data - 
	Why? - as these are the unprocessed raw data and are provided for more detailed computations and studies
	
	Combining these data creates an initial table(master_data) of 561 columns and 10299 rows needs to be tidied up
	
###Variables selection
	Activity and subject added as 1st and second column
	The mean and std devation measurements for each test/training activity is retrieved
	Used variables - total columns
		tBodyAcc-XYZ - 6 col
		tGravityAcc-XYZ - 6 col
		tBodyAccJerk-XYZ - 6 col
		tBodyGyro-XYZ - 6 col
		tBodyGyroJerk-XYZ 6 col
		tBodyAccMag - 2 col
		tGravityAccMag - 2 col
		tBodyAccJerkMag - 2 col
		tBodyGyroMag - 2 col
		tBodyGyroJerkMag - 2 col
		fBodyAcc-XYZ - 6 col
		fBodyAccJerk-XYZ - 6 col
		fBodyGyro-XYZ - 6 col
		fBodyAccMag - 2 col
		fBodyAccJerkMag - 2 col
		fBodyGyroMag - 2 col
		fBodyGyroJerkMag - 2 col
	Total columns = 2 + 6*8 + 2*9 = 68

	Ignored - meanfreq and angle(...) data
		meanFreq is omitted as it is not a pure mean/std measurement and it exists only for f domain datasets
		angle(...)data - is the angle between vectors
		"angle(tbodyaccmean,gravity)"          "angle(tbodyaccjerkmean),gravitymean)"
		"angle(tbodygyromean,gravitymean)"     "angle(tbodygyrojerkmean,gravitymean)"
		"angle(x,gravitymean)"                 "angle(y,gravitymean)"                
		"angle(z,gravitymean)"                
	
	Table now contains 68 columns and 10299 rows
	
###Variables naming
	The names are pretty long and complex. In the end it is difficult to create a very meaningful naming convention
	Instead -  spaces and unnecessary brackets are removed and all set to lower cases
	Codebook is updated with list of variables
	
###Final table
	Average of each activity is calculated for each data set.
	Summarizing by activity type would show how well each activity was measured across the 30 subjects 
	Why? - to understand how effective the smartphone is able to identify the activity of the subject 
		and understand average deviations and means of the measurements
	Columns - 68, rows - 180
	
###Codebook
	Column short name
	Column description
	Unit
	Other info
	











