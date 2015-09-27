#Reading datasets
train<-read.table("UCI\ HAR\ DataSet/train/X_train.txt", header = FALSE)
test<-read.table("UCI\ HAR\ DataSet/test/X_test.txt", header = FALSE)
#Reading features
features<-read.table("UCI\ HAR\ DataSet/features.txt", header = FALSE)
#Setting features as column names of datasets
colnames(train)<-features[,2]
colnames(test)<-features[,2]
#Reading activity labels
activity_labels<-read.table("UCI\ HAR\ DataSet/activity_labels.txt", header = FALSE)
#Reading test activities
ytest<-read.table("UCI\ HAR\ DataSet/test/y_test.txt", header = FALSE)
#Adding an id column for later merging
ytest["id"]<-1:nrow(ytest)
#Merging activities and labels
test_labeled<-merge(ytest, activity_labels)
#Sorting by id to restore order
test_labeled<-test_labeled[order(test_labeled$id),]
#Adding labeled activity column to test data frame
test[,"Activity"]<-test_labeled[,3]
#Reading train activities
ytrain<-read.table("UCI\ HAR\ DataSet/train/y_train.txt", header = FALSE)
#Adding an id column for later merging
ytrain["id"]<-1:nrow(ytrain)
#Merging activities and labels
train_labeled<-merge(ytrain, activity_labels)
#Sorting by id to restore order
train_labeled<-train_labeled[order(train_labeled$id),]
#Adding labeled activity column to train data frame
train[,"Activity"]<-train_labeled[,3]
#Reading test subject
subject_test<-read.table("UCI\ HAR\ DataSet/test/subject_test.txt", header = FALSE)
#Adding subject column to test data frame
test[,"Subject"]<-subject_test[,1]
#Reading train subject
subject_train<-read.table("UCI\ HAR\ DataSet/train/subject_train.txt", header = FALSE)
#Adding subject column to train data frame
train[,"Subject"]<-subject_train[,1]
#Merging data with 563 columns (561 original + Activity + Subject)
alldata<-merge(test, train, all = TRUE, by = 1:563)
#Cutting the data frame to contain only mean, std and our Activity and Subject
alldata2<-alldata[,grepl("mean\\(\\)|std\\(\\)|Activity|Subject", colnames(alldata))]
#Melting the data according to activity and subject
molten<-melt(alldata2, id.vars=c("Activity", "Subject"))
#Creating final dataset with means
result<-dcast(molten, Subject + Activity ~ variable, mean)