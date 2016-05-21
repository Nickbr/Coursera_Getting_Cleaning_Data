## First create the location to perform these operations
## note that this is my path - you would need to change to your prefered working directory
dataPath <- "C:/Users/nbrowne/Dropbox/Nick Work/Coursera/R Working Directory/DataCleansing/Programming Assignment/Data"
## note that if the path already exists, only a warning is thrown, so suppress that warning
dir.create(file.path(dataPath), showWarnings = FALSE)
## if the wd isn't already set to the working location, set it
if(getwd() != dataPath)
{
        setwd(dataPath)
}

## Download the data and unzip
zipPath <- "getdata projectfiles FUCI HAR Dataset.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath <- "UCI HAR Dataset"
if(!file.exists(zipPath))
{
        download.file(fileUrl, zipPath)
}
if (!file.exists(filePath)) {  
        unzip(zipPath)  
} 

## extract the activity lables
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
## convert to character
activityLabels[,2] <- as.character(activityLabels[,2])
## extract and read features
features <- read.table("UCI HAR Dataset/features.txt")
## convert to character
features[,2] <- as.character(features[,2]) 

## now extract only the measurements on the mean and standard deviation for each measurement.
## find the data we want
deviationFeatures <- grep(".*mean.*|.*std.*", features[,2]) 
deviationFeatures.names <- features[deviationFeatures,2] 
##clean the names
deviationFeatures.names = gsub('-mean', 'Mean', deviationFeatures.names) 
deviationFeatures.names = gsub('-std', 'Std', deviationFeatures.names) 
deviationFeatures.names <- gsub('[-()]', '', deviationFeatures.names) 

## unzip and extract the training data from the temp file 
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt")[deviationFeatures]
trainingActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
## merge the training data
trainingData <- cbind(trainingSubjects, trainingActivities, trainingData)

## unzip and extract the testing data from the temp file 
testingData <- read.table("UCI HAR Dataset/test/X_test.txt")[deviationFeatures]
testingActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testingSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
## merge the testing data
testingData <- cbind(testingSubjects, testingActivities, testingData)

## now merge all the training and testing data
mergedData <- rbind(trainingData, testingData)
## and tidy up the column names
colnames(mergedData) <- c("Subject", "Activity", deviationFeatures.names)
colnames(mergedData) <- tolower(colnames(mergedData))

## now make the activities and subjects into factors and map levels to labels
mergedData$activity <- factor(mergedData$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 
mergedData$subject <- as.factor(mergedData$subject) 

##load the appropriate library to use melt
library(reshape2)
meltedData <- melt(mergedData, id = c("subject", "activity"))
mergedMeanData <- dcast(meltedData, subject + activity ~ variable, mean)

##write the table out to file
write.table(mergedMeanData, "../tidy.txt", row.names = FALSE, quote = FALSE)
