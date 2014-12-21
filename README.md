Data-Cleaning-Assignment
========================

Greetings classmates :P

The included script "run_analysis.R" will assemble the provided Samsung phone data and output a tidy summary.

Before running the script please set your working directory using the setwd() function to the folder
containing the "UCI HAR Dataset" folder as the code is written with this assumption. Also note the "dplyr" package
is required. Please use install.packages("dplyr") before running the script, as it will output an error before running
otherwise.

The code is broken down into 5 steps:

1. Assembles the "test" data. Column names come from the included "features.txt" document. Activity labels provided 
are matched to the "Y_test.txt" document and attached as a column named "activity". Using merge() will rearrange the order 
of activities making assembly impossible, but dplyr's inner_join() function keeps the data in order. Subjects 1-30 are also 
attached under the column "subject".

2. Repeats the process above for "train" data. Both data sets can then by analyzed independently before they are merged. 
They are output as data frames "test_data" and "train_data" respectively.

3. Merges "train_data" and "test_data". The result is "merge_data" for analysis on the complete dataset.

4. Creates a smaller data frame of columns which include strings "std" and "mean", as well as the "subject" and "activity"
columns. The wording of the brief was vague, so this was done to make sure all relevant data is included.

5. Creates a tidy data frame "arranged_table" which calculates the mean of each column by activity and subject. It also
outputs a test file "tidy_data.txt" inside the "UCI HAR Dataset" folder. Whilst the column names in the tidy data output
don't meet best practice guidelines (they include spaces and other characters) it seemed important to have the data be
easily cross referenced with the original, supplied documents.

Use "read.table("tidy_data.txt", header = TRUE)" to load the text file back into R.

This course is amazing, by the way :)
