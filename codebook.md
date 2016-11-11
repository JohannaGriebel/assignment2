# Code book


This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

# Overview
30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

# Explanation of each file

* features.txt: Names of the 561 features.
* activity_labels.txt: Names and IDs for each of the 6 activities.
* X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
* y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
* X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
* y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

# Processing steps

All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
All feature columns were removed that did not contain the exact string mean() or std(). This left 66 feature columns, plus the subjectID and activity columns.
The activity column was converted from a integer to a factor, using labels describing the activities.
A tidy data set was created containing the mean of each feature for each subject and each activity. 
Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. 
Since there are 30 subjects, there are a total of 180 rows.
The tidy data set was output to a txt file.

# Variables

Original label can be found in label features.txt. For simpflication of future analysis all letters were set to lower cases and special characters have been deleted. 
t respresents time and freq represents frequency.


* subject 
* activity 
* tbodyaccmeanx 
* tbodyaccmeany 
* tbodyaccmeanz 
* tbodyaccstdx 
* tbodyaccstdy 
* tbodyaccstdz 
* tgravityaccmeanx 
* tgravityaccmeany 
* tgravityaccmeanz 
* tgravityaccstdx 
* tgravityaccstdy 
* tgravityaccstdz 
* tbodyaccjerkmeanx 
* tbodyaccjerkmeany 
* tbodyaccjerkmeanz 
* tbodyaccjerkstdx 
* tbodyaccjerkstdy 
* tbodyaccjerkstdz 
* tbodygyromeanx 
* tbodygyromeany 
* tbodygyromeanz 
* tbodygyrostdx 
* tbodygyrostdy 
* tbodygyrostdz 
* tbodygyrojerkmeanx 
* tbodygyrojerkmeany 
* tbodygyrojerkmeanz 
* tbodygyrojerkstdx 
* tbodygyrojerkstdy 
* tbodygyrojerkstdz 
* tbodyaccmagmean 
* tbodyaccmagstd 
* tgravityaccmagmean 
* tgravityaccmagstd 
* tbodyaccjerkmagmean 
* tbodyaccjerkmagstd 
* tbodygyromagmean 
* tbodygyromagstd 
* tbodygyrojerkmagmean 
* tbodygyrojerkmagstd 
* fbodyaccmeanx 
* fbodyaccmeany 
* fbodyaccmeanz 
* fbodyaccstdx 
* fbodyaccstdy 
* fbodyaccstdz 
* fbodyaccjerkmeanx 
* fbodyaccjerkmeany 
* fbodyaccjerkmeanz 
* fbodyaccjerkstdx 
* fbodyaccjerkstdy 
* fbodyaccjerkstdz 
* fbodygyromeanx  
* fbodygyromeany 
* fbodygyromeanz 
* fbodygyrostdx 
* fbodygyrostdy 
* fbodygyrostdz 
* fbodyaccmagmean 
* fbodyaccmagstd 
* fbodyaccjerkmagmean 
* fbodyaccjerkmagstd 
* fbodygyromagmean 
* fbodygyromagstd 
* fbodygyrojerkmagmean 
* fbodygyrojerkmagstd

