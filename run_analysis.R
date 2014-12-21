## This is the R script for the Coursera "Getting and Cleaning Data" Course Project. Please
## See the accompanying read me and code book documents for details. Set your working directory
## To the folder containing the "UCHI HAR Dataset" folder

## Load the "dplyr" package. If it doesn't exist, an error is produced
    require(dplyr)
    
##  Step 1 : Munging the "test" data (these steps are identical for the "train" data)
  ## Set the working directory for the "test" folder
    setwd("UCI HAR Dataset/test")
  ## Load the three "test" files
    test_data <- read.table("X_test.txt")
    test_labels <- read.table("Y_test.txt")
    test_subject <- read.table("subject_test.txt")
  ## Change the working directory, load the activity labels file and the features file
    setwd("../")
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
  ## Use the features vector as column names for test_data
    colnames(test_data) <- features$V2
  ## Match "activity_labels" to "test_labels" using dplyr - inner_join()
  ## NOTE: the order is maintained for later merging (using merge() will reshuffle the order)
    test_labels_f <- inner_join(test_labels, activity_labels, by="V1")
  ## Attach the "test_labels_f$V2" vector to the "test_data" data frame
    test_data$activity <- test_labels_f$V2
  ## Attach the subject list to the "test_data" data frame
    test_data$subject <- test_subject$V1
  ## Convert the "test_data" data frame into a dplyr data frame
    test_data_f <- tbl_df(test_data)
    
##  Step 2 : Munging the "train" data (these steps are identical for the "test" data)
  ## Set the working directory for the "train" folder
    setwd("train")
  ## Load the three "train" files
    train_data <- read.table("X_train.txt")
    train_labels <- read.table("Y_train.txt")
    train_subject <- read.table("subject_train.txt")
  ## Use the features vector as column names for train_data
    colnames(train_data) <- features$V2
  ## Match "activity_labels" to "train_labels" using dplyr - inner_join()
  ## NOTE: the order is maintained for later merging (using merge() will reshuffle the order)
    train_labels_f <- inner_join(train_labels, activity_labels, by="V1")
  ## Attach the "train_labels_f$V2" vector to the "train_data" data frame
    train_data$activity <- train_labels_f$V2
  ## Attach the subject list to the "train_data" data frame
    train_data$subject <- train_subject$V1
  ## Convert the "train_data" data frame into a dplyr data frame
    train_data_f <- tbl_df(train_data)

## Step 3 : Bind the test and train data together using rbind
    merge_data <- rbind(test_data_f, train_data_f)

## Step 4 : select columns only containing "std" or "mean" (case insensitive)
  ## Use grep to create a vector of column names containing "mean" or "std".
  ## Note, this is not case sensitive and includes the "subject" and "activity" columns
    mean_std_grep <- grep("mean|std|subject|activity", colnames(merge_data), ignore.case=TRUE)
  ## Use the "mean_std_grep_ vector to select columns from "merge_data" using subet
    mean_std_merge_data <- subset(merge_data, select = mean_std_grep)

## Step 5: Create summary table of averages of all data for both activity and subject 
  ## Use dplyr to group the data frame by both subject and activity
    mean_std_merge_data_group <- group_by(mean_std_merge_data, subject, activity)
  ## Use dplyr to create a new table of the mean of all variables
    summary_table <- summarise_each(grouped, funs(mean))
  ## Change the "subject" column from class factor to class numeric for sorting
    summary_table$subject <- as.character(summary_table$subject)
    summary_table$subject <- as.numeric(summary_table$subject)
  ## Use dplyr to arrange the table first by subject, then by activity
    arranged_table <- arrange(summary_table, subject, activity)
  ## Export the table using write.table
    setwd("../")
    write.table(arranged_table, "tidy_data.txt", row.name=FALSE)
    
    
    