# Getting and Cleaning Data Course Project

In this project, the goal is to get and clean the data collected from the accelerometers from the Samsung Galaxy S smartphones. The output is a tidy data set that can be used for future analysis. 

The output (or submission) of this project includes:
1. a tidy dataset
2. a link to a github repo with .R script for the analysis;
3. a code book describing the variables, the data and any transformation that has been done. 

This folder contains the following files:
1. tidy data set: [link](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/blob/master/tidyData.txt)
2. github repo with the required script: [link]
3. codebook: [link](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/blob/master/CodeBook.md)
4. README with explanation of the analysis file:[link](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/edit/master/README.md)
5. the R script: [link](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/blob/master/run_analysis.R)
6. the markdown of the R script: [link](https://github.com/xiemintelenor/CourseraGettingAndCleaningData/blob/master/run_analysis.Rmd)



A R script run_analysis.R is created to do the following.

0. Prepare the data, including downloading, unzipping, and reading the data into tables
1. Merges the training and the test sets to create one data set: use rbind and cbind to combine multiple tables. 
2. Extracts only the measurements on the mean and standard deviation for each measurements
3. Uses descriptive activity names to name the activities in the data set
4. ppropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
