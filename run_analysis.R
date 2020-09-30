
library(data.table) 
# Read training subjects, features, and target , and assign them respectively to "subjects_train", "X_train", and Y_train
subjects_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") 
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt") 
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
# merge "X_train","subjects_train", and "Y_train" to form the trainning set "train_set"
train_set<-data.table(X_train,subjects_train,Y_train)
# Read testing subjects, features, and target, and assign them respectively to "subjects_test", "X_test", and "Y_test"
subjects_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") 
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
# merge "X_test", "subjects_test", and "Y_test" to form the "test_set"
test_set<-data.table(X_test,subjects_test,Y_test)

# Merge the training and the test sets to create one data set "data_all"
data_all<-rbind (train_set,test_set)

# Extracts only the measurements on the mean and standard deviation for each measurement.
#Read features labels and assign them to  "features_lab"
features_lab <- read.table("./UCI HAR Dataset/features.txt")
# Use "grep" function to extracts only the measurements on the mean and standard deviation for each measurement 
##1- on the mean
# features_lab_mean_v<-grep(pattern = "-mean()", features_lab$V2, value=TRUE, fixed=TRUE)
features_lab_mean_ids<-grep(pattern = "-mean()", features_lab$V2, fixed=TRUE)
##2- on the std
# features_lab_std_v<-grep(pattern = "-std()", features_lab$V2, value=TRUE, fixed=TRUE)
features_lab_std_ids<-grep(pattern = "-std()", features_lab$V2, fixed=TRUE)
# 3- combine "features_lab_mean" and "features_lab_std" into "features_lab_mean_or_std"
features_lab_mean_or_std_ids<-c(features_lab_mean_ids,features_lab_std_ids)
# 4- extracts only the measurements on the mean and standard deviation for each measurement
data_selection<-as.data.frame(data_all)[,c(features_lab_mean_or_std_ids,(ncol(data_all)-1),ncol(data_all))]


# Use descriptive activity names to name the activities in the data set
#Read target class labels and assign the result to "activity_labels"
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
#use "factor()" function to name class labels in "data_selection"
data_selection[,ncol(data_selection)]<-factor(data_selection[,ncol(data_selection)], labels=activity_labels$V2)


# Appropriately labels the data set with descriptive variable names.
# extract features colnames from "features_lab" and remove extra charactere "()" 
features_lab_mean_or_std<-features_lab$V2[features_lab_mean_or_std_ids]
features_lab_mean_or_std<- gsub("()","",features_lab_mean_or_std,fixed=TRUE)

# rename "data_selection" colnames: rename features colnames based on "features_lab_mean_or_std" labels 
#+ rename subject colname "subject" + rename target colname "activity" 
colnames(data_selection)<-c(features_lab_mean_or_std,"subject","activity")

# From the data set in step 4, creates a second, 
# independent tidy data set "data_tidy" with the average of each variable 
# for each activity and each subject.
library(dplyr)
data_tidy<-data_selection %>% 
group_by(activity,subject) %>% 
summarise_at(vars(features_lab_mean_or_std), mean)

# write data_tidy into a text file "data_tidy.txt"
write.table(data_tidy, file = "data_tidy.txt", row.names = FALSE)
