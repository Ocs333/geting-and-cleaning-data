#Coursera John Hopkins Data Science Track - Getting and Cleaning Data
#Course Project 2015-02-22
#This script makes a tidy, aggregated version of the UCI HAR Dataset

#First we need a working directory which includes the extracted UCI HAR dataset folder
setwd("C:/Users/Ocs/Documents/Coursera/Data Science track/3. Getting and cleaning data/")


#We read all relevant data into R
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activities<-read.table("UCI HAR Dataset/activity_labels.txt")

#We merge the names of the activities to the variable which includes the order of these tasks
y2test<-merge(y_test,activities)
y2train<-merge(y_train,activities)

#Then we "vertically merge the subject and the now labeled task IDs and the main data
test<-cbind(subject_test,y2test[,2],X_test)
train<-cbind(subject_train,y2train[,2],X_train)

#We clean the environment to avoid memory problems
rm(subject_test,y_test,X_test,subject_train,y_train,X_train, y2test, y2train, activities)

#The labels for our variables is contained in the features item
#We also add column names for the first and second columns, making a vector of varlabels
#We add these label to the to distinct datatables
labels<-c("Subject","Activity",as.character(features[,2]))
rm(features)
colnames(test)<-labels
colnames(train)<-labels

#We merge the two tables, and make them into a data.fram
data<-rbind(test,train)
data<-as.data.frame(data)

#We make a vector of te needed variables, which includes the two IDS
# and all variables containing the words mean or std (so meanFreq vars are included)
neededvars<-sort(c(1,2,grep("mean",labels),grep("std",labels)))
labels[neededvars]

#We keep just the relevant variables
data<-data[,neededvars]

#And finally we aggregate by subject and task, taking the mean of all variables
require(reshape2)
data_melt <- melt(data2, id = c("Subject", "Activity"))
data_aggr<-dcast(df_melt, Subject + Activity ~ variable, mean)
rm(data_melt)

#We check what we made
head(data_aggr[,1:5])

#And export the data into a text file
write.table(x=data_aggr, file="UCIHAR_data_aggr.txt", row.names=FALSE)

#Finally we also check if the export was succesful
data3 <- read.table("UCIHAR_data_aggr.txt", header = TRUE) 
View(data3)
