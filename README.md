# Human-Activity-Recognition-Using-Smartphones-Data-Set

## Overview

The repository includes the following files:
- README.md
- Cookbook.md: A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.
- run_analysis.R: A script for performing the analysis.
- tidy_data.txt: A tidy data set after performing the analysis.

This R script performs the following steps, as per the project assignment instructions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How to download "UCI HAR Dataset"
This script assumes that you have already downloaded and unzipped the original Samsung data in a folder called "UCI HAR Dataset". If this is not the case, you must first run the script called `run_analysis.R`. In your R enviroment, load it:

```
source('run_analysis.R')
downloadData()
```
This will download the "UCI HAR Dataset" and unzip it. Now everything is ready for the analysis.

## How to run the analysis
In your R enviroment (in the same folder where the data files are), load the script:

```
source('run_analysis.R')
MakeTidyData()
or
MakeTidyData("tidyData.txt")
```

Default filename is called "tidy_data.txt" if there is no argument specified in MakeTidyData()

## Output of the analysis
