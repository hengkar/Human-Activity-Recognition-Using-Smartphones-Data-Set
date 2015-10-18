# Module 3

# load library
library(data.table)
library(reshape2)

# Download UCI HAR data set
# This might take a while to download. It is prefered to download offline
downloadData <- function() {
    # if zip file is not exist, then download from web
    if (!file.exists("UCI-HAR-Dataset.zip")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, destfile=("UCI-HAR-Dataset.zip"))
        list.files(".")
    }
    
    # unzip the file
    unzip("UCI-HAR-Dataset.zip")    
}

# read data from file
getData <- function(filename, columnname) {
    datatable <- fread(filename, col.names = columnname)
    return (datatable)
}

# read test/training data and return single data table
getDataset <- function(featureList, activityList, subject, activity, data) {
    
    # read all variable for data set (file)
    subjectTable <- getData(subject, columnname = "subjectid")
    dataTable <- getData(data, columnname = featureList$feature)
    activityTable <- getData(activity, columnname = "activityid")    
    
    # rename related column for more readable
    #names(subjectTable) <- "subjectid"
    #names(activityTable) <- "activityid"
    #names(dataTable) <- featureList$feature
    
    # added additional column activity name. Eg, sleeping, walking
    activityTable$activityname <- activityList[activityTable$activityid, ]$activityname

    # construct new data table
    dataMerge <- data.table(#id = 1:nrow(subjectTable), 
                            subjectTable,
                            activityTable,
                            dataTable
                            )
    
    return (dataMerge)
}

# merge test and training data table into single table
getMergeData <- function() {
    
    featureIDFileName <- "./UCI HAR Dataset/features.txt"
    activityFileName <- "./UCI HAR Dataset/activity_labels.txt"
    testSubjectFileName <- "./UCI HAR Dataset/test/subject_test.txt"
    testDataFileName <- "./UCI HAR Dataset/test/X_test.txt"
    testActivityFileName <- "./UCI HAR Dataset/test/Y_test.txt"
    trainSubjectFileName <- "./UCI HAR Dataset/train/subject_train.txt"
    trainDataFileName <- "./UCI HAR Dataset/train/X_train.txt"
    trainActivityFileName <- "./UCI HAR Dataset/train/Y_train.txt"    
    
    # make sure all data file exist
    if (!file.exists(featureIDFileName) || !file.exists(activityFileName) ||
        !file.exists(testSubjectFileName) || !file.exists(testDataFileName) || !file.exists(testActivityFileName) ||
        !file.exists(trainSubjectFileName) || !file.exists(trainDataFileName) || !file.exists(trainActivityFileName)) {

        stop("UCI data file not exist. Please download data file!")
    }
    
    # read feature and activity label
    featureDT <- getData(featureIDFileName, columnname = c("id", "feature"))
    activityDT <-  getData(activityFileName, columnname = c("id", "activityname"))
    
    # read test data and return signle data table
    testdata <- getDataset(featureDT, 
                           activityDT, 
                           testSubjectFileName,
                           testActivityFileName,
                           testDataFileName)
    
    # read training data and return signle data table
    traindata <- getDataset(featureDT, 
                            activityDT, 
                            trainSubjectFileName,
                            trainActivityFileName,
                            trainDataFileName)
    
    # combine both train and test data
    totalData <- rbind(traindata, testdata)
    
    return(totalData)
}

makeTidyData <- function(filename = "tidy_data.txt") {
    
    # step 1: 
    # Merges the training and the test sets to create one data set.
    mergedData <- getMergeData()

    # step 2: 
    # Extracts only the measurements on the mean and standard deviation for each measurement. 
    selectedColumns <- grep('subjectid|activityid|activityname|mean\\(\\)|std\\(\\)', names(mergedData))
    selectedData <- mergedData[ , c(selectedColumns), with = FALSE]
    
    # step 3: 
    # Uses descriptive activity names to name the activities in the data set
    # this is done during fread assign the columne name using getMergeData() and getDataset()
    
    # step 4: 
    # Appropriately labels the data set with descriptive variable names. 
    # this is done during fread assign the columne name using getMergeData() and getDataset()
    
    # step 5: 
    # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    idVars = c("subjectid", "activityid", "activityname")
    measureVars = setdiff(colnames(selectedData), idVars)
    
    dataMelt <- melt(selectedData, id=idVars, measure.vars=measureVars)
    head(dataMelt, n = 5)    
    
    tidyData <- dcast(dataMelt, activityname+subjectid ~ variable, mean)
    tidyData    
    
    write.table(tidyData, filename, row.names=FALSE)
    message("Done: Tidy data written to file ", filename)    
}



