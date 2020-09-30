---
title: README 'Getting and Cleaning Data Course Project'
author: 'MH'
date: '29/09/2020'
output: html_document
---

## Introduction
This file is intended to explain the analysis files used in the 'Getting and Cleaning Data' Course Project.

### Script developped for the course project

### Files used for the course project
Here is the link to the data folder used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
It is supposed that this forlder is dowloaded and extracted into the R working directory.
From this directory, the following files are used:

- 'features.txt': labels of  features measured 
- 'activity_labels.txt': class labels with their activity name
- 'train/X_train.txt': Training set features.
- 'train/y_train.txt': Training set activities.
- 'train/subject_train.txt': Training set subjects.
- 'test/X_test.txt': Testing set features.
- 'test/y_test.txt': Testing set activities.
- 'test/subject_test.txt': Testing set subjects.

## Script
The script is following the steps described below:

1. Merge the training and the testing sets to create one data set.
  + 1.1 Read training subjects, features, and target(activities) , and assign them respectively to 'subjects_train', 'X_train', and 'Y_train'
  + 1.2 merge 'X_train','subjects_train', and 'Y_train' to form the trainning set 'train_set'
  + 1.3 Read testing subjects, features, and target(activities), and assign them respectively to 'subjects_test', 'X_test', and 'Y_test'
  + 1.4 merge 'X_test', 'subjects_test', and 'Y_test' to form the 'test_set'
  + 1.5 Merge 'train_set' and 'test_set' to create one data set 'data_all'

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  + 2.1 Read features labels and assign them to  'features_lab'
  + 2.2 Use 'grep' function to extracts only the measurements on the mean and standard deviation for each measurement in 'features_lab' and assign them to  'features_lab_mean' and 'features_lab_std'
  + 2.3 combine 'features_lab_mean' and 'features_lab_std' into 'features_lab_mean_or_std'
  + 2.4 from 'data_all' , extracts only columns of the measurements on the mean and standard deviation for each measurement ( based on 'features_lab_mean_or_std'), and the column 'subjects',  and the column 'activities'. Assign the result to 'data_selection'

3. Use descriptive activity names to name the activities in the data set
  + 3.1 Read target class labels and assign the result to 'activity_labels'
  + 3.2 use 'factor()' function to name class labels in 'data_selection'

4. Appropriately labels the data set with descriptive variable names.
  + 4.1 extract features colnames from 'features_lab' and remove extra charactere '()' 
  + 4.2 rename 'data_selection' colnames: rename features colnames based on 'features_lab_mean_or_std' labels,
rename subject colname 'subject' + rename target colname 'activity' 


5. From the data set in step 4, creates a second, independent tidy data set 'data_tidy' with the average of each variable for each activity and each subject.
  + 5.1 'use dplyr()' function to calculate features averages grouped by  'activity' and 'subject' and assign the result to 'data_tidy'
  + 5.2 write 'data_tidy' into a text file 'data_tidy.txt'


