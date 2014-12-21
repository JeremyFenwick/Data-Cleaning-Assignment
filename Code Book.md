This is the included code book for understanding the "tidy_data.txt" data set and the "arranged_table" data frame produced
by the "run_analysis.R" script.

The ouput text file and output data frame include the following:

1. A column named "subject" which designates the participant, 1-30 (there are 30 total participants)

2. A column named "activity", of which there are 6. These are actions taken by participants with their Samsung Galaxy S2
which gyroscope data was being recorded:

  WALKING
  
  WALKING_UPSTAIRS
  
  WALKING_DOWNSTAIRS
  
  SITTING
  
  STANDING
  
  LAYING

3. The remaining 86 columns are the average (mean), by subject and by activity, of means and standard deviations of the below.

Each column name starts with the type of the gyroscope data. These column names match the supplied documents, for easy cross
referencing:

  tBodyAcc-XYZ
  
  tGravityAcc-XYZ
  
  tBodyAccJerk-XYZ
  
  tBodyGyro-XYZ
  
  tBodyGyroJerk-XYZ
  
  tBodyAccMag
  
  tGravityAccMag
  
  tBodyAccJerkMag
  
  tBodyGyroMag
  
  tBodyGyroJerkMag
  
  fBodyAcc-XYZ
  
  fBodyAccJerk-XYZ
  
  fBodyGyro-XYZ

  fBodyAccMag
  
  fBodyAccJerkMag
  
  fBodyGyroMag
  
  fBodyGyroJerkMag

The column names then end with the variables estimated from the above gyroscope data:

  mean(): Mean value
  
  std(): Standard deviation
  
  meanFreq(): Weighted average of the frequency components to obtain a mean frequency
  
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

  gravityMean
  
  tBodyAccMean
  
  tBodyAccJerkMean
  
  tBodyGyroMean
  
  tBodyGyroJerkMean



  
