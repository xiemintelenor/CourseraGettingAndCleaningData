# Getting and Cleaning Data Project - Code Book

This is the code book of the tidy data set [tidyData.txt](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/blob/master/tidyData.txt)

This code book describes:

* variables
* data
* transformations that have been eprformed to clean up the data.


## Source Data
The original data is available at [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data files are also available in this project's repo [Data](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/tree/master/Data). 

A full description of the original data data is available at [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Tidy Data 
The tidy data set is stored in `tidyData.txt`. The first row gives the names of all variables. There are in total 81 variables for 180 objects. Among the 81 variables, there are 

* 1 subjectID: integer from 1 to 30
* 1 activityID: strings of 6 activities 
* 79 averaged measurements


## Variables 
### Subject
The `SubjectID` represents the ID of 30 volunteers within the age between 19 and 48.

### Activity
The `ActivityID` indicates one of the following 6 activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Signal measurements
The tidy data set contains only the mean and std of the measurements of the following signals, classified into two domains:

#### Time-domain signals: variables prefixed by "t"

* 3 BodyAcc means for X, Y, and Z
* 3 BodyAcc std for X,Y, and Z
* 3 GravityAcc means for X, Y, and Z
* 3 GravityAcc std for X, Y, and Z
* 3 BodyAccJerk means for X, Y, and Z
* 3 BodyAccerk std for X,Y, and Z
* 3 BodyGyro means for X, Y, and Z
* 3 BodyGyro std for X,Y, and Z
* 3 BodyGyroJerk means for X, Y, and Z
* 3 BodyGyroJerk std for X,Y, and Z
* 2 BodyAccMag: mean and std
* 2 GravityAccMag: mean and std
* 2 BodyAccJerkMag: mean and std
* 2 BodyGyroMag: mean and std
* 2 BodyGyroJerkMag: mean and std


#### Frequency-domain signals: variables prefixed by "f"
* 3 BodyAcc means for X, Y, and Z
* 3 BodyAcc std for X,Y, and Z
* 3 BodyAcc mean frequency for X, Y, and Z
* 3 BodyAccJerk means for X, Y, and Z
* 3 BodyAccJerk std for X,Y, and Z
* 3 BodyAccJerk mean frequency for X, Y, and Z
* 3 BodyGyro means for X, Y, and Z
* 3 BodyGyro std for X,Y, and Z
* 3 BodyGyro mean frequency for X, Y, and Z
* 3 BodyAccMag: Mean, std, and mean frequency
* 3 BodyAccJerkMag: Mean, std, and mean frequency
* 3 BodyGyroMag: Mean, std, and mean frequency
* 3 BodyGyroJerkMag: Mean, std, and mean frequency



## Transformations
Main transformations are:
1. the training set and test data are merged into one data set called `mergedData`
2. the measurements on the mean and standard deviation for each measurement are extracted and saved into a new dataset called `extractData`
3. the activity is labeled by `Activity` of the `activityData`, by using the `ActivityID`
4. the variable names are labeled properly 
5. the average of each variable is computed for each activity and each subject
