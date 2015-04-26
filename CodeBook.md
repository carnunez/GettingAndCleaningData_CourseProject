# Course Project Code Book
According to the instructions listed on the course project website found here:

https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3/submissions

This file will describe data, variables and any transformations done upon the data to complete the project.

#DATA

The raw data can be located at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and the main reference in processing this data is located at the following URL:

https://class.coursera.org/getdata-012/forum/thread?thread_id=9

Both the "test" and "train" folders consisted of three files. A "subject" file (contain the ID number of the individual
performing the activity), an "X" file (containing the actual data measurements) and a "Y" file (identifying which of the six
activities was being performed at time of measurement). The three files in both the "test" and "train" folders were joined 
together to create a complete training + test dataset.

#VARIABLES

The "Subject" and "Y" files in both the "train" and "test" folders were given the variable names "Subject_ID" and "Activity",
respectively. A file named "features.txt" was located one file level up in the directory and was used as a starting point for
the variable names for each column of the "X" file. The final, tidy dataset including only those variable names that included
"mean" or "std" in the string. Finally, the variable names were cleaned up by removing parenthesis in the names, removing 
redudant titles, etc.

#DATA TRANSFORMATION

After reading in the three files ("Subject", "X", and "Y") in both folders and storing them in variables, assignment of 
variable names began with the train+test data using the rbind function. Whereas the "Y" file consisted of an integer between
one and six, those numbers were cross-referenced with a vector created by reading in the "activity_labels.txt" file and were 
replaced by the corresponding string.

The "features.txt" file was used in assigning names to the "X" files of both train and test data. The variable names were 
cleaned and reformatted as detailed in the "VARIABLES" section. After naming the single column of the "Y" and "Subject" data,
the three train+test files ("Subject","Y" and "X") were combined using the cbind function, resulting in the required dataset
("tidy_data"). To extract all measurements that had "mean" or "std" in their variable name, the grep function was used in a 
case-insensitive manner.

The results from the mean and standard deviation search were stored separately and combined with the "Activity" and 
"Subject_ID" of the original dataset using the cbind function. To calculate the mean of each variable (column name) for each
subject and activity, the "group_by" and "summarise_each" functions were used. The final step was to write this dataset to a
file named "tidy_data.txt" using the "write_table" function.
