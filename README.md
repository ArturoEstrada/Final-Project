# Final-Project
Getting and Cleaning Data course

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The presented scrip "run_analysis.R" carries out the next operations: 

1) GET THE DATA
* Download file and save it in projectData folder
* Unzip file
* Creates data frames of relevant files

2) MERGE SETS
* Creates 3 sets, concatenated by rows
* Set names to columns
* Gathers all data in one whole data frame 
    
3) EXTRACTS MEANS AND STDS
* Generates a new data frame with measurements that only contain mean and std in name 

4) NAME THE ACTIVITIES
* Adds to data a column with the name of activities for each operation
* Order columns 

5) RENAME VARIABLES
* Change names of variables into a more descriptive manner 

6) CREATES TIDY DATA FRAME
* Eliminates activity column and change name for description variable
* Creates a data set with the average of each variable for each activity and each subject.








