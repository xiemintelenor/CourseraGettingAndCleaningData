# File
#   run_analysis.R
# 
# This script is for the project of Getting and  Cleaning Data
# It downloads data from the given web link, reads and merges the data,
# describes and labels the data with descriptive names,
# computes the average of each variable for each subject 
# and finally creates and saves the tidy data into another file

#############################################################################
# Get Data                          
#############################################################################

# Load packages
library(data.table)
library(reshape2)

# Set working directory 
setwd("~/Documents/Learning/Data Science/Course 3 - Cleaning Data/CourseraGettingAndCleaningData")


# Download the zip file 
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists('./Data')) {dir.create('./Data')}
download.file(dataURL, destfile = "./Data/dataset.zip")

# Unzip the data file 
unzip (zipfile = "./Data/dataset.zip", exdir = "./Data")
list.files("./Data/UCI HAR Dataset/", recursive = TRUE)

# Set the data path 
dataPath <- "./Data/UCI HAR Dataset/"

#############################################################################
# Read Data                          
#############################################################################

# Read features
featureData <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

# note that featureData[,2] is the feature name for each variable in X of each data set 

# Read training data and set up the column names based on the featureData 
trainSubject <- read.table(file.path(dataPath, "train", "subject_train.txt"))
colnames(trainSubject) <- 'SubjectID'
trainX <- read.table(file.path(dataPath, "train", "X_train.txt"))
colnames(trainX) <- featureData[,2]
trainY <- read.table(file.path(dataPath, "train", "y_train.txt"))
colnames(trainY) <- 'ActivityID'


# Read test data and set up the column names based on the featureData 
testSubject <- read.table(file.path(dataPath, "test", "subject_test.txt"))
colnames(testSubject) <- 'SubjectID'
testX <- read.table(file.path(dataPath, "test", "X_test.txt"))
colnames(testX) <- featureData[,2]
testY <- read.table(file.path(dataPath, "test", "y_test.txt"))
colnames(testY) <- 'ActivityID'


# Read activity labels that will be used to describe the activities in the data set
activityData <- read.table(file.path(dataPath, "activit y_labels.txt"))
colnames(activityData) <- c('ActivityID', 'Activity')

#############################################################################
# Step 1: Merge the training data set and test data set into one data set                         
#############################################################################

# merge the 3 training sets into one; merge the 3 test sets into one;
# merge the training and test data set into one set. 
mergedDataset <- rbind (cbind(trainSubject,trainX, trainY), cbind(testSubject,testX, testY))


#############################################################################
# Step 2: Extract only the measurements on the mean and standard deviation for each measurement                      
#############################################################################

# find the columns with only mean and std in the names
colIndex <- grepl('SubjectID|ActivityID|mean..|std..', colnames(mergedDataset))

# filter the data set for the columns of interest (with only mean and std)
extractData <- mergedDataset[, colIndex]

#############################################################################
# Step 3: Use desriptive activity names to name the ativities in the data set                      
#############################################################################

# use the activityData to name the activities 
extractData$ActivityID <- factor (extractData$ActivityID, levels = activityData[['ActivityID']],
                                  labels = activityData[['Activity']])

#############################################################################
# Step 4: Appropriately label the data set with descriptive variable names                       
#############################################################################

# transform the Subject into "factor" 
extractData$SubjectID <- as.factor (extractData[,"SubjectID"])

# melt the dataset into a form for casting based on SubjectID and ActivityID
extractData <- reshape2::melt(data = extractData, id = c('SubjectID', 'ActivityID'))

#############################################################################
# Step 5: From the data set in Step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject                    
#############################################################################

# cast the dataset based on the "mean" function
extractData <- reshape2::dcast(data = extractData, SubjectID + ActivityID ~ variable, fun.aggregate = mean)

# write the dataset into a tidyData.txt file
write.table(x = extractData, file = "./Data/tidyData.txt", row.names = FALSE, quote = FALSE)
