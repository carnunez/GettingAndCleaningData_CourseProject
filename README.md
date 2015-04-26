# GettingAndCleaningData_CourseProject
Contains analysis script, readme.md file and codebook.md file
This is a repository for any and all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

Course Project

(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

 (1) Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder      on your local drive, say C:\Users\yourname\Documents\R\
 (2) Put run_analysis.R into C:\Users\yourname\Documents\R\UCI HAR Dataset\
 (3) In RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\"), followed by: source("run_analysis.R")
 (4) Use data <- read.table("data_set_with_the_averages.txt") to read the data. It is 180x68 because there are 30 subjects        and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has      no assumptions on numbers of records, only on locations of files.
 (5) Read in the training data set from the X_train.txt, subject_train.txt and y_train.txt files.
 (6) Obtain variable (column) names for training/test sets from the activity_labels.txt and features.txt files
 (7) Read in the test data set from X_test.txt, subject_test.txt and y_test.txt files.
 (8) Combine the data obtained in steps (7) and (5).
 (9) Extract only mean and standard deviation measurements from the dataset created in step five.
(10) Clean/format existing variable (column) names of the dataset.
(11) Calculate the average of each variable for each activity and subject.
(12) Write this dataset to a file titled "tidy_data.txt"

Additional detail of variables, data and transformations can be found in the "Codebook.md" file.
