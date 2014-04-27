Getting and Cleaning Data Specialization Course - Peer Assessments 

## Course Assignment Code Book 

The tidy data set (tall and skinny data set) which is an output of the run_analysis.R script is a data frame with 4 variables described below and 11880 observations (30 subjects * 6 activity * 66 measured variables from the original data).

### The tidy data set - variables and their values description

### subjectID 
* Description: Number of a subject/person wearing a smartphone and performing an activity.
* Class: integer
* Values: 1, 2, ..., 30

### activity 
* Description: An activity performed by a subject/person.
* Class: factor with 6 levels
* Levels:
     - LAYING
     - SITTINS
     - STANDING
     - WALKING
     - WALKING_UPSTAIRS
     - WALKING_DOWNSTAIRS

### variable
* Description: Measured variable names only for the mean and standard deviation for each measurement in the original data set. Note: The measured variable names have character values which are converted into factor. 
* Class: factor with 66 levels
* Levels: 
     - tBodyAcc-mean()-X           
     - tBodyAcc-mean()-Y           
     - tBodyAcc-mean()-Z
     - tBodyAcc-std()-X
     - tBodyAcc-std()-Y
     - tBodyAcc-std()-Z
     - tGravityAcc-mean()-X
     - tGravityAcc-mean()-Y
     - tGravityAcc-mean()-Z
     - tGravityAcc-std()-X
     - tGravityAcc-std()-Y
     - tGravityAcc-std()-Z
     - tBodyAccJerk-mean()-X       
     - tBodyAccJerk-mean()-Y
     - tBodyAccJerk-mean()-Z
     - tBodyAccJerk-std()-X
     - tBodyAccJerk-std()-Y
     - tBodyAccJerk-std()-Z
     - tBodyGyro-mean()-X
     - tBodyGyro-mean()-Y
     - tBodyGyro-mean()-Z
     - tBodyGyro-std()-X
     - tBodyGyro-std()-Y
     - tBodyGyro-std()-Z
     - tBodyGyroJerk-mean()-X
     - tBodyGyroJerk-mean()-Y
     - tBodyGyroJerk-mean()-Z
     - tBodyGyroJerk-std()-X
     - tBodyGyroJerk-std()-Y
     - tBodyGyroJerk-std()-Z
     - tBodyAccMag-mean()
     - tBodyAccMag-std()
     - tGravityAccMag-mean()
     - tGravityAccMag-std()
     - tBodyAccJerkMag-mean()
     - tBodyAccJerkMag-std()
     - tBodyGyroMag-mean()
     - tBodyGyroMag-std()
     - tBodyGyroJerkMag-mean()
     - tBodyGyroJerkMag-std()
     - fBodyAcc-mean()-X
     - fBodyAcc-mean()-Y
     - fBodyAcc-mean()-Z
     - fBodyAcc-std()-X
     - fBodyAcc-std()-Y
     - fBodyAcc-std()-Z
     - fBodyAccJerk-mean()-X
     - fBodyAccJerk-mean()-Y
     - fBodyAccJerk-mean()-Z
     - fBodyAccJerk-std()-X
     - fBodyAccJerk-std()-Y
     - fBodyAccJerk-std()-Z
     - fBodyGyro-mean()-X
     - fBodyGyro-mean()-Y
     - fBodyGyro-mean()-Z
     - fBodyGyro-std()-X
     - fBodyGyro-std()-Y
     - fBodyGyro-std()-Z
     - fBodyAccMag-mean()
     - fBodyAccMag-std()
     - fBodyBodyAccJerkMag-mean()
     - fBodyBodyAccJerkMag-std()
     - fBodyBodyGyroMag-mean()
     - fBodyBodyGyroMag-std()
     - fBodyBodyGyroJerkMag-mean()
     - fBodyBodyGyroJerkMag-std()

### mean
* Description: Average of each variable for each activity and each subject. 
* Class: numeric
* Values: e.g. 0.2216 -0.0405 -0.1132 -0.9281 -0.8368
 


### The original data set 

The raw data used to get the tidy data set are downloadable here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the experimental study used to collect all original data is provided in the link above and also in the original site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

### The data processing

The processing of original data into tidy data is done by R script called run_analysis.R, which performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  


These 5 steps include creating new variables in a data frame, merging data frames, subsetting variables in a data frame, assigning descriptive activity names, reshaping data frame to get tall and skinny data (melt), and finally for each subset of a data frame, applying the mean function and then combine results into a tidy data frame (ddply). 

