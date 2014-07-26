CodeBook for Tidy Dataset

Input Data
The Following data files provided raw input data:
1. X_train.txt
2. X_test.txt
3. activity_labels.txt
4. subject_train.txt
5. subject_test.txt
5. y_test.txt
6. y_train.txt
7. features.txt
8. features_info.txt

Output Tidy Data
tidy_data.txt

List of Variables used
VARIABLE                  TYPE            DESCRIPTION
X_test                    Data Frame      Testing data observations without Subjects & Activities
features                  Data Frame      List of features making variable names
Activity                  Data Frame      List of all activities
Subject                   Data Frame      Data on on subjects used in experiment
test                      Data Frame      Testing data observations with Subjects & Activities
test_extracted            Data Frame      Testing data observations extracted from values for Mean & Standard Deviations Only
X_train                   Data Frame      Training data observations without Subjects & Activities
train                     Data Frame      Training data observations with Subjects & Activities
train_extracted           Data Frame      Training data observations extracted from values for Mean & Standard Deviations Only
average_activity_subject  Data Frame      An average of all measurements per Activity for every Subject
activity_labels           Data Frame      List of names of Activities

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Steps of the Script
1. Reading Test Data
X_test<-read.table("X_test.txt")

2. Reading Features Data
features<-read.table("features.txt")
names(X_test)<-features[,2]

3. Reading Activity and Subjects Data
y_test<-read.table("y_test.txt")
names(y_test)<-"Activity"
subject_test<-read.table("subject_test.txt")
names(subject_test)<-"Subject"

4. Attaching Activity and Subjects Data to Testing Data
test<-cbind(X_test,y_test,subject_test)
test_extracted<-test[,grep("mean|std|Activity|Subject",names(test))]

5. Reading Training Data
X_train<-read.table("X_train.txt")
names(X_train)<-features[,2]

6. Reading Activity and Subjects Data
y_train<-read.table("y_train.txt")
names(y_train)<-"Activity"
subject_train<-read.table("subject_train.txt")
names(subject_train)<-"Subject"

7. Attaching Activity and Subjects Data to Testing Data
train<-cbind(X_train,y_train,subject_train)
train_extracted<-train[,grep("mean|std|Activity|Subject",names(train))]
train_test<-rbind(train_extracted,test_extracted)

8. Removing Special Characters from Variable Names
names(train_test)<-gsub("[-()]","",names(train_test))
names(train_test)<-gsub("BodyBody","Body",names(train_test))
names(train_test)<-gsub("^t","Time",names(train_test))
names(train_test)<-gsub("mean","Mean",names(train_test))

9. Calculating avaerages of Activities per Subject 
average_activity_subject<-aggregate(train_test,by=list(train_test$Activity,train_test$Subject),FUN=mean, na.rm = TRUE)

10. Attaching Labels to Activity Values
activity_labels<-read.table("activity_labels.txt")
for(i in 1:6)
  average_activity_subject$Activity<-gsub(i,activity_labels[i,2],average_activity_subject$Activity)

average_activity_subject

11. Writing the Tidy Data to file
write.table(average_activity_subject,file="tidy_data.txt")
  
