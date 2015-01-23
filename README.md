# README File for the Getting and Cleaning Data Course Project

First of all, many thanks for evaluating my course project. As mentioned in the starting instructions, I'll start with explaining the contents of run_analysis.R file.

As expected by the course, run_analysis.R file is divided into 5 steps. Each of these steps in the file is quite extensively commented in the code itself. I also give a run down of each of these steps and their corresponding details over here.

As the very first step, I load the plyr and dplyr package using the library command. These will be essential in further steps when I use SELECT and SUMMARIZE functions.

Please note that I have changed the name of the parent folder of the data set as "Dataset". I have also set up the working directory using the setwd() method as the local directory on my computer where the dataset is stored. So you will always see me referring to the files in the dataset as "./Dataset/<path to the file>" in the code.

Let us now look at the details of each of the steps as follows :-
 
STEP 1 

Here I start with reading the training variable data set from the file X_train.txt. I save the values in x_train variable. I quickly do a couple of sanity checks using head and dim to ensure that the data is properly loaded. You will see me doing these sanity checks throughout to the code to check and validate data. I then move on to read the features from features.txt and save the values of features like tBodyAcc-mean etc in featureValues

Then comes the set of data for activities done by the subjects. These are given in the file y_train.txt but in terms of the numbers given in activity_labels.txt and not the characters. Later on sometime, I will change them to their corresponding characters for tidying up the data. I save the data read into a variable called y_trainLabels. Please note that the number of records in this variable is equivalent to the number of records in x_train variable (7352 rows and 561 columns). This should sound logical too as the data in x_train is the data for activities done by the subjects in y_trainLables. 

To make the training data complete, I join y_trainLables with x_train data using cbind and save it in x_labeledTrainData. Before moving on, I make sure that the column heading is changed from "V1" to "Activities".

Now have a look at another file in the dataset called subject_train.txt. This file has the subjects who has performed the activities in y_train.txt and have the various variables captured in x_train.txt. We need to join this data as well to the data prepared above in x_labeledTrainData variable. So I read the file and store it in subject_train variable. Join it to x_labeledTrainData using cbind and store it in x_subjectLabeledTrainData variable. Again, dont forget to change the column name of the added column from "V1" to "Subjects"

I do exactly the same sets of the above steps for test data now and save it into x_subjectLabeledTestData variable.

Now I have two sets of data available - the train data and the test data. Since both these datasets have same number of columns (i.e 563 now), and step 1 is asking to merge the data sets, I use the rbind command now to merge the two data sets and store the result in mergedDataset variable. I do a couple of sanity check to find out that this variable (which by the way is a dataframe) has 10299 rows and 263 variables now. This marks the completion of step 1 