##README

#Coursera John Hopkins Data Science Track - Getting and Cleaning Data
#Course Project 2015-02-22


The aim of the R script is to make a tidy, aggregated version of the UCI HAR Dataset

 
The process of "cleaning" the provided dataset looks like:

1. We read all relevant data into R
2. We merge the names of the activities to the variable which includes the order of these tasks
3. Then we "vertically merge the subject and the now labeled task IDs and the main data
4. We add column names for the first and second columns (ID & task)
5. We add labels for the original variables (varlist is from original data)
6. We horizontally merge the test and the training datatables
7. We make a vector of the needed variables, which includes the two IDs, and only keep these

#Finally we aggregate by subject and task, taking the mean of all variables

Therefore the final output consits of 40 rows, each of which represents an (experinent task - subject) pair
(Note: only some subjects did more than one different tasks of the experiment)

_For the details about the included variables check the codebook.md file!_