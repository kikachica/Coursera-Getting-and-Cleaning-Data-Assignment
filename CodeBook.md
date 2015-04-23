# The Code Book

The tidy_data.txt set consists of a subset of the fields from the "Human Activity Recognition Using Smartphones" data set. 

# Original Experiment


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

# The tidy data design

First, the training and test data sets were combined in one big data set:
* x_data (number) contains all measurments of all signals from the original experiment
* y_data contains codes for all activities (it is a number 1 to 6 each representing an activity:
		1 = WALKING
 		2 = WALKING UPSTAIRS
		3 = WALKING DOWNSTAIRS
		4 = SITTING
		5 = STANDING
		6 = LAYING)
* subject_data (number) contains a list of subject who performed an activity (number from 1 to 30)

After that, the codes for activities are changed to actual names of the activities.

I have changed the column names of the variables containing mesurements (all variables except “Subject” and “Activity”) because they contained characters that are not allowed as column names.

The tidy data set is created extracting only columns containing mean and standard deviation measurements and changing column names to be more readable. Names are very similar to original names, changing only “mean()” into “mean” and “std()” into “StdDev”.

In the end I included write.table() to create .txt file for the tidy data.
# summarizing the data

The summarized.txt contains the average of each variable for each activity and each subject.
This file is generated from the run_analysis.R code with write.table().

It is created with 
summarized_data <- group_by(tidy_data, Subject, Activity) %>% summarise_each(funs(mean))



# The Variables


The Subject variable rappresents a group of 30 volunteers within an age bracket of 19-48 years and it is rappresented by an integer 1 to 30

The Activity is a character variable rappresenting the activity each subject performed (Laying, Sitting, Standing, Walking, Walking downstairs, Walking upstairs) wearing a smartphone (Samsung Galaxy S II) on the waist

The following wariables are numbers and represent mesurments as described in the original data set:

tBodyAcc.mean-X  
tBodyAcc.mean-Y  
tBodyAcc.mean-Z  
tGravityAcc.mean-X  
tGravityAcc.mean-Y  
tGravityAcc.mean-Z  
tBodyAccJerk.mean-X  
tBodyAccJerk.mean-Y  
tBodyAccJerk.mean-Z  
tBodyGyro.mean-X  
tBodyGyro.mean-Y  
tBodyGyro.mean-Z  
tBodyGyroJerk.mean-X  
tBodyGyroJerk.mean-Y  
tBodyGyroJerk.mean-Z  
tBodyAccMag.mean  
tGravityAccMag.mean  
tBodyAccJerkMag.mean  
tBodyGyroMag.mean  
tBodyGyroJerkMag.mean  
fBodyAcc.mean-X  
fBodyAcc.mean-Y  
fBodyAcc.mean-Z  
fBodyAccJerk.mean-X  
fBodyAccJerk.mean-Y  
fBodyAccJerk.mean-Z  
fBodyGyro.mean-X  
fBodyGyro.mean-Y  
fBodyGyro.mean-Z  
fBodyAccMag.mean  
fBodyBodyAccJerkMag.mean  
fBodyBodyGyroMag.mean  
fBodyBodyGyroJerkMag.mean  
tBodyAcc.StdDev-X  
tBodyAcc.StdDev-Y  
tBodyAcc.StdDev-Z  
tGravityAcc.StdDev-X  
tGravityAcc.StdDev-Y  
tGravityAcc.StdDev-Z  
tBodyAccJerk.StdDev-X  
tBodyAccJerk.StdDev-Y  
tBodyAccJerk.StdDev-Z  
tBodyGyro.StdDev-X  
tBodyGyro.StdDev-Y  
tBodyGyro.StdDev-Z  
tBodyGyroJerk.StdDev-X  
tBodyGyroJerk.StdDev-Y  
tBodyGyroJerk.StdDev-Z  
tBodyAccMag.StdDev  
tGravityAccMag.StdDev  
tBodyAccJerkMag.StdDev  
tBodyGyroMag.StdDev  
tBodyGyroJerkMag.StdDev  
fBodyAcc.StdDev-X  
fBodyAcc.StdDev-Y  
fBodyAcc.StdDev-Z  
fBodyAccJerk.StdDev-X  
fBodyAccJerk.StdDev-Y  
fBodyAccJerk.StdDev-Z  
fBodyGyro.StdDev-X  
fBodyGyro.StdDev-Y  
fBodyGyro.StdDev-Z  
fBodyAccMag.StdDev  
fBodyBodyAccJerkMag.StdDev  
fBodyBodyGyroMag.StdDev  
fBodyBodyGyroJerkMag.StdDev  


