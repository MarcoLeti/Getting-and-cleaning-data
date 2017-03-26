# Coursera Peer-graded assignment - Getting and cleaning data - Week 4
# Author: Marco Letico

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Create the directory, download the file and unzip it
if(!exists("myDir")){dir.create("myDir")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./myDir/myZip.zip")
setwd("./myDir")
unzip(zipfile = "myZip.zip")

# Read the data
trainingFileMeas <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingFileAct <- read.table("./UCI HAR Dataset/train/y_train.txt")
testFileMeas <- read.table("./UCI HAR Dataset/test/X_test.txt")
testFileAct <- read.table("./UCI HAR Dataset/test/y_test.txt")
featuresFile <- read.table("./UCI HAR Dataset/features.txt")
activityNameFile <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
joinTrainTestMeas <- rbind(trainingFileMeas, testFileMeas)
joinTrainTestAct <- rbind(trainingFileAct, testFileAct)


# Set the column name as the ones in the features file
names(joinTrainTestMeas) <- featuresFile$V2


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
joinTrainTestMeas2 <- joinTrainTestMeas[, grepl("std()",names(joinTrainTestMeas))
                                | grepl("mean()",names(joinTrainTestMeas))
                                & !grepl("meanFreq()",names(joinTrainTestMeas))]


# 4. Appropriately labels the data set with descriptive variable names.
names(joinTrainTestMeas2) <- sub("mean", "Mean", names(joinTrainTestMeas2))
names(joinTrainTestMeas2) <- sub("std", "StdDev", names(joinTrainTestMeas2))
names(joinTrainTestMeas2) <- sub("\\(\\)", "", names(joinTrainTestMeas2))
names(joinTrainTestMeas2) <- sapply(names(joinTrainTestMeas2), function(x) {
        if(substr(x,1,1) == "t"){
                x <- paste("Time", substr(x,2,nchar(x)), sep = "")
        } else if (substr(x,1,1) == "f"){
                x <- paste("Freq", substr(x,2,nchar(x)), sep = "")
        }
        })

# 3. Uses descriptive activity names to name the activities in the data set
# Merge file activity with the activity name
activityFileNamed <- merge(joinTrainTestAct, activityNameFile)

# ...and add it to the file previously created
myData <- cbind(activityFileNamed$V2, joinTrainTestMeas2)

# Rename also the column with the name of the activities
names(myData)[1] <- "ActivityName"


# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
myDataMean <- aggregate(myData[,2:length(names(myData))], list(myData$ActivityName), mean)

# Create two new files (point 3 and point 5) in the working directory
write.table(myData, file = "myData.txt")
write.table(myDataMean, file = "myDataMean.txt")
