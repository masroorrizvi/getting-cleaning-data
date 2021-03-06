# README File - Getting and Cleaning Data Course Project

First of all, many thanks for evaluating my course project. Please have a look at my repository for this project as follows :-

https://github.com/masroorrizvi/getting-cleaning-data

This repository has 3 files in it namely :-

- run_analysis.R
- README.md (This file)
- CodeBook.md


As mentioned in the starting instructions,please find below the instructions to run the run_analysis.R file

First time around, run the script to see the tidy data at the console. Once satisfied, I suggest you to comment the tidy data command (line 307 of the script) and uncomment write and read commands (line 310 and 313) and run the script again. This will enable you to write the tidy data at the location specified and read it back to validate if the write and read process happen properly.

Please see the newly read data at the console to make sure that it looks alright. The data should show 180 rows and 70 columns.

Now lets have a look at how the run_analysis.R works

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

STEP 2

In step 2, we need to extract out only the Subjects, Mean and standard deviation columns from the entire list of 563 columns in mergedDataset. The SELECT function of dplyr library comes to use here and we save the output in selectMeasurements. The selectMeasurements dataset now has only 68 columns and 10299Just before doing this, to clean up the data and find unique elements, we apply make.names method on mergedData set. 

STEP 3

The 3rd step requires to change the activity names from numeric (1,2,3 etc) to the character values ("WALKING", "STANDINFG" etc). So I now need to  change the Activity numbers to their corresponding character value as per the activity_labels.txt. For e.g Walking for 1, WALKING_UPSTAIRS for 2 etc. For this I have written a simple FOR loop for all and 6 activities replacing the numeric values to their corresponding character values in Column 2 for the dataset (i.e Activity Column of selectMeasurements dataframe). The selectMeasurements dataframe is now properly labelled for descriptive activities.

STEP 4

For step 4, we are supposed to give descriptive names to all the the columns in addition to Subjects and Activity columns of the dataset. For this I have used the paste function to give the new coloumn names and assigned the new names using "names" function. I do this for all the 68 mean and standard deviation variables of the dataset.

STEP 5

Now is the time to create the tidy dataset. Do do this, I first convert the selectMeasurements dataframe to a data table using tbl_df function and save it in selectMeasurementsTable variable. This is done to improve and printability of the result.

Since the average of the variables are required per Activity done by the subjects, I now group the selectMeasurementsTable dataset by Subjects and Activity and save the result in selectMeasurementsGroupedBySubjectsActivities variable.

Now comes the last and the most important step of the project. As instructed in Step 5, I now need to create the average of all the 68 variables I have extracted in Step 2. This need to be done for all the 30 subjects present in Subjects column of selectMeasurementsGroupedBySubjectsActivities data and for each of the 6 activities corresponding to the subjects. I use the summarise function for this where I specify the selectMeasurementsGroupedBySubjectsActivities dataset and means of all the 68 columns of the dataset. Within the summarise function itself, I save the output of all the means in nice descriptive variables. The details of these variables can be seen the Codebook attached in this repository

In the end, i just output my tidy data to view at the console. Please note the write.table command towards the end of the script for writing the tidy data inside the dataset location. This is required to generate the tidy data file to be attached for submission. There also a read.table command to read the data back. 

Quick Note - There another easy way of calculating the mean on all the columns using the function summarise_each that can be seen at line 302. I have not used it my script as I had already named the columns and did not have enough time to change them before submission. But that sure is a better way of summarising the data

Hope you enjoyed reading the details. Best of luck for your marking !




