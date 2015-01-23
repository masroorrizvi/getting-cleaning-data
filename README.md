# README File for the Getting and Cleaning Data Course Project

First of all, many thanks for evaluating my course project. As mentioned in the starting instructions, I'll start with explaining the contents of run_analysis.R file.

As expected by the course, run_analysis.R file is divided into 5 steps. Each of these steps in the file is quite extensively commented. I also give a run down of each of these steps and their corresponding details over here.

As the very first step, I load the plyr and dplyr package using the library command. These will be essential in further steps when I use SELECT and SUMMARIZE functions.

Please note that I have changed the name of the parent folder of the data set as "Dataset". I have also set up the working directory using the setwd() method as the local directory on my computer where the dataset is stored. So you will always see me referring to the files in the dataset as "./Dataset/<path to the file>"

Let us now look at the details of each of the steps as follows :-
 
STEP 1 

Here I start with reading the training variable data set from the file X_train.txt. I save the values in x_train variable. 
 

