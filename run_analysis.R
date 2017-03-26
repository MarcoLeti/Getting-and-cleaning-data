# Coursera Peer-graded assignment - Getting and cleaning data - Week 4
# Author: Marco Letico

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Create the directory, download the file and unzip it
library(dplyr)
library(data.table)
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
subjectTrainFile <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTestFile <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# 1. Merges the training and the test sets to create one data set.
joinTrainTestMeas <- rbind(trainingFileMeas, testFileMeas)
joinTrainTestAct <- rbind(trainingFileAct, testFileAct)
joinSubject <- rbind(subjectTrainFile, subjectTestFile)


# Set the column name
names(joinTrainTestMeas) <- featuresFile$V2
names(joinSubject) <- "SubjectId"
names(joinTrainTestAct) <- "ActivityId"
names(activityNameFile) <- c("ActivityId", "ActivityName")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
joinTrainTestMeas2 <- joinTrainTestMeas[, grepl("std()",names(joinTrainTestMeas))
                                | grepl("mean()",names(joinTrainTestMeas))
                                & !grepl("meanFreq()",names(joinTrainTestMeas))]


# 4. Appropriately labels the data set with descriptive variable names.
names(joinTrainTestMeas2) <- sub("mean", "Mean", names(joinTrainTestMeas2))
names(joinTrainTestMeas2) <- sub("std", "StdDev", names(joinTrainTestMeas2))
names(joinTrainTestMeas2) <- sub("BodyBody", "Body", names(joinTrainTestMeas2))
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
#activityFileNamed <- merge(joinTrainTestAct, activityNameFile, by = "V1", sort = FALSE)
activityAndMeas <- cbind(joinTrainTestAct, joinTrainTestMeas2)
activitySubjFile <- cbind(joinSubject, activityAndMeas)
activityFileNamed <- merge(activitySubjFile, activityNameFile, by = "ActivityId")

#reorder the columns and remove the column with the activityId
myData <- select(activityFileNamed, 2, 69, 3:68)

write.table(myData, file = "myData.txt", row.names = FALSE)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
myDataMean <- aggregate(myData[,3:length(names(myData))], by = list(Subject = myData$SubjectId,
                                                                    Activity = myData$ActivityName), mean)

# Create a new file (point 5) in the working directory
write.table(myDataMean, file = "myDataMean.txt", row.names = FALSE)
