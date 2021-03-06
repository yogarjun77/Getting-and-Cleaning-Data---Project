###The objective of the experiment is to build a database to recognize human activities using the accelerometer and gyroscope sensors available on smartphones. - detailed and license at end of the document
###The objective of the assignment is to generate a tidy data set of this experiment data to give a meaningful insight of the experiment - a logical summary for initial interpretation

###Experiment brief:

6 key activities are performed by 30 subjects to generate 2 data sets (randomly partitioned)

1- Walking
2- Walking upstairs
3- Walking downstairs
4- Sitting
5- Standing
6- Laying

Subject division
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
	
	
	
###Variables selection
	Activity and subject added as 1st and second column
	The mean and std devation measurements for each test/training activity is retrieved
	"t" - refers to time domain
	"f" - refers to frequency domain derived using FFT
	Gyro - input from gyroscope
	Acc - input from accelerometer
	std - standard deviation
	mean - mean of measurement
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
		"angle.tBodyAccJerkMean..gravityMean" "angle.tBodyGyroMean.gravityMean"    
                "angle.tBodyGyroJerkMean.gravityMean" "angle.X.gravityMean"                
                "angle.Y.gravityMean"                 "angle.Z.gravityMean"        
	
	
	
###Variables naming
	The names are pretty long and complex. In the end it is difficult to create a very meaningful naming convention
	Instead -  spaces, dashes and unnecessary brackets are removed. Periods and Capital letters are used to easily differentiate variables
	Codebook is updated with list of variables
	
###Final table
	Average of each activity is calculated for each data set.
	Summarizing by activity type would show how well each activity was measured across the 30 subjects 
	Why? - to understand how effective the smartphone is able to identify the activity of the subject 
		and understand average deviations and means of the measurements
	
	
	

###License/Link:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
