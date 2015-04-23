setwd("~/Coursera/Getting and cleaning data/data/assignment")

# source for the data set, downloaded if necessary
dataset.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

#installs packages (if necessary) and load libraries
install.packages("plyr")
install.packages("dplyr")
install.packages("tidyr")
library(plyr)
library(dplyr)
library(tidyr)

#reads training and test data
x_test<-read.table("X_test.txt")
x_train<-read.table("X_train.txt")

y_test<-read.table("Y_test.txt")
y_train<-read.table("Y_train.txt")

subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")


#merges this data sets in one data set
x_data<-rbind(x_test, x_train) #columns are features
y_data<-rbind(y_test, y_train)  #columns are activity labels
subject_data<-rbind(subject_test, subject_train) #the subject who performed the activity for each window sample

#uses descriptive activity names in Activity column

for(i in 1:nrow(y_data)){
  if(y_data[i,1]==1)
    y_data[i,1]<-"Walking"
  else if (y_data[i,1]==2)
    y_data[i,1]<-"Walking upstairs"
  else if (y_data[i,1]==3)
    y_data[i,1]<-"Walking downstairs"
  else if (y_data[i,1]==4)
    y_data[i,1]<-"Sitting"
  else if (y_data[i,1]==5)
    y_data[i,1]<-"Standing"
  else if (y_data[i,1]==6)
    y_data[i,1]<-"Laying"    
}


#reads activity labels and features
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")

###
#Add features to x_data
colnames(x_data)<-features[,2]
#Merges the training and the test sets to create one data set
big_data<-cbind(subject_data, y_data, x_data)
#adding names to the first 2 columns of big_data 
colnames(big_data)[1]<-"Subject"
colnames(big_data)[2]<-"Activity"
#for making valid names since column names contain mean() and std() which are reserved for functions
valid_column_names <- make.names(names=names(big_data), unique=TRUE, allow_ = TRUE)
names(big_data) <- valid_column_names

#Extracts only the measurements on the mean and standard deviation for each measurement
extracted_data<-select(big_data, contains("Subject"), contains("Activity"), contains("mean.."), contains("std.."))
#arranges table per subject and activity name alphabeticaly
tidy_data <- arrange(extracted_data, Subject, Activity) 

#renaming column names
names(tidy_data) <- gsub("mean...", "mean", names(tidy_data))
names(tidy_data) <- gsub("std...", "StdDev", names(tidy_data))
names(tidy_data) <- gsub("std..", "StdDev", names(tidy_data))
names(tidy_data) <- gsub("X", "-X", names(tidy_data))
names(tidy_data) <- gsub("Y", "-Y", names(tidy_data))
names(tidy_data) <- gsub("Z", "-Z", names(tidy_data))

#creates .txt file with tidy data
write.table(tidy_data, file="tidy_data.txt", sep=",", row.names=FALSE)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
summarized_data <- group_by(tidy_data, Subject, Activity) %>% summarise_each(funs(mean))

#creates .txt file with summarized data
write.table(summarized_data, file="summarized_data.txt", sep=",", row.names=FALSE)

View(tidy_data)

