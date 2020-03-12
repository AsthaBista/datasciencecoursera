## --------------------------- Preparing the data and loading packages--------------------------------------
library(dplyr)
library(tidyr)

#Set a working directory
setwd("C:/Users/Aastha/Desktop/datasciencecoursera/DataScience/Projects/GettingCleaningData/UCI HAR Dataset")

##Read the TXT files
activity_labels<-read.table("activity_labels.txt")    #Contains activity names to corresponding labels
features<-read.table("features.txt")                  #Features file,or variable names of the test or train sets

## Test
X_test<-read.table("./test/X_test.txt")               #Testing set
Y_test<-read.table("./test/y_test.txt")               #Testing labels
subject_test<-read.table("./test/subject_test.txt")   

## Train
X_train<-read.table("./train/X_train.txt")               #Training set
Y_train<-read.table("./train/y_train.txt")               #Training labels
subject_train<-read.table("./train/subject_train.txt") 

## Check dimensions of datasets
dim(X_test)
dim(Y_test)
dim(X_train)
dim(Y_train)
dim(subject_test)
dim(activity_labels)
dim(features)

## View the datasets head using dplyr library
tbl_df(X_test)
tbl_df(Y_test)
tbl_df(X_train)
tbl_df(Y_train)
tbl_df(subject_test)
tbl_df(activity_labels)

## ----------------------Part 3:Selecting only mean and standard deviations--------------------------------------
## Selecting columns containing only mean and std excluding meanFreq using \\b
mean_std_features<-grep("\\bmean\\b|\\bstd\\b",features[,2])  
mean_std_features_val<-grep("\\bmean\\b|\\bstd\\b",features[,2],value = T) 
length(mean_std_features)


## ----------------------Part 1:Merge the testing and training data --------------------------------------
## Prepare test data
activityNames_test<-merge(Y_test,activity_labels)     #Use descriptive names for activity (Part 3)
test<-cbind(subject_test,activityNames_test$V2,X_test[,mean_std_features])
names(test)<-c("Subject","Activity",mean_std_features_val)

# Prepare train data
activityNames_train<-merge(Y_train,activity_labels)
train<-cbind(subject_train,activityNames_train$V2,X_train[,mean_std_features])
names(train)<-c("Subject","Activity",mean_std_features_val)

## Merge test and train datasets rowwise
merge_dat<-rbind(test,train)

## ---------------------------------Part 4 ---------------------------------------------------------
## Create a new dataset to create the descriptive variable names for each 
## variables so that it can programmatically generate the description
## Create a new dataframe with the necessary words to describe the variables
variables_dat<-data.frame(Features = mean_std_features_val,Statistic = c("Mean","Standard deviation"),
                          TimeFrequency = c("Time domain","Frequency"),
                          BodyGravity = c("body","gravity"),AccGyro = c("accelerometer","gyroscope"),
                          Signal = c("jerk signal","signal"),XYZ = c("x","y","z"),
                          Mag = c("magnitude","vector"))

## Get specific words from short form of variables
variables_dat[which(grepl("mean",variables_dat[,1])),2] = "Mean"
variables_dat[which(grepl("\\bstd\\b",variables_dat[,1])),2] = "Standard deviation"
variables_dat[which(grepl("\\bt",variables_dat[,1])),3] = "Time domain"
variables_dat[which(grepl("\\bf",variables_dat[,1])),3] = "Frequency"
variables_dat[which(grepl("Body",variables_dat[,1])),4] = "body"
variables_dat[which(grepl("Gravity",variables_dat[,1])),4] = "gravity"
variables_dat[which(grepl("Acc",variables_dat[,1])),5] = "accelerometer"
variables_dat[which(grepl("Gyro",variables_dat[,1])),5] = "gyroscope"
variables_dat[which(grepl("Jerk",variables_dat[,1])),6] = "jerk signal"
variables_dat[which(!grepl("Jerk",variables_dat[,1])),6] = "signal"
variables_dat[which(grepl("X",variables_dat[,1])),7] = "x"
variables_dat[which(grepl("Y",variables_dat[,1])),7] = "y"
variables_dat[which(grepl("Z",variables_dat[,1])),7] = "z"
variables_dat[which(grepl("mag",variables_dat[,1])),8] = "magnitude"
variables_dat[which(!grepl("mag",variables_dat[,1])),8] = "vector"

head(variables_dat)
class(variables_dat)
## Create a new column that concatenates the words in other columns
VariablesInfo<-mutate(variables_dat,Description = paste(Statistic,"of",TimeFrequency,"of",
                                                        BodyGravity,AccGyro,Signal,"in",XYZ,"direction in",Mag))

## --------------------------Part 5---------------------------------------------------------------
## The merged dataset is now grouped according to subject and activity
## This part creates a wide form of the dataset rather than the long form
## The long form can be obtained by using the 'gather' command given below
## After grouping the dataset according to activity and subject, the measurements
## in all the variable columns are averaged according to each subject and each activity
## The final dataset is a tidy dataset because it fulfills the requirements of a tidy data
## Each variable into consideration has a separate column
## Each row is a separate combination of observation
## The variables are one kind of variables so there is one table
by_sub_act<- merge_dat %>% 
  #gather(Features, Measurement,-c(Subject,Activity)) %>%  #assemble features in a long form
  group_by(Subject,Activity) %>%
  summarise_all(funs(mean))
View(by_sub_act)
head(VariablesInfo$Description)
