
######################################################
#        Getting and Cleaning Data 
#   Johns Hopkins - Coursera getdata-010
######################################################
#
#
suppressMessages(library(dplyr))
suppressMessages(library(tidyr))
suppressMessages(library(lubridate))
#
#
###   Read in and examine datasets
#
#
# if files are stored somewhere other than normal working directory, set it here:
#setwd("C:/Users/Rick/Desktop/Getting and Cleaning Data/^Course Project/Course Project WIP")
#

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")

#count(unique(train_labels)); count(unique(test_labels)); count(unique(features)); count(unique(activities))
#head(test_data); tail(test_data); head(train_data); tail(train_data)

#
#
######################################################
# Merge the training and the test sets to create one data set.
######################################################
#
#
###   create 'activities name' column
#
test_actnames <- data.frame()
for (i in 1:nrow(test_data)) {
  test_actnames[i,1] <- activities[test_labels[i,1],2]
  }

train_actnames <- data.frame()
for (i in 1:nrow(train_data)) {
  train_actnames[i,1] <- activities[train_labels[i,1],2]
  }

activities <- (rbind(test_actnames, train_actnames))
names(activities) <- "activity"

#
###   create 'subject' column
#

subjects <- (rbind(test_subjects, train_subjects))
names(subjects) <- "subject"

#
###   put all the pieces together
#

all_data <- rbind(test_data, train_data)
names(all_data) <- features[,2]

all_data <- cbind(subjects, activities, all_data)

#write.csv(all_data, file = "all_data.csv", row.names = FALSE)

#
#
######################################################
# Extract only the measurements on the mean and standard deviation 
# for each measurement. 
######################################################
#
#

no_dup_cols <- all_data[, unique(colnames(all_data))]

A <- grep("mean\\(\\)",colnames(no_dup_cols))
B <- grep("std\\(\\)",colnames(no_dup_cols))
C <- c(1, 2)
keepers <- features[sort(c(A, B, C)),1]

select_data <- select(no_dup_cols, keepers)

#write.csv(select_data, file = "select_data.csv", row.names = FALSE)

#
#
######################################################
# Use descriptive activity names to name the activities in the data set
######################################################
#
#

levels(select_data[,2]) <- gsub("_", "", tolower(levels(select_data[,2])))
#levels(select_data[,2])

#
#
######################################################
# Appropriately label the data set with descriptive variable names. 
######################################################
#
#

test_data <- select_data
#names(test_data)

names(test_data) <- sub("BodyBody", "Body", names(test_data))
names(test_data) <- sub("-X", "-Xaxis", names(test_data))
names(test_data) <- sub("-Y", "-Yaxis", names(test_data))
names(test_data) <- sub("-Z", "-Zaxis", names(test_data))
names(test_data) <- sub("Acc", "Accelerometer", names(test_data))
names(test_data) <- sub("Gyro", "Gyroscope", names(test_data))
names(test_data) <- sub("mean", "Mean", names(test_data))
names(test_data) <- sub("std", "StdDev", names(test_data))
names(test_data) <- sub("Mag", "Magnitude", names(test_data))
names(test_data)[3:42] <- sub("t", "timeDomain", names(test_data)[3:42])
names(test_data)[43:68] <- sub("f", "freqDomain", names(test_data)[43:68])
names(test_data) <- gsub("-", "", names(test_data))
names(test_data) <- gsub("\\(\\)", "", names(test_data))

names(select_data) <- names(test_data)
#names(test_data)

#
#
######################################################
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
######################################################
#
#
tidy_data <- 
  select_data %>%
    group_by(subject, activity)  %>%
    summarise_each(funs(mean, sd)) 

#
#
######################################################
# Create output dataset(s) for upload.
######################################################
#
#
filename <- "./var_avgs.txt"
if (file.exists(filename)) file.remove(filename)
write.table(tidy_data, filename, col.name=TRUE, row.name=FALSE)
#
#
#
# read file 'var_avgs.txt' with:
#    check_read <- read.table("./var_avgs.txt", header=TRUE, sep="")
#
#