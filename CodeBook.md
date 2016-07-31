# Code Book

A explanation of variables is presented as follows:

1) GET THE DATA
* fileURL: URL of relevant file
* path: destination path for relevant file
* path_unzip: destination for relevant unzipped file
* Activity_Test_Data: data frame of activity data test
* Activity_Train_Data: data frame of activity data train
* Activity_Labels_Data: data frame of activity data names
* Feature_Test_Data: data frame of feature data test
* Feature_Train_Data: data frame of feature data train
* Feature_Names_Data: data frame of feature data names
* Subject_Test_Data: data frame of subject data test
* Subject_Train_Data: data frame of subject data test

2) MERGE SETS
* Activity_Data: concatenates Activity_Test_Data and Activity_Train_Data
* Feature_Data: concatenates Feature_Test_Data and Feature_Train_Data
* Subject_Data: concatenates Subject_Test_Data and Subject_Train_Data
* Merged_Data: concatenates all 3 former data frames
    
3) EXTRACTS MEANS AND STDS
* subset: identifier for the mean and std strings
* Data:data frame with measurements that only contain mean and std in name 

4) NAME THE ACTIVITIES
* Data: update variable to add a column with the name of activities for each operation
* Data: update variable to order columns 

5) RENAME VARIABLES
* NA

6) CREATES TIDY DATA FRAME
*  Final_Data: Eliminates activity column and change name for description variable
*  Averages_Data: Creates a data set with the average of each variable for each activity and each subject
