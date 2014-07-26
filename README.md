Introduction and Course Requirements
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

Data
Raw data used in this project can be obtained from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zip file will extract to a number of data and meta data text files.

The R Script and Tidy Data
An R script reads data files and applies of transformations to obtain tidy data. Operations applied to the data include:
1. Reading Training, Test and Features Data
2. Merging of Training and Test Data
3. Attaching Activity and Subjects Data to Merged Data
4. Removal of Special Characters from Variable Names
5. Calculation of avaerages of Activities per Subject 
6. Attaching Labels to Activity Values
7. Writing the Tidy Data to file

Code Book
A codeblock detailing the data, variables and code scripts used is also attached