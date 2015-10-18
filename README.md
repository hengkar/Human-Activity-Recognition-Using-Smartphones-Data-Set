# Human-Activity-Recognition-Using-Smartphones-Data-Set

## Overview
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The repository includes the following files:
- README.md
- Cookbook.md: A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.
- run_analysis.R: A script for performing the analysis.
- tidy_data.txt: A tidy data set after performing the analysis.

## How to download "UCI HAR Dataset"
The data sets here are based on UCI study that recorded smartphones gyroscope and accelerometer measurements during known activities. Refer to the [UCI Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project page. This script assumes that you have already downloaded and unzipped the original Samsung data in a folder called "UCI HAR Dataset". The default behavior will show error if the related dataset file is not found. To download the dataset, you must first run the script called `run_analysis.R`. In your R enviroment, load it:

```
source('run_analysis.R')
downloadData()
```
This will download the "UCI HAR Dataset" and unzip it. Now everything is ready for the analysis.

## How to run the analysis
In your R enviroment (in the same folder where the "UCI HAR Dataset" are), load the script:

```
source('run_analysis.R')
MakeTidyData()
or
MakeTidyData("tidyData.txt")
```

This R script does the following steps:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Default filename is called "tidy_data.txt" if there is no argument specified in MakeTidyData()

## Output of the analysis
The output of the analysis should be clean and tidy dataset that contain activity, subject and measures for all required features (i.e., mean or standard deviation). Each variable in the tidy dataset measure should be in one column. And each different observation of that variable should be in a different row.
