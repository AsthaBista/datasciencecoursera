## Data Sources

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows

## Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Variable list and their attributes
### Variables Description

```{r desc, echo=FALSE, results='asis',warning = FALSE}
VariablesInfo[,c(1,9)]%>%
  kable("markdown", escape = F, align = "l") %>%
  kable_styling("striped", full_width = F, position = "float_right")
```
|Features             |	Description
|--------------------:|:-----------------------------------------------------------------------:|
|tBodyAcc-mean()-X|Mean of Time domain of body accelerometer signal in x direction in vector|
|tBodyAcc-mean()-Y|Mean of Time domain of body accelerometer signal in y direction in vector|
|tBodyAcc-mean()-Z|Mean of Time domain of body accelerometer signal in z direction in vector|
|tBodyAcc-std()-X|Standard deviation of Time domain of body accelerometer signal in x direction in vector|
|tBodyAcc-std()-Y|Standard deviation of Time domain of body accelerometer signal in y direction in vector|
|tBodyAcc-std()-Z|Standard deviation of Time domain of body accelerometer signal in z direction in vector|
|tGravityAcc-mean()-X|Mean of Time domain of gravity accelerometer signal in x direction in vector|
|tGravityAcc-mean()-Y|Mean of Time domain of gravity accelerometer signal in y direction in vector|
|tGravityAcc-mean()-Z|Mean of Time domain of gravity accelerometer signal in z direction in vector|
|tGravityAcc-std()-X|Standard deviation of Time domain of gravity accelerometer signal in x direction in vector|
|tGravityAcc-std()-Y|Standard deviation of Time domain of gravity accelerometer signal in y direction in vector|
|tGravityAcc-std()-Z|Standard deviation of Time domain of gravity accelerometer signal in z direction in vector|
|tBodyAccJerk-mean()-X|Mean of Time domain of body accelerometer jerk signal in x direction in vector|
|tBodyAccJerk-mean()-Y|Mean of Time domain of body accelerometer jerk signal in y direction in vector|
|tBodyAccJerk-mean()-Z|Mean of Time domain of body accelerometer jerk signal in z direction in vector|
|tBodyAccJerk-std()-X|Standard deviation of Time domain of body accelerometer jerk signal in x direction in vector|
|tBodyAccJerk-std()-Y|Standard deviation of Time domain of body accelerometer jerk signal in y direction in vector|
|tBodyAccJerk-std()-Z|Standard deviation of Time domain of body accelerometer jerk signal in z direction in vector|
|tBodyGyro-mean()-X|Mean of Time domain of body gyroscope signal in x direction in vector|
|tBodyGyro-mean()-Y|Mean of Time domain of body gyroscope signal in y direction in vector|
|tBodyGyro-mean()-Z|Mean of Time domain of body gyroscope signal in z direction in vector|
|tBodyGyro-std()-X|Standard deviation of Time domain of body gyroscope signal in x direction in vector|
|tBodyGyro-std()-Y|Standard deviation of Time domain of body gyroscope signal in y direction in vector|
|tBodyGyro-std()-Z|Standard deviation of Time domain of body gyroscope signal in z direction in vector|
|tBodyGyroJerk-mean()-X|Mean of Time domain of body gyroscope jerk signal in x direction in vector|
|tBodyGyroJerk-mean()-Y|Mean of Time domain of body gyroscope jerk signal in y direction in vector|
|tBodyGyroJerk-mean()-Z|Mean of Time domain of body gyroscope jerk signal in z direction in vector|
|tBodyGyroJerk-std()-X|Standard deviation of Time domain of body gyroscope jerk signal in x direction in vector|
|tBodyGyroJerk-std()-Y|Standard deviation of Time domain of body gyroscope jerk signal in y direction in vector|
|tBodyGyroJerk-std()-Z|Standard deviation of Time domain of body gyroscope jerk signal in z direction in vector|
|tBodyAccMag-mean()|Mean of Time domain of body accelerometer signal in x direction in vector|
|tBodyAccMag-std()|Standard deviation of Time domain of body accelerometer signal in y direction in vector|
|tGravityAccMag-mean()|Mean of Time domain of gravity accelerometer signal in z direction in vector|
|tGravityAccMag-std()|Standard deviation of Time domain of gravity accelerometer signal in x direction in vector|
|tBodyAccJerkMag-mean()|Mean of Time domain of body accelerometer jerk signal in y direction in vector|
|tBodyAccJerkMag-std()|Standard deviation of Time domain of body accelerometer jerk signal in z direction in vector|
|tBodyGyroMag-mean()|Mean of Time domain of body gyroscope signal in x direction in vector|
|tBodyGyroMag-std()|Standard deviation of Time domain of body gyroscope signal in y direction in vector|
|tBodyGyroJerkMag-mean()|Mean of Time domain of body gyroscope jerk signal in z direction in vector|
|tBodyGyroJerkMag-std()|Standard deviation of Time domain of body gyroscope jerk signal in x direction in vector|
|fBodyAcc-mean()-X|Mean of Frequency of body accelerometer signal in x direction in vector|
|fBodyAcc-mean()-Y|Mean of Frequency of body accelerometer signal in y direction in vector|
|fBodyAcc-mean()-Z|Mean of Frequency of body accelerometer signal in z direction in vector|
|fBodyAcc-std()-X|Standard deviation of Frequency of body accelerometer signal in x direction in vector|
|fBodyAcc-std()-Y|Standard deviation of Frequency of body accelerometer signal in y direction in vector|
|fBodyAcc-std()-Z|Standard deviation of Frequency of body accelerometer signal in z direction in vector|
|fBodyAccJerk-mean()-X|Mean of Frequency of body accelerometer jerk signal in x direction in vector|
|fBodyAccJerk-mean()-Y|Mean of Frequency of body accelerometer jerk signal in y direction in vector|
|fBodyAccJerk-mean()-Z|Mean of Frequency of body accelerometer jerk signal in z direction in vector|
|fBodyAccJerk-std()-X|Standard deviation of Frequency of body accelerometer jerk signal in x direction in vector|
|fBodyAccJerk-std()-Y|Standard deviation of Frequency of body accelerometer jerk signal in y direction in vector|
|fBodyAccJerk-std()-Z|Standard deviation of Frequency of body accelerometer jerk signal in z direction in vector|
|fBodyGyro-mean()-X|Mean of Frequency of body gyroscope signal in x direction in vector|
|fBodyGyro-mean()-Y|Mean of Frequency of body gyroscope signal in y direction in vector|
|fBodyGyro-mean()-Z|Mean of Frequency of body gyroscope signal in z direction in vector|
|fBodyGyro-std()-X|Standard deviation of Frequency of body gyroscope signal in x direction in vector|
|fBodyGyro-std()-Y|Standard deviation of Frequency of body gyroscope signal in y direction in vector|
|fBodyGyro-std()-Z|Standard deviation of Frequency of body gyroscope signal in z direction in vector|
|fBodyAccMag-mean()|Mean of Frequency of body accelerometer signal in y direction in vector|
|fBodyAccMag-std()|Standard deviation of Frequency of body accelerometer signal in z direction in vector|
|fBodyBodyAccJerkMag-mean()|Mean of Frequency of body accelerometer jerk signal in x direction in vector|
|fBodyBodyAccJerkMag-std()|Standard deviation of Frequency of body accelerometer jerk signal in y direction in vector|
|fBodyBodyGyroMag-mean()|Mean of Frequency of body gyroscope signal in z direction in vector|
|fBodyBodyGyroMag-std()|Standard deviation of Frequency of body gyroscope signal in x direction in vector|
|fBodyBodyGyroJerkMag-mean()|Mean of Frequency of body gyroscope jerk signal in y direction in vector|
|fBodyBodyGyroJerkMag-std()|Standard deviation of Frequency of body gyroscope jerk signal in z direction in vector|

### Variables statistics
```{r stats, echo=FALSE, results='asis',warning = FALSE}
df%>%
  kable("markdown", escape = F, align = "c") %>%
  kable_styling("striped", full_width = F, position = "float_right")
```
|Features  |class  |range                          |mean     |
|---------:|:------|:------------------------------|:-------:|
|Subject|integer|43860|Not available|
|Activity|factor|LAYING / SITTING / STANDING / WALKING / WALKING_DOWNSTAIRS / WALKING_UPSTAIRS|Not available|
|tBodyAcc-mean()-X|numeric|0.265696920582133 / 0.280179098426966|0.274378722277009|
|tBodyAcc-mean()-Y|numeric|1.56907527046463|-0.0174592634357987|
|tBodyAcc-mean()-Z|numeric|1.18751347117945|-0.108759555965253|
|tBodyAcc-std()-X|numeric|7.8139052116138|-0.628116531641857|
|tBodyAcc-std()-Y|numeric|-8.00389979538097|-0.531077288753667|
|tBodyAcc-std()-Z|numeric|11.7662594795877|-0.645181428981338|
|tGravityAcc-mean()-X|numeric|0.475323016 / 0.962581161666667|0.678986282433124|
|tGravityAcc-mean()-Y|numeric|-0.639563230792665|0.00437165306667747|
|tGravityAcc-mean()-Z|numeric|-1.19084268296511|0.0862522830540968|
|tGravityAcc-std()-X|numeric|1.0660537107642|-0.965932474569021|
|tGravityAcc-std()-Y|numeric|1.09033885805514|-0.955657999169586|
|tGravityAcc-std()-Z|numeric|1.10568733285707|-0.942014904871887|
|tBodyAccJerk-mean()-X|numeric|0.0572366455208955 / 0.0866435091149576|0.0781338863357172|
|tBodyAccJerk-mean()-Y|numeric|-0.154836002376563|0.00745449867848148|
|tBodyAccJerk-mean()-Z|numeric|-1.2663952368009|-0.00445835719514411|
|tBodyAccJerk-std()-X|numeric|5.79192675894287|-0.655474555992797|
|tBodyAccJerk-std()-Y|numeric|-241.3161181697|-0.620811588543144|
|tBodyAccJerk-std()-Z|numeric|2.5615387061011|-0.778498968509884|
|tBodyGyro-mean()-X|numeric|-9.01250099270401|-0.0314277443331586|
|tBodyGyro-mean()-Y|numeric|2.39975774669043|-0.0750307785229355|
|tBodyGyro-mean()-Z|numeric|0.0483130820040984 / 0.116262252263758|0.0884411651464207|
|tBodyGyro-std()-X|numeric|2.79413078409823|-0.734458106687966|
|tBodyGyro-std()-Y|numeric|4.55000729985692|-0.702843032448402|
|tBodyGyro-std()-Z|numeric|5.8197248756925|-0.671296781531226|
|tBodyGyroJerk-mean()-X|numeric|1.94232240754111|-0.0963073330378826|
|tBodyGyroJerk-mean()-Y|numeric|1.34510719576265|-0.0421732444424189|
|tBodyGyroJerk-mean()-Z|numeric|1.53878794699573|-0.0546759856992587|
|tBodyGyroJerk-std()-X|numeric|29.0260559499464|-0.738231058778049|
|tBodyGyroJerk-std()-Y|numeric|3.31115947259631|-0.797528693758289|
|tBodyGyroJerk-std()-Z|numeric|19.4841485610259|-0.743946293128192|
|tBodyAccMag-mean()|numeric|17.6919204899164|-0.573164969347439|
|tBodyAccMag-std()|numeric|9.317135044958|-0.612478682073373|
|tGravityAccMag-mean()|numeric|17.6919204899164|-0.573164969347439|
|tGravityAccMag-std()|numeric|9.317135044958|-0.612478682073373|
|tBodyAccJerkMag-mean()|numeric|6.44885714908681|-0.665423871597405|
|tBodyAccJerkMag-std()|numeric|11.2795951826606|-0.643511784995412|
|tBodyGyroMag-mean()|numeric|5.57699603824688|-0.627178778424688|
|tBodyGyroMag-std()|numeric|4.87369759524615|-0.678797281778759|
|tBodyGyroJerkMag-mean()|numeric|4.90721630577314|-0.771552915854204|
|tBodyGyroJerkMag-std()|numeric|4.19587499756342|-0.78673767442253|
|fBodyAcc-mean()-X|numeric|7.41755572052274|-0.64165367442999|
|fBodyAcc-mean()-Y|numeric|-9.55998699412639|-0.555873366681983|
|fBodyAcc-mean()-Z|numeric|3.60490248237916|-0.690744627758929|
|fBodyAcc-std()-X|numeric|7.79963858844421|-0.624173581092716|
|fBodyAcc-std()-Y|numeric|-16.405350847042|-0.549177658020763|
|fBodyAcc-std()-Z|numeric|16.2789582054021|-0.650619400108266|
|fBodyAccJerk-mean()-X|numeric|4.75535453216964|-0.671908038434183|
|fBodyAccJerk-mean()-Y|numeric|11.3238097793606|-0.641449794588284|
|fBodyAccJerk-mean()-Z|numeric|2.8030557883666|-0.760468338032506|
|fBodyAccJerk-std()-X|numeric|4.80056967919325|-0.669738354819862|
|fBodyAccJerk-std()-Y|numeric|-27.8725383316639|-0.624568346158114|
|fBodyAccJerk-std()-Z|numeric|2.36226826304613|-0.795403021690277|
|fBodyGyro-mean()-X|numeric|12.5089924411971|-0.683987683293618|
|fBodyGyro-mean()-Y|numeric|3.96873992680056|-0.723912908207877|
|fBodyGyro-mean()-Z|numeric|12.0321182870333|-0.657956334095578|
|fBodyGyro-std()-X|numeric|2.21836413647546|-0.752147670165863|
|fBodyGyro-std()-Y|numeric|6.52646371832452|-0.695337266051588|
|fBodyGyro-std()-Z|numeric|4.37095036860055|-0.707858800501602|
|fBodyAccMag-mean()|numeric|17.4377379164816|-0.606348685715407|
|fBodyAccMag-std()|numeric|3.55535152667638|-0.677913655026105|
|fBodyBodyAccJerkMag-mean()|numeric|13.0467080936609|-0.636889868715196|
|fBodyBodyAccJerkMag-std()|numeric|8.98240026927768|-0.655088289754967|
|fBodyBodyGyroMag-mean()|numeric|6.31025727585488|-0.710279659652349|
|fBodyBodyGyroMag-std()|numeric|2.60015508138175|-0.71557904810024|
|fBodyBodyGyroJerkMag-mean()|numeric|3.93413150693252|-0.788585447722694|
|fBodyBodyGyroJerkMag-std()|numeric|3.66986827548434|-0.800143500025055|
