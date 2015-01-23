library(plyr)
library(dplyr)
##STEP 1- Reading the the data sets and merging it

##Read the train data set
##x_train<-read.table("/Users/riz/Downloads/Coursera_Courses/Get_Data_Project/Dataset/train/X_train.txt",stringsAsFactors = FALSE)
x_train<-read.table("./Dataset/train/X_train.txt",stringsAsFactors = FALSE)
head(x_train)
dim(x_train)

##Read the features from features.txt
features<-read.table("./Dataset/features.txt",stringsAsFactors = FALSE)

##Check a few of the data parameters to ensure that data has been read properly
##head(features)
##dim(features)
##class(features)

##Get the features values
featureValues<-features[,2]
featureValues
##Put the features values as column names in train data set
names(x_train)<-featureValues

##Check a few of the data parameters to ensure that data has been read properly
head(x_train,n=2)
names(x_train)
dim(x_train)

##Read Activity Labels for Train data set
y_trainLabels<-read.table("./Dataset/train/y_train.txt",stringsAsFactors = FALSE)
class(y_trainLabels)
head(y_trainLabels,n=2)
dim(y_trainLabels)

##Add Labels to the train data
x_labeledTrainData<-cbind(y_trainLabels,x_train)
str(x_labeledTrainData)

##Change the name of the added activity column from "V1" to Activity
colnames(x_labeledTrainData)[colnames(x_labeledTrainData)=="V1"] <- "Activity"
head(x_labeledTrainData,n=2)
dim(x_labeledTrainData)
names(x_labeledTrainData)

##Read the Subjects that actually went through the train process
subjects_train<-read.table("./Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
dim(subjects_train)
head(subjects_train,n=2)

##Add Subjects to the train data
x_subjectLabeledTrainData<-cbind(subjects_train,x_labeledTrainData)

##Check a few of the data parameters to ensure that data has been read properly
dim(x_subjectLabeledTrainData)
str(x_subjectLabeledTrainData)
head(x_subjectLabeledTrainData,n=1)

##Change the name of the added Subject column from "V1" to Subjects
colnames(x_subjectLabeledTrainData)[colnames(x_subjectLabeledTrainData)=="V1"] <- "Subjects"

##Check a few of the data parameters to ensure that data has been read properly
str(x_subjectLabeledTrainData)
head(x_subjectLabeledTrainData,n=2)
dim(x_subjectLabeledTrainData)

##Now move on to test data set, read the test data
x_test<-read.table("./Dataset/test/X_test.txt",stringsAsFactors = FALSE)

##Put the features values as column names in test data set
names(x_test)<-featureValues
head(x_test,n=2)
dim(x_test)

##Read Activity Labels for Test data set
y_testLabels<-read.table("./Dataset/test/y_test.txt",stringsAsFactors = FALSE)
class(y_testLabels)
head(y_testLabels)
dim(y_testLabels)

##Add Labels to the test data
x_labeledTestData<-cbind(y_testLabels,x_test)
head(x_labeledTestData)

##Change the name of the added activity column from "V1" to Activity
colnames(x_labeledTestData)[colnames(x_labeledTestData)=="V1"] <- "Activity"
head(x_labeledTestData)
dim(x_labeledTestData)

##Read the Subjects that actually went through the test process
subjects_test<-read.table("./Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
dim(subjects_test)
head(subjects_test,n=2)

##Add Subjects to the test data
x_subjectLabeledTestData<-cbind(subjects_test,x_labeledTestData)
dim(x_subjectLabeledTestData)
str(x_subjectLabeledTestData)
head(x_subjectLabeledTestData,n=1)

##Change the name of the added Subject column from "V1" to Subjects
colnames(x_subjectLabeledTestData)[colnames(x_subjectLabeledTestData)=="V1"] <- "Subjects"
str(x_subjectLabeledTestData)
head(x_subjectLabeledTestData,n=2)
dim(x_subjectLabeledTestData)
x_subjectLabeledTestData$Subjects

##Merge the two data sets
mergedDataset<-rbind(x_subjectLabeledTrainData,x_subjectLabeledTestData)
str(mergedDataset)
tail(mergedDataset,n=10)
head(mergedDataset,n=5)
dim(mergedDataset)

##STEP 2- Extracts the measurements on the mean and standard deviation for each measurement

#First, makes the column of the merged data unique
names(mergedDataset)<-make.names(names(mergedDataset),unique=TRUE) 

#Extract the required measurement
selectMeasurements<-select(mergedDataset,Subjects,Activity,tBodyAcc.mean...X,tBodyAcc.mean...Y,tBodyAcc.mean...Z,tBodyAcc.std...X,tBodyAcc.std...Y,tBodyAcc.std...Z,tGravityAcc.mean...X,tGravityAcc.mean...Y,tGravityAcc.mean...Z,tGravityAcc.std...X,tGravityAcc.std...Y,tGravityAcc.std...Z,tBodyAccJerk.mean...X,tBodyAccJerk.mean...Y,tBodyAccJerk.mean...Z,tBodyAccJerk.std...X,tBodyAccJerk.std...Y,tBodyAccJerk.std...Z,tBodyGyro.mean...X,tBodyGyro.mean...Y,tBodyGyro.mean...Z,tBodyGyro.std...X,tBodyGyro.std...Y,tBodyGyro.std...Z,tBodyGyroJerk.mean...X,tBodyGyroJerk.mean...Y,tBodyGyroJerk.mean...Z,tBodyGyroJerk.std...X,tBodyGyroJerk.std...Y,tBodyGyroJerk.std...Z,tBodyAccMag.mean..,tBodyAccMag.std..,tGravityAccMag.mean..,tGravityAccMag.std..,tBodyAccJerkMag.mean..,tBodyAccJerkMag.std..,tBodyGyroMag.mean..,tBodyGyroMag.std..,tBodyGyroJerkMag.mean..,tBodyGyroJerkMag.std..,fBodyAcc.mean...X,fBodyAcc.mean...Y,fBodyAcc.mean...Z,fBodyAcc.std...X,fBodyAcc.std...Y,fBodyAcc.std...Z,fBodyAccJerk.mean...X,fBodyAccJerk.mean...Y,fBodyAccJerk.mean...Z,fBodyAccJerk.std...X,fBodyAccJerk.std...Y,fBodyAccJerk.std...Z,fBodyGyro.mean...X,fBodyGyro.mean...Y,fBodyGyro.mean...Z,fBodyGyro.std...X,fBodyGyro.std...Y,fBodyGyro.std...Z,fBodyAccMag.mean..,fBodyAccMag.std..,fBodyBodyGyroJerkMag.mean..,fBodyBodyGyroJerkMag.std..,angle.tBodyAccJerkMean..gravityMean.,angle.tBodyGyroMean.gravityMean.,angle.tBodyGyroJerkMean.gravityMean.,angle.X.gravityMean.,angle.Y.gravityMean.,angle.Z.gravityMean.)


##STEP 3- Now the turn of activities in the dataset. They are presently marked as 1 to 6 in the activity column of "Activity"
## in selectMeasurements data frame. We need to change the numbers corresponding to they descriptive values in file "activity_labels.txt"
##of the data set.

##Write a for loop to convert activity names to their corresponding desciptive names as specified in activity_labels.txt
for (letter in selectMeasurements$Activity){
        if(letter==1){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"WALKING"
        }else 
        if(letter==2){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"WALKING_UPSTAIRS"
        }else 
        if(letter==3){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"WALKING_DOWNSTAIRS"   
        }else 
        if(letter==4){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"SITTING"           
        }else 
        if(letter==5){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"STANDING"           
        }else 
        if(letter==6){
                selectMeasurements$Activity[selectMeasurements$Activity==letter]<-"LAYING"   
        }        
}

str(selectMeasurements)


##STEP 4- Now the turn to give desciptive names to Column of the Selected Measurements (i.e selectMeasurement) dataframe
names(selectMeasurements)[3]<-paste("aveBodyAccTimeXAxis")
names(selectMeasurements)[4]<-paste("aveBodyAccTimeYAxis")
names(selectMeasurements)[5]<-paste("aveBodyAccTimeZAxis")
names(selectMeasurements)[6]<-paste("standardDevBodyAccTimeXAxis")
names(selectMeasurements)[7]<-paste("standardDevBodyAccTimeYAxis")
names(selectMeasurements)[8]<-paste("standardDevBodyAccTimeZAxis")
names(selectMeasurements)[9]<-paste("aveGravityAccTimeXAxis")
names(selectMeasurements)[10]<-paste("aveGravityAccTimeYAxis")
names(selectMeasurements)[11]<-paste("aveGravityAccTimeZAxis")
names(selectMeasurements)[12]<-paste("standardDevGravityAccTimeXAxis")
names(selectMeasurements)[13]<-paste("standardDevGravityAccTimeYAxis")
names(selectMeasurements)[14]<-paste("standardDevGravityAccTimeZAxis")
names(selectMeasurements)[15]<-paste("aveBodyAccJerkTimeXAxis")
names(selectMeasurements)[16]<-paste("aveBodyAccJerkTimeYAxis")
names(selectMeasurements)[17]<-paste("aveBodyAccJerkTimeZAxis")
names(selectMeasurements)[18]<-paste("standardDevBodyAccJerkTimeXAxis")
names(selectMeasurements)[19]<-paste("standardDevBodyAccJerkTimeYAxis")
names(selectMeasurements)[20]<-paste("standardDevBodyAccJerkTimeZAxis")
names(selectMeasurements)[21]<-paste("aveBodyGyrometerTimeXAxis")
names(selectMeasurements)[22]<-paste("aveBodyGyrometerTimeYAxis")
names(selectMeasurements)[23]<-paste("aveBodyGyrometerTimeZAxis")
names(selectMeasurements)[24]<-paste("standardDevBodyGyrometerTimeXAxis")
names(selectMeasurements)[25]<-paste("standardDevBodyGyrometerTimeYAxis")
names(selectMeasurements)[26]<-paste("standardDevBodyGyrometerTimeZAxis")
names(selectMeasurements)[27]<-paste("aveBodyGyrometerJerkTimeXAxis")
names(selectMeasurements)[28]<-paste("aveBodyGyrometerJerkTimeYAxis")
names(selectMeasurements)[29]<-paste("aveBodyGyrometerJerkTimeZAxis")
names(selectMeasurements)[30]<-paste("standardDevBodyGyrometerJerkTimeXAxis")
names(selectMeasurements)[31]<-paste("standardDevBodyGyrometerJerkTimeYAxis")
names(selectMeasurements)[32]<-paste("standardDevBodyGyrometerJerkTimeZAxis")
names(selectMeasurements)[33]<-paste("aveBodyAccMagnitudeTime")
names(selectMeasurements)[34]<-paste("standardDevBodyAccMagnitudeTime")
names(selectMeasurements)[35]<-paste("aveGravityAccMagnitudeTime")
names(selectMeasurements)[36]<-paste("standardDevGravityAccMagnitudeTime")
names(selectMeasurements)[37]<-paste("aveBodyAccJerkMagnitudeTime")
names(selectMeasurements)[38]<-paste("standardDevBodyAccJerkMagnitudeTime")
names(selectMeasurements)[39]<-paste("aveBodyGyrometerMagnitudeTime")
names(selectMeasurements)[40]<-paste("standardDevBodyGyrometerMagnitudeTime")
names(selectMeasurements)[41]<-paste("aveBodyGyrometerJerkMagnitudeTime")
names(selectMeasurements)[42]<-paste("standardDevBodyGyrometerJerkMagnitudeTime")
names(selectMeasurements)[43]<-paste("aveBodyAccFastFourierTransformXAxis")
names(selectMeasurements)[44]<-paste("aveBodyAccFastFourierTransformYAxis")
names(selectMeasurements)[45]<-paste("aveBodyAccFastFourierTransformZAxis")
names(selectMeasurements)[46]<-paste("standardDevBodyAccFastFourierTransformXAxis")
names(selectMeasurements)[47]<-paste("standardDevBodyAccFastFourierTransformYAxis")
names(selectMeasurements)[48]<-paste("standardDevBodyAccFastFourierTransformZAxis")
names(selectMeasurements)[49]<-paste("aveBodyAccJerkFastFourierTransformXAxis")
names(selectMeasurements)[50]<-paste("aveBodyAccJerkFastFourierTransformYAxis")
names(selectMeasurements)[51]<-paste("aveBodyAccJerkFastFourierTransformZAxis")
names(selectMeasurements)[52]<-paste("standardDevBodyAccJerkFastFourierTransformXAxis")
names(selectMeasurements)[53]<-paste("standardDevBodyAccJerkFastFourierTransformYAxis")
names(selectMeasurements)[54]<-paste("standardDevBodyAccJerkFastFourierTransformZAxis")
names(selectMeasurements)[55]<-paste("aveBodyGyrometerFastFourierTransformXAxis")
names(selectMeasurements)[56]<-paste("aveBodyGyrometerFastFourierTransformYAxis")
names(selectMeasurements)[57]<-paste("aveBodyGyrometerFastFourierTransformZAxis")
names(selectMeasurements)[58]<-paste("standardDevBodyAccGyrometerFourierTransformXAxis")
names(selectMeasurements)[59]<-paste("standardDevBodyAccGyrometerFourierTransformYAxis")
names(selectMeasurements)[60]<-paste("standardDevBodyAccGyrometerFourierTransformZAxis")
names(selectMeasurements)[61]<-paste("aveBodyAccMagnitudeFastFourierTransform")
names(selectMeasurements)[62]<-paste("standardDevBodyAccMagnitudeFastFourierTransform")
names(selectMeasurements)[63]<-paste("aveBodyGyrometerJerkMagnitudeFastFourierTransform")
names(selectMeasurements)[64]<-paste("standardDevGyrometerJerkMagnitudeFastFourierTransform")
names(selectMeasurements)[65]<-paste("aveAngularBodyAccJerkTime")
names(selectMeasurements)[66]<-paste("aveAngularBodyGyrometerTime")
names(selectMeasurements)[67]<-paste("aveAngularBodyGyrometerJerkTime")
names(selectMeasurements)[68]<-paste("aveAngularGravityXAxis")
names(selectMeasurements)[69]<-paste("aveAngularGravityYAxis")
names(selectMeasurements)[70]<-paste("aveAngularGravityZAxis")


##STEP5 Get the Tidy data

##Convert the select measurement data into a table function. This would just make it easy to manipulate and print the data
selectMeasurementsTable<-tbl_df(selectMeasurements)

##Group the table by Subjects and Activities
selectMeasurementsGroupedBySubjectsActivities<-group_by(selectMeasurementsTable,Subjects,Activity)
##head(select(selectMeasurementsGroupedBySubjectsActivities,Subjects,Activity),n=100)
str(selectMeasurementsGroupedBySubjectsActivities)

##Summarise the data and apply mean to find the average for variables
tidydata<-summarize(selectMeasurementsGroupedBySubjectsActivities,meanAveBodyAccTimeXAxis=mean(aveBodyAccTimeXAxis),
          meanAveBodyAccTimeYAxis=mean(aveBodyAccTimeYAxis),
          meanAveBodyAccTimeZAxis=mean(aveBodyAccTimeZAxis),
          meanStandardDevBodyAccTimeXAxis=mean(standardDevBodyAccTimeXAxis),
          meanStandardDevBodyAccTimeYAxis=mean(standardDevBodyAccTimeYAxis),
          meanStandardDevBodyAccTimeZAxis=mean(standardDevBodyAccTimeZAxis),
          meanAveGravityAccTimeXAxis=mean(aveGravityAccTimeXAxis),
          meanAveGravityAccTimeYAxis=mean(aveGravityAccTimeYAxis),
          meanAveGravityAccTimeZAxis=mean(aveGravityAccTimeZAxis),
          meanStandardDevGravityAccTimeXAxis=mean(standardDevGravityAccTimeXAxis),
          meanStandardDevGravityAccTimeYAxis=mean(standardDevGravityAccTimeYAxis),
          meanStandardDevGravityAccTimeZAxis=mean(standardDevGravityAccTimeZAxis),
          meanAveBodyAccJerkTimeXAxis=mean(aveBodyAccJerkTimeXAxis),
          meanAveBodyAccJerkTimeYAxis=mean(aveBodyAccJerkTimeYAxis),
          meanAveBodyAccJerkTimeZAxis=mean(aveBodyAccJerkTimeZAxis),
          meanStandardDevBodyAccJerkTimeXAxis=mean(standardDevBodyAccJerkTimeXAxis),
          meanStandardDevBodyAccJerkTimeYAxis=mean(standardDevBodyAccJerkTimeYAxis),
          meanStandardDevBodyAccJerkTimeZAxis=mean(standardDevBodyAccJerkTimeZAxis),
          meanAveBodyGyrometerTimeXAxis=mean(aveBodyGyrometerTimeXAxis),
          meanAveBodyGyrometerTimeYAxis=mean(aveBodyGyrometerTimeYAxis),
          meanAveBodyGyrometerTimeZAxis=mean(aveBodyGyrometerTimeZAxis),
          meanStandardDevBodyGyrometerTimeXAxis=mean(standardDevBodyGyrometerTimeXAxis),
          meanStandardDevBodyGyrometerTimeYAxis=mean(standardDevBodyGyrometerTimeYAxis),
          meanStandardDevBodyGyrometerTimeZAxis=mean(standardDevBodyGyrometerTimeZAxis),
          meanAveBodyGyrometerJerkTimeXAxis=mean(aveBodyGyrometerJerkTimeXAxis),
          meanAveBodyGyrometerJerkTimeYAxis=mean(aveBodyGyrometerJerkTimeYAxis),
          meanAveBodyGyrometerJerkTimeZAxis=mean(aveBodyGyrometerJerkTimeZAxis),
          meanStandardDevBodyGyrometerJerkTimeXAxis=mean(standardDevBodyGyrometerJerkTimeXAxis),
          meanStandardDevBodyGyrometerJerkTimeYAxis=mean(standardDevBodyGyrometerJerkTimeYAxis),
          meanStandardDevBodyGyrometerJerkTimeZAxis=mean(standardDevBodyGyrometerJerkTimeZAxis),
          meanAveBodyAccMagnitudeTime=mean(aveBodyAccMagnitudeTime),
          meanStandardDevBodyAccMagnitudeTime=mean(standardDevBodyAccMagnitudeTime),
          meanAveGravityAccMagnitudeTime=mean(aveGravityAccMagnitudeTime),
          meanStandardDevGravityAccMagnitudeTime=mean(standardDevGravityAccMagnitudeTime),
          meanAveBodyAccJerkMagnitudeTime=mean(aveBodyAccJerkMagnitudeTime),
          meanStandardDevBodyAccJerkMagnitudeTime=mean(standardDevBodyAccJerkMagnitudeTime),
          meanAveBodyGyrometerMagnitudeTime=mean(aveBodyGyrometerMagnitudeTime),
          meanStandardDevBodyGyrometerMagnitudeTime=mean(standardDevBodyGyrometerMagnitudeTime),
          meanAveBodyGyrometerJerkMagnitudeTime=mean(aveBodyGyrometerJerkMagnitudeTime),
          meanStandardDevBodyGyrometerJerkMagnitudeTime=mean(standardDevBodyGyrometerJerkMagnitudeTime),
          meanAveBodyAccFastFourierTransformXAxis=mean(aveBodyAccFastFourierTransformXAxis),
          meanAveBodyAccFastFourierTransformYAxis=mean(aveBodyAccFastFourierTransformYAxis),
          meanAveBodyAccFastFourierTransformZAxis=mean(aveBodyAccFastFourierTransformZAxis),
          meanStandardDevBodyAccFastFourierTransformXAxis=mean(standardDevBodyAccFastFourierTransformXAxis),
          meanStandardDevBodyAccFastFourierTransformYAxis=mean(standardDevBodyAccFastFourierTransformYAxis),
          meanStandardDevBodyAccFastFourierTransformZAxis=mean(standardDevBodyAccFastFourierTransformZAxis),
          meanAveBodyAccJerkFastFourierTransformXAxis=mean(aveBodyAccJerkFastFourierTransformXAxis),
          meanAveBodyAccJerkFastFourierTransformYAxis=mean(aveBodyAccJerkFastFourierTransformYAxis),
          meanAveBodyAccJerkFastFourierTransformZAxis=mean(aveBodyAccJerkFastFourierTransformZAxis),
          meanStandardDevBodyAccJerkFastFourierTransformXAxis=mean(standardDevBodyAccJerkFastFourierTransformXAxis),
          meanStandardDevBodyAccJerkFastFourierTransformYAxis=mean(standardDevBodyAccJerkFastFourierTransformYAxis),
          meanStandardDevBodyAccJerkFastFourierTransformZAxis=mean(standardDevBodyAccJerkFastFourierTransformZAxis),
          meanAveBodyGyrometerFastFourierTransformXAxis=mean(aveBodyGyrometerFastFourierTransformXAxis),
          meanAveBodyGyrometerFastFourierTransformYAxis=mean(aveBodyGyrometerFastFourierTransformYAxis),
          meanAveBodyGyrometerFastFourierTransformZAxis=mean(aveBodyGyrometerFastFourierTransformZAxis),
          meanStandardDevBodyAccGyrometerFourierTransformXAxis=mean(standardDevBodyAccGyrometerFourierTransformXAxis),
          meanStandardDevBodyAccGyrometerFourierTransformYAxis=mean(standardDevBodyAccGyrometerFourierTransformYAxis),
          meanStandardDevBodyAccGyrometerFourierTransformZAxis=mean(standardDevBodyAccGyrometerFourierTransformZAxis),
          meanAveBodyAccMagnitudeFastFourierTransform=mean(aveBodyAccMagnitudeFastFourierTransform),
          meanStandardDevBodyAccMagnitudeFastFourierTransform=mean(standardDevBodyAccMagnitudeFastFourierTransform),
          meanAveBodyGyrometerJerkMagnitudeFastFourierTransform=mean(aveBodyGyrometerJerkMagnitudeFastFourierTransform),
          meanStandardDevGyrometerJerkMagnitudeFastFourierTransform=mean(standardDevGyrometerJerkMagnitudeFastFourierTransform),
          meanAveAngularBodyAccJerkTime=mean(aveAngularBodyAccJerkTime),
          meanAveAngularBodyGyrometerTime=mean(aveAngularBodyGyrometerTime),
          meanAveAngularBodyGyrometerJerkTime=mean(aveAngularBodyGyrometerJerkTime),
          meanAveAngularGravityXAxis=mean(aveAngularGravityXAxis),
          meanAveAngularGravityYAxis=mean(aveAngularGravityYAxis),
          meanAveAngularGravityZAxis=mean(aveAngularGravityZAxis))


dim(tidydata)
str(tidydata)
tidydata

##Write the data to a text file
##write.table(tidydata,"./Dataset/tidydata.txt",row.names=FALSE)

##Read it back to confirm everying looks alright
##str(read.table("./Dataset/tidydata.txt",header = TRUE, stringsAsFactors = FALSE ))






