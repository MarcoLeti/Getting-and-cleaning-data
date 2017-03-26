# Getting-and-cleaning-data
This repository is created for the course in Data Science provided by coursera, in particular for the peer-review assignment of the Week 4.

The assignment requires that the following 5 points are completed:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The repository contains 4 files:
1. README.md: describing the repository and giving some preliminary information of the analysis done
2. CodeBook.md: containing the description of the variables of the files created from the script
3. run_analysis.R: containing the script I developed in R to clean the required dataset.
4. myDataMean.txt: is the dataset created by the script and required by the point 5 of the coursera assignment

In general, a dataset is tidy when complies with the following 3 rules:
1. Each variable forms a column,
2. Each observation forms a row,
3. Each type of observational unit forms a table.

As you can see on the resulting scripts, they respect the 3 rules for a clean dataset.

The original dataset could be found at the following url:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Where you can also finda complete description of the purpose of the research.

Marco Letico
