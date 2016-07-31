
## 1) GET THE DATA

    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    path <- "C:/Users/Arturo/Documents/Data Science Specialization/Getting and Cleaning Data/projectData.zip"
    download.file(fileURL,path)
    ## Download file and save it in projectData folder

    unzip(zipfile = path, exdir = "C:/Users/Arturo/Documents/Data Science Specialization/Getting and Cleaning Data")
    ## Unzip file

    path_unzip <- "C:/Users/Arturo/Documents/Data Science Specialization/Getting and Cleaning Data/UCI HAR Dataset"
    ## path for unzipped file

    Activity_Test_Data <- read.table(file.path(path_unzip, "test","Y_test.txt"))
    Activity_Train_Data <- read.table(file.path(path_unzip, "train","Y_train.txt"))
    Activity_Labels_Data <- read.table(file.path(path_unzip,"activity_labels.txt"))
    Feature_Test_Data <- read.table(file.path(path_unzip, "test", "X_test.txt"))
    Feature_Train_Data <- read.table(file.path(path_unzip, "train", "X_train.txt"))
    Feature_Names_Data <- read.table(file.path(path_unzip, "features.txt"))
    Subject_Test_Data <- read.table(file.path(path_unzip, "test", "subject_test.txt"))
    Subject_Train_Data <- read.table(file.path(path_unzip, "train", "subject_train.txt"))

    ## Creates data frames of relevant files

## 2) MERGE SETS

    Activity_Data <- rbind(Activity_Test_Data, Activity_Train_Data)
    Feature_Data <- rbind(Feature_Test_Data, Feature_Train_Data)
    Subject_Data <- rbind(Subject_Test_Data, Subject_Train_Data)
    ## Creates 3 sets, concatenated by rows

    names(Activity_Data) <- c("activity")
    names(Activity_Labels_Data) <- c("activity","description")
    names(Subject_Data) <- c("subject")
    names(Feature_Data) <- Feature_Names_Data$V2
    ## Set names to columns

    Merged_Data <- cbind(Activity_Data, Subject_Data, Feature_Data)
    ## Gathers all data in one whole data frame 

## 3) EXTRACTS MEANS AND STDS
    
    subset <- grep("mean\\(\\)|std\\(\\)", Feature_Names_Data$V2)
    Data <- Merged_Data[, c(1,2,subset + 2)]
    ## Generates a new data frame with measurements that only contain mean and std in name 

## 4) NAME THE ACTIVITIES
    Data <- merge(Data, Activity_Labels_Data, by = "activity", all.x = TRUE)
    ##adds to data a column with the name of activities for each operation
    library(dplyr)
    Data <- select(Data,subject,activity,description,everything())
    ##order columns 
    
## 5) Rename Variables
    names(Data) <- gsub("^t", "Time", names(Data))
    names(Data) <- gsub("^f", "Frequency", names(Data))
    names(Data) <- gsub("Acc", "Accelerometer", names(Data))
    names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
    names(Data) <- gsub("Mag", "Magnitude", names(Data))
    names(Data) <- gsub("BodyBody", "Body", names(Data))
    ## Change names of variables into a more descriptive manner 
    
## 6) Creates tidy Data
    Final_Data <- select(Data,-activity)
    Final_Data <- rename(Final_Data, Activity = description)
    ## Eliminates activity column and change name for description variable
    
    Averages_data <- ddply(Final_Data, .(subject, Activity), function(x) colMeans(x[, 3:68]))
    ## Creates a data set with the average of each variable for each activity and each subject.
    
    write.table(Averages_data,"Tidy.txt", row.name = FALSE)


