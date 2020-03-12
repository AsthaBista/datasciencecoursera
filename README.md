## Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Review criteria
1. The submitted data set is tidy.
2. The Github repo contains the required scripts. 
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

## Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Code Explanation
### Preparing the data and loading packages
*Read the TXT files*
The data provided in the 'UCI HAR Dataset' folder contains a variety of data in the form of text files. These are read using the read.table command. 
```{r}
activity_labels<-read.table("activity_labels.txt")    *Contains activity names to corresponding labels*
features<-read.table("features.txt")                  *Features file,or variable names of the test or train sets*
```

*Test set (X_test) and test labels (Y_test)*
```{r}
X_test<-read.table("./test/X_test.txt")              
Y_test<-read.table("./test/y_test.txt")               
subject_test<-read.table("./test/subject_test.txt")   
```

*Train set (X_train) and training labels (Y_train)*
```{r}
X_train<-read.table("./train/X_train.txt")               
Y_train<-read.table("./train/y_train.txt")               
subject_train<-read.table("./train/subject_train.txt") 
```

It is necessary now to check the dimensions of each of the datasets so that it is easier to find the exact way the datasets are liked with each other.

*Check dimensions of datasets*
```{r}
dim(X_test)
dim(Y_test)
dim(X_train)
dim(Y_train)
dim(subject_test)
dim(activity_labels)
dim(features)
```

*View the datasets head using dplyr library*
```{r}
tbl_df(X_test)
tbl_df(Y_test)
tbl_df(X_train)
tbl_df(Y_train)
tbl_df(subject_test)
tbl_df(activity_labels)

```


## Selecting only mean and standard deviations
Now, it is necessary to specify the variables that we want to work with. Here, only the variables that contain the words 'mean' and 'standard deviation' have been selected. While selecting variables containing 'mean', the variables containing 'meanFreq' were also selected. These had to be removed, hence '\\b' was used to specify only 'mean'. 

*Selecting columns containing only mean and std excluding meanFreq using \\b*
```{r}
mean_std_features<-grep("\\bmean\\b|\\bstd\\b",features[,2])  
mean_std_features_val<-grep("\\bmean\\b|\\bstd\\b",features[,2],value = T) 
length(mean_std_features)
```

## Merge the testing and training data 
For merging the testing set and the training set, the two datasets were first prepared. The first part of this preparation, was givig proper names instead of the numbers for 'activity'. This was done by creating a lookup dataset containing activity number with corresponding names. This dataset was using to combine with the subset of testing set to create the testing tidy data used for merging. The same process was repeated for training data.

*Prepare test data*
```{r}
activityNames_test<-merge(Y_test,activity_labels)     
test<-cbind(subject_test,activityNames_test$V2,X_test[,mean_std_features])
names(test)<-c("Subject","Activity",mean_std_features_val)
```

*Prepare train data*
```{r}
activityNames_train<-merge(Y_train,activity_labels)
train<-cbind(subject_train,activityNames_train$V2,X_train[,mean_std_features])
names(train)<-c("Subject","Activity",mean_std_features_val)
```

After this, the two datasets were merged row-wise so that the training data was under the testing data.

```{r}
merge_dat<-rbind(test,train)
```

## Create description of variables 
Create a new dataset to create the descriptive variable names for each  variables so that it can programmatically generate the description. Create a new dataframe with the necessary words to describe the variables.
```{r}
variables_dat<-data.frame(Features = mean_std_features_val,Statistic = c("Mean","Standard deviation"),
                          TimeFrequency = c("Time domain","Frequency"),
                          BodyGravity = c("body","gravity"),AccGyro = c("accelerometer","gyroscope"),
                          Signal = c("jerk signal","signal"),XYZ = c("x","y","z"),
                          Mag = c("magnitude","vector"))

```

Get specific words from short form of variables
```{r}
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
```

Create a new column that concatenates the words in other columns
```{r}
VariablesInfo<-mutate(variables_dat,Description = paste(Statistic,"of",TimeFrequency,"of",
                                                        BodyGravity,AccGyro,Signal,"in",XYZ,"direction in",Mag))

```


## Averaging across groups of activity and subject
The merged dataset is now grouped according to subject and activity. This part creates a wide form of the dataset rather than the long form. The long form can be obtained by using the 'gather' command given below. After grouping the dataset according to activity and subject, the measurements in all the variable columns are averaged according to each subject and each activity. The final dataset is a tidy dataset because it fulfills the requirements of a tidy data. Each variable into consideration has a separate column. Each row is a separate combination of observation. The variables are one kind of variables so there is one table
```{r}
by_sub_act<- merge_dat %>% 
  #gather(Features, Measurement,-c(Subject,Activity)) %>%  #assemble features in a long form
  group_by(Subject,Activity) %>%
  summarise_all(funs(mean))
write.table(by_sub_act,file = "finaltidydataset.txt",row.names = FALSE)
View(by_sub_act)
head(VariablesInfo$Description)
```

