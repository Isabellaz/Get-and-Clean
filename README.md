# Getting and Cleaning Data

## This is a course project for Getting and Cleaning Data on Coursera

This repo explains how all of the scripts work and how they are connected.  

### Files

* README.md
* run_analysis.R - R code of getting a tidy data set
* CodeBook.md - indicates all the variables and summaries the calculated, along with units, and other relevant information

### Data Source

* The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
* A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* The project data sets can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### R script 

The Rscript created as run_analysis.R containing the following steps:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### 1. Merges the training and the test sets to create one data set.

In the folds we download from the website, the completed training set is seperated as subject - subject_train, activity - y_train, X_train; and the completed test set is also seperated as subject - subject_test, activity - y_test, X_test. So, before we merge the training set and test set, we need to firstly combine the subject and activity to the main data sets, and then combine the training set and test set to a data set named "data_merge", which has columns "subject", "activity" and features.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

We use grep() to search for matches for mean and std measurements in data_merge.This means whose title contains "mean()" or "std()" weill be selected. And mean_std is the data set we got in this step, which has columns named "subject", "activity" and column features.

#### 3. Uses descriptive activity names to name the activities in the data set.

Here, the descriptive activity names are obtained from activity_labels.txt. Then we get a data set data_activity_names which is obtained from the merged data set mean_std and activity_labels.

#### 4. Appropriately labels the data set with descriptive variable names. 

This stage creates a data set data_set, which rearranges the variables' order in data_activity_names from last step.

#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this step, we use a function aggregate() to compute the averages according to specific variables. Finally, we get a tidy data set with 180 obs of 68 variables and resulting a text file named "tidy_data_set.txt" by write.table().
