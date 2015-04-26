# Read and combine test and training raw data using rbind
x_test <- read.table("test/X_test.txt")
x_train <- read.table("train/X_train.txt")
x_all <- rbind(x_test,x_train)

# Read features data and create index containing the words (mean,std) in second column
features <- read.table("features.txt")
myvars_index <- grep("-mean\\(\\)|-std\\(\\)", features[,2], ignore.case=TRUE)

# Use the index above to select only columns with mean and std
x_all_myvars <- x_all[,myvars_index]

# Create more descriptive column names for x_all
names(x_all_myvars) <- features[myvars_index,2]
names(x_all_myvars) <- gsub("\\()", "", names(x_all_myvars))
names(x_all_myvars) <- gsub("-", "_", names(x_all_myvars))
names(x_all_myvars)<-gsub("^t", "Time", names(x_all_myvars))
names(x_all_myvars)<-gsub("^f", "Frequency", names(x_all_myvars))
names(x_all_myvars)<-gsub("Acc", "Accelerometer", names(x_all_myvars))
names(x_all_myvars)<-gsub("Gyro", "Gyroscope", names(x_all_myvars))
names(x_all_myvars)<-gsub("Mag", "Magnitude", names(x_all_myvars))
names(x_all_myvars)<-gsub("BodyBody", "Body", names(x_all_myvars))

# Read and combine test and training activity code data using rbind
y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")
y_all <- rbind(y_test,y_train)

# Read activity labels
activities <- read.table("activity_labels.txt")

# Force activity labels to lower case
activities[, 2] = tolower(as.character(activities[, 2]))

# Replace activity code with activity name
y_all[,1] = activities[y_all[,1], 2]
names(y_all) <- "Activity"

# Read and combine test and training subject data using rbind
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_all <- rbind(subject_test,subject_train)
names(subject_all) <- "Subject_ID"

# Combine desired columns using cbind
tidy_data <- cbind(x_all_myvars,y_all,subject_all)

# Add dplyr library to use functions group_by and summarise_each for final summary
library("dplyr")
tidy_data2 <- summarise_each(group_by(tidy_data,Subject_ID,Activity),funs(mean))

write.table(tidy_data2, file="tidy_data.txt", row.name=FALSE)
