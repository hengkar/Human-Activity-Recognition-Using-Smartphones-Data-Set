
# CodeBook
Code book below describes the variables, the observation data, and clean up the data called ["tidy_data.txt"](tidy_data.txt)

# Introduction
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'Feature Selection' for more details. 

# Observation Data
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Variables
### Activity
| id |              name |
|---:|:-----------------:|
|  1 |           WALKING|
|  2 |  WALKING_UPSTAIRS|
|  3 | WALKING_DOWNSTAIRS|
|  4|            SITTING|
|  5|           STANDING|
|  6|            LAYING|

### Subject
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

### Feature Selection
Column numbers are extracted from the original data file, `UCI HAR Dataset/features.txt`

| feature column number | feature column name |
|----------------------:|:--------------------:|
|   1| tBodyAcc-mean()-X |
|   2| tBodyAcc-mean()-Y |
|   3| tBodyAcc-mean()-Z |
|   4| tBodyAcc-std()-X |
|   5| tBodyAcc-std()-Y |
|   6| tBodyAcc-std()-Z |
|  41| tGravityAcc-mean()-X |
|  42| tGravityAcc-mean()-Y |
|  43| tGravityAcc-mean()-Z |
|  44| tGravityAcc-std()-X |
|  45| tGravityAcc-std()-Y |
|  46| tGravityAcc-std()-Z |
|  81| tBodyAccJerk-mean()-X |
|  82| tBodyAccJerk-mean()-Y |
|  83| tBodyAccJerk-mean()-Z |
|  84| tBodyAccJerk-std()-X |
|  85| tBodyAccJerk-std()-Y |
|  86| tBodyAccJerk-std()-Z |
| 121| tBodyGyro-mean()-X |
| 122| tBodyGyro-mean()-Y |
| 123| tBodyGyro-mean()-Z |
| 124| tBodyGyro-std()-X |
| 125| tBodyGyro-std()-Y |
| 126| tBodyGyro-std()-Z |
| 161| tBodyGyroJerk-mean()-X |
| 162| tBodyGyroJerk-mean()-Y |
| 163| tBodyGyroJerk-mean()-Z |
| 164| tBodyGyroJerk-std()-X |
| 165| tBodyGyroJerk-std()-Y |
| 166| tBodyGyroJerk-std()-Z |
| 201| tBodyAccMag-mean() |
| 202| tBodyAccMag-std() |
| 214| tGravityAccMag-mean() |
| 215| tGravityAccMag-std() |
| 227| tBodyAccJerkMag-mean() |
| 228| tBodyAccJerkMag-std() |
| 240| tBodyGyroMag-mean() |
| 241| tBodyGyroMag-std() |
| 253| tBodyGyroJerkMag-mean() |
| 254| tBodyGyroJerkMag-std() |
| 266| fBodyAcc-mean()-X |
| 267| fBodyAcc-mean()-Y |
| 268| fBodyAcc-mean()-Z |
| 269| fBodyAcc-std()-X |
| 270| fBodyAcc-std()-Y |
| 271| fBodyAcc-std()-Z |
| 345| fBodyAccJerk-mean()-X |
| 346| fBodyAccJerk-mean()-Y |
| 347| fBodyAccJerk-mean()-Z |
| 348| fBodyAccJerk-std()-X |
| 349| fBodyAccJerk-std()-Y |
| 350| fBodyAccJerk-std()-Z |
| 424| fBodyGyro-mean()-X |
| 425| fBodyGyro-mean()-Y |
| 426| fBodyGyro-mean()-Z |
| 427| fBodyGyro-std()-X |
| 428| fBodyGyro-std()-Y |
| 429| fBodyGyro-std()-Z |
| 503| fBodyAccMag-mean() |
| 504| fBodyAccMag-std() |
| 516| fBodyBodyAccJerkMag-mean() |
| 517| fBodyBodyAccJerkMag-std() |
| 529| fBodyBodyGyroMag-mean() |
| 530| fBodyBodyGyroMag-std() |
| 542| fBodyBodyGyroJerkMag-mean() |
| 543| fBodyBodyGyroJerkMag-std() |

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

# Summaries
Below are the code for R to generate [tidy_data.txt](tidy_data.txt)

```
source("./run_analysis.R")
makeTidyData()
tidyData<-fread("tidy_data.txt")
summary(tidyData)
```
