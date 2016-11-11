#needed packages
library(data.table)
library(reshape2)
library(knitr)
library(markdown)
#set directory
path<-setwd("~/DataScientist Kurs")
path
#downlaod and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "UCIHARDataset.zip")
unzip(zipfile="./UCIHARDataset.zip",exdir=path)
#set new directory
pathIn<-file.path(path, "UCI HAR Dataset")
list.files(pathIn, recursive=TRUE)

#read in train data
subjecttrain<-read.table(file.path(pathIn, "train","subject_train.txt"),header=FALSE)
activitytrain<-read.table(file.path(pathIn, "train","Y_train.txt"), header=FALSE)
featuretrain<-read.table(file.path(pathIn, "train","X_train.txt"), header=FALSE)

#read in test data
subjecttest<-read.table(file.path(pathIn, "test","subject_test.txt"), header=FALSE)
activitytest<-read.table(file.path(pathIn, "test","Y_test.txt"), header=FALSE)
featuretest<-read.table(file.path(pathIn, "test", "X_test.txt"), header=FALSE)

#read in features and activity
feature<-read.table(file.path(pathIn, "features.txt"))
activity<-read.table(file.path(pathIn, "activity_labels.txt"), header=FALSE)

#Merge training and test data set
subject<-rbind(subjecttrain, subjecttest)
activities<-rbind(activitytrain, activitytest)
features<-rbind(featuretrain, featuretest)

#give column names
colnames(features)<-t(feature[2])
#add colums for activity and subject in Activity and Subject table
colnames(activities)<-"activity"
colnames(subject)<-"subject"

#combine all data to one table
data<-cbind(features, activities, subject)

#Extraction of measurments with only mean and SD 
meansandsd<- grep("mean\\(\\)|std\\(\\)", names(data))
activitysub<-c(meansandsd, 562,563)
extract<-tidydata[,activitysub]

#use descriptive activity names
extract$activity<-as.character(extract$activity)
for (i in 1:6){extract$activity[extract$activity==i]<-as.character(activity[i,2])}
extract$activity<-tolower(extract$activity)
extract$activity<-as.factor(extract$activity)

#change labels
#all letter to lower case
names(extract)<-tolower(names(extract))
#remove all double bodies
names(extract)<-gsub("bodybody", "body", names(extract))
#remove ()
names(extract)<-gsub("\\(|\\)", "", names(extract))
#remove "-"
names(extract)<-gsub("-", "", names(extract))

#set subject as factor and transform extract to data table
extract$subject<-as.factor(extract$subject)
extract<-data.table(extract)

#calculate the average for each activity and subject
tidydata<-aggregate(.~subject+activity, extract, mean)
#order data
tidydata<-tidydata[order(tidydata$subject, tidydata$activity),]

#write tidy data into txt file
write.table(tidydata, file="tidydata.txt")
