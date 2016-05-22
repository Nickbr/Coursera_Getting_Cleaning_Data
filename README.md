# Coursera Data Science Specialisation - Getting and Cleaning Data - Programming Assignment

## Description

This is the programming assignment for the coursera course "Getting and Cleaning Data" in the Data Science Specialisation. It comprises 4 parts:

1. This README.md file which describes the contents of the repository
2. An R file named run_analysis which takes data sets described below and tidys them as per the requirements of the assignment
3. A text file named tidy.txt that contains the tidy data
4. A code book names CodeBook.md that describes the data

## Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Source Data

The R file will download the source data as a zip file which contains the following data.
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## The R file

Once the data is available the R file will

1. Set up the appropriate folders and data folder, and set he wd to the data folder to operate on the data
1. Unzip the data (if not already unzipped)
2. Load the activity and features data
3. Clean up the names of the deviation columns we're interest in
4. Load only the training and testing data we're interested in
5. Load the activities and subject data for training and testing data and merge them with the existing training and testing data
6. Merge the training and testing datasets into an single data set
7. Convert the subjects and activity columns of the merged dataset into factors
8. use melt and dcast to create the tidy data set
9. Save the tidy dataset to a file called tidy.txt in the parent folder where the R file is stored (this is so the repo is clean and doesn't contain the source data)

## The Tidy Data

Once the R script runs, it will create tidy.txt, which is described in CodeBook.md. The data contains the means for all data for each test subject for each activity.

