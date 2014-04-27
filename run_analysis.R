## Getting and Cleaning Data Specialization Course - Peer Assignment 

## This R script  does the following: 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive activity names. 
## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Data for the assignment have been downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and unzipped. The resulting dir is ./UCI HAR Dataset

library(reshape2)
library(plyr)

# Load files for the training and test sets

trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainActID <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubjID <- read.table("./UCI HAR Dataset/train/subject_train.txt")

testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActID <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjID <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merge the training and the test datasets. Note that these two sets are mutually exclusive.
# Therefore, rbind will merge them.

dataSet <- rbind(trainSet, testSet)

# Extract only the measurements on the mean and standard deviation for each measurement

indexMean <- grep("mean\\(\\)", features[,2])
indexStd  <- grep("std\\(\\)", features[,2])
indexSelected <- sort(c(indexMean, indexStd))
dataSet <- dataSet[, indexSelected]

# Set the column names of the merged data sets

colnames(dataSet) <- features[indexSelected,2]

# Use descriptive names to name the activities 
# For this part of the assignment the following is done:
# 1. merge the training and the test activity IDs 
# 2. map each activity ID to descriptive activity name 
# 3. add a new variable "activity" at the beginning of the dataSet

dataActID <- rbind(trainActID, testActID)
colnames(dataActID) <- "actID"

setActivityName <- function(x){activityLabels[x,2]}
dataActivity <- sapply(dataActID$actID, setActivityName)
dataActivity <- as.data.frame(dataActivity)
colnames(dataActivity) <- "activity"

dataSet <- cbind(dataActivity, dataSet)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
# For this part of the assignment the following is done:
# 1. merge the training and the test Subject IDs 
# 2. add a new variable - "subjectID" at the beginning of the dataSet
# 3. reshaping the data to create tall and skinny data set -> dataMelt
# 4. averaging values by using ddply -> dataTidy
# Note: dataTidy has 30 * 6 * 66 = 11880 obs. of only 4 variables (subjectID, activity, variable, mean)  

dataSubjID <- rbind(trainSubjID, testSubjID)
colnames(dataSubjID) <- "subjectID"

dataSet <- cbind(dataSubjID, dataSet)

#data <- cbind(dataSubjID, dataActivity, dataSet)
dataMelt <- melt(dataSet, id=c("subjectID", "activity"))
dataTidy <- ddply(dataMelt, .(subjectID, activity, variable), summarize, mean = mean(value))

# Write the tidy data set in a file dataTidy.txt
write.table(dataTidy, file = "dataTidy.txt")