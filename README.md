# GettingCleaningAssignment
Course Project for Getting and Cleaning Data on Coursera

## The script
The script is commented a bit over-the top, but to recap, here is what it does:
- It reads test and training datasets
- It reads the features and sets them as column names of read datasets
- It reads the activity labels
- It reads training and test activities
- For both the training and test datasets (data frames) it adds an id column to the activities and merges them with the labels and sorts them on id. This is to assure that we will retain correspondence between subjects and activities
- For both training and test datasets, a column is added with descriptive activity names
- It reads training and test subjects and adds the corresponding column to test and training data frames
-- From now on, information about subject and activity is present in both data sets along measurement data
- It finally merges the test and training data frames into one data frames
- It subsets the data to contain only needed columns: Activity and Subject and all measurements containing mean and stdev - columns which match mean() or std()
- It melts the data on Activity and Subject Columns
- It dcasts the molten data on Subject and Activity against variable calculating its mean
- TADAAA. result variable contains what was required!

## The output data set
The output data set contains "mean of mean and std measurements for each subject and each activity". So the output data frame contains the following columns:
- Subject - ranging from 1 to 30, identifying the Subject
- Activity - decrtiptively labeled according to activity_labels.txt
- 66 measurement columns
For more details see code_book.txt
