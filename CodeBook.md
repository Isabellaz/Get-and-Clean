## This code book describes the variables and summaries the calculations, along with units, and other relevant information.

### Data Source

* The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
* A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* The project data sets can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variables

The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

In this R script, the data sets: data_merge, mean_std, data_activity_names, data_set and tidy_data_set are created as an outcome of each stage required by the course project, which contain three kinds of variables: "subject", "activity", and columns of features.

#### Data sets in run_analysis.R and transformation
	
* X_train
-- data.frame: 7352 obs. of  561 variables: 1st - 561st columns: num, data from "X_train.txt"

* y_train
-- data.frame: 7352 obs. of  1 variable: 1st column: activity numbers from "y_train.txt"

* data_train
-- data.frame: 7352 obs. of  563 variables: 1st column: int, subject numbers; 2nd column: int, activity numbers; 3rd - 563rd columns: num, measurement data.

* subject_test
-- data.frame: 2947 obs. of  1 variable: 1st column(subjects): int, subjects from "subject_test.txt"
	
* X_test
-- data.frame: 2947 obs. of  561 variables: 1st - 561st columns: num, data from "X_test.txt"

* y_test
-- data.frame: 2947 obs. of  1 variable: 1st column: activity numbers from "y_test.txt"

* data_test
-- data.frame: 2947 obs. of  563 variables: 1st column: int, subject numbers; 2nd column(activities): int, activity numbers; 3rd - 563rd columns: num, measurement data.

* data_merge
-- combination of data_train and data_test

* features
-- data.frame: 561 obs. of  2 variables: 1st column: int, ordinal; 2nd column: chr, feature names from "features.txt".

* col_mean: position numbers indicate item whose name includes "mean()" in the second column of the features

* col_std: int [1:33]
-- position numbers indicate item whose name includes "std()" in the second column of the features.

* data_std
-- data.frame: 10299 obs. of  33 variables: selecting columns from data_merge by col_std.

* data_mean_std
--data.frame: 10299 obs. of  68 variables

* activity_labels
-- data.frame: 6 obs. of  2 variables

* data_activity_names: merges mean_std and activity_labels to obtain a data set with descriptive activity names.

* data_set
-- data.frame: 10299 obs. of  68 variables: labels and re-arranges variables in the data set of data_activity_names

* tidy_data_set
-- data.frame: 180 obs. of  68 variables: tidy data set with the average of each variable for each activity and each subject.


