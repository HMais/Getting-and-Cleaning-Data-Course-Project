---
title: CodeBook "Getting and Cleaning Data Course Project " 
author: "MH"
date: "30/09/2020"
output: html_document
---


## Introduction

This code book describes the variables, the data, and work performed to clean up the data used in the Getting and Cleaning Data Course Project



## Data files
### Source files
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Files used for the course project
Here is the link to the data folder used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

From this directory, the following files are used:

- 'features.txt': labels of  features measured 
- 'activity_labels.txt': class labels with their activity name
- 'train/X_train.txt': Training set features.
- 'train/y_train.txt': Training set activities.
- 'train/subject_train.txt': Training set subjects.
- 'test/X_test.txt': Testing set features.
- 'test/y_test.txt': Testing set activities.
- 'test/subject_test.txt': Testing set subjects..


## Variables used

- subject : ID of participant
- activity : activity type (1 WALKING ,2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING
6 LAYING)

- Mean and standart deviation for the following features. 
  + tBodyAcc-XYZ
  + tGravityAcc-XYZ
  + tBodyAccJerk-XYZ
  + tBodyGyro-XYZ
  + tBodyGyroJerk-XYZ
  + tBodyAccMag
  + tGravityAccMag
  + tBodyAccJerkMag
  + tBodyGyroMag
  + tBodyGyroJerkMag
  + fBodyAcc-XYZ
  + fBodyAccJerk-XYZ
  + fBodyGyro-XYZ
  + fBodyAccMag
  + fBodyAccJerkMag
  + fBodyGyroMag
  + fBodyGyroJerkMag

These features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

More information about the initial set of features can be found in 'features_info.txt' from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## *Notes about variables used*

- Features are normalized and bounded within [-1,1].
- 'features_info.txt': Shows source information about the variables used.
- The following data transformations were made to generate a tidy dataset:
  + Extraction from data source, of  only the measurements on the mean and standard deviation for each feature.
  + Appropriately labeling the data set columns with descriptive variable names based on 'features.txt'.
  + Factorization of the activity vector based on 'activity_labels.txt'
  + building a tidy data set 'data_tidy' with the average of each variable for each activity and each subject.

