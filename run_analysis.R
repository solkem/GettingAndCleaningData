X_test<-read.table("X_test.txt")
features<-read.table("features.txt")
names(X_test)<-features[,2]
y_test<-read.table("y_test.txt")
names(y_test)<-"Activity"
subject_test<-read.table("subject_test.txt")
names(subject_test)<-"Subject"
test<-cbind(X_test,y_test,subject_test)
test_extracted<-test[,grep("mean|std|Activity|Subject",names(test))]

X_train<-read.table("X_train.txt")
names(X_train)<-features[,2]
y_train<-read.table("y_train.txt")
names(y_train)<-"Activity"
subject_train<-read.table("subject_train.txt")
names(subject_train)<-"Subject"
train<-cbind(X_train,y_train,subject_train)
train_extracted<-train[,grep("mean|std|Activity|Subject",names(train))]
train_test<-rbind(train_extracted,test_extracted)

names(train_test)<-gsub("[-()]","",names(train_test))
names(train_test)<-gsub("BodyBody","Body",names(train_test))
names(train_test)<-gsub("^t","Time",names(train_test))
names(train_test)<-gsub("mean","Mean",names(train_test))

average_activity_subject<-aggregate(train_test,by=list(train_test$Activity,train_test$Subject),FUN=mean, na.rm = TRUE)

activity_labels<-read.table("activity_labels.txt")

for(i in 1:6)
  average_activity_subject$Activity<-gsub(i,activity_labels[i,2],average_activity_subject$Activity)

average_activity_subject
  
