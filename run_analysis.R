library(plyr)
library(dplyr)

## 1. Merges the training and the test sets to create one data set.
# Load the data sets
# Load training set
X_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
# Load training labels
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
# Load the data as subjects who performed the activity for each window sample
subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
names(y_train)[names(y_train) == "V1"] = "activity"
names(subject_train)[names(subject_train) == "V1"] = "subject"
# Combine by column to a training set
data_train <-  cbind(subject_train, y_train, X_train)
# Load the test set
X_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
# Load the test labels
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
# Load the data as subjects who performed the actiity for each window sample
subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
names(y_test)[names(y_test) == "V1"] = "activity"
names(subject_test)[names(subject_test) == "V1"] = "subject"
# Combine by column to a test set
data_test <- cbind(subject_test, y_test, X_test)
# Merge the training and test set to a data set named data_merge
data_merge <- rbind(data_train, data_test)
data_merge <- arrange(data_merge, subject)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# read the features file and get to know which variables are measurements for mean and sd
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
# Use grep() to search for matches for mean and std measurements
col_mean <- grep("mean()", features$V2, fixed = TRUE)
data_mean <- data_merge[, col_mean + 2]
col_std <- grep("std()", features$V2, fixed = TRUE)
data_std <- data_merge[, col_std + 2]
mean_std <- cbind(data_merge[, c(1, 2)], data_mean, data_std)


## 3. Uses descriptive activity names to name the activities in the data set
# read the activity_labels.txt
activity_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
# renamed V1 V2 to activity and activity name to activity_labels
names(activity_labels)[1:2] <- c("activity", "activity_name")
# merge mean_std, activity_labels by activity
data_activity_names <- select(merge(mean_std, activity_labels, by = "activity"), -activity)

## 4. Appropriately labels the data set with descriptive variable names. 
data_col <- cbind(data_activity_names[, 1], data_activity_names[, 68])
data_set <- cbind(data_col, data_activity_names[, 2:67])
names(data_set)[1:2] <- c("subject","activity")
names(data_set)[3:(length(col_mean) + 2)] <- features$V2[col_mean]
names(data_set)[(length(col_mean) + 3):ncol(data_activity_names)] <- features$V2[col_std]

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##    for each activity and each subject.
tidy_data_set <- aggregate(data_set, list(activity = data_set$activity, subject = data_set$subject), mean, na.rm = TRUE)
tidy_data_set <- subset(tidy_data_set[-c(3, 4)])

##  Created a text file with write.table() using row.name=FALSE 
write.table(tidy_data_set, "tidy_data_set.txt", row.names = FALSE)
