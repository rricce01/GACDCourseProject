####  Course Project for Coursera 'getdata-010'  
README.md


Content
----------
This document provides background information and explanation of my course project submission for Getting and Cleaning Data (Coursera 'getdata-010') conducted by Johns Hopkins University.

Topics covered  
----------
- Project overview  
- Outcome summary  
- Submitted files and contents  
- Starting point
- Input package  
- Running the R script
- How the input was processed  
- Feature subset selection criteria
- Feature name readability
- Output file


Project overview
----------
The course project consists of applying the principles of 'tidy data' in the creation of a specific subset of a large package of sensor measurements data. This is accomplished via use of an R script to process the raw data, and preparing documentation covering the process followed, output format, and other relevant information, to be posted on GitHub.


Outcome summary
---------
Per [Wickham](http://www.jstatsoft.org/v59/i10/paper) [1] data's 'tidyness' is determined by "how rows, columns and tables are matched up with observations, variables and types". He sets forth three conditions required for tidy data:  
   
1. Each variable forms a column.  
2. Each observation forms a row.  
3. Each type of observational unit forms a table.

This project's output data is indeed 'tidy', since it fulfills these three requirements. It is a table of 180 observations of 134 variables where all 134 columns are unique and descriptively named, all 180 rows are distinct measurement observations, and the table itself represents an 'observational unit': the set of specific sensor readings collected during an experimental regimen, processed in a specific way. It reflects the 'wide' version of tidy data formation.


Submitted files and contents  
----------
The following files are available from my [public GitHub repository](https://github.com/rricce01/GACDCourseProject)

- run_analysis.R  
- CodeBook.md
- README.md  
- var_avgs.txt

"run_analysis.R" contains an R script that processes the measurement and associated data in folder "UCI HAR Data", outputting a tidy processed subset of the measurement data as file "var_avgs.txt"  

"CodeBook.md" contains data dictionary-like information (feature name, data type, range, description) on the features (columns of data) in "var_avgs.txt".

"README.txt" (the file you are reading now) contains explanatory information on the project submittal.

"var_avgs.txt", the R script's output file, contains the tidy processed subset of the input file data as specified in the project assignment. 


Starting Point
----------
Project inputs are a set of smartphone sensor measurements collected from experimental subjects' movements in three dimensions while performing ordinary daily activities such as walking and stair climbing, plus descriptive documentation of the collection methods, pre-processing, formats and meanings of the measured data.

The data package was prepared during research into wearable device applications by a group in Italy, and resides at the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html) [2] on this [page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) [3]. The data package, downloadable from the class archive [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), contains both measurements data files and supporting documentation, with detailed descriptions of the package and contents. 


Input Package
----------
The data package downloads as a zipped folder "UCI HAR Data". This folder contains test and train subsets of the full measurements database (in folders "test" and "train") and text files describing the features and naming convention, plus a list of activity code names. There is also a Read Me file.

The test and train folders each contain the associated measurement observations data, a list of the experimental subject IDs for each observation, and a list of the activity code for each observation. 

All datasets noted above are used as inputs by the "run_analysis.R" script. The content of the "Inertial Signals" folders are unused.


Running the R script  
----------
For proper execution, the unzipped folder "UCI HAR Data" must be saved in your system's working directory.

If the script file "run_analysis.R" is also saved in your system's working directory, it can be run it by entering the following at the R console prompt.
>    source("./run_analysis.R")

If "run_analysis.R" is saved elsewhere, put its fully-qualified file string into the source() command above, or load the script into RStudio and run it using RStudio functions. 


How the input was processed  
----------  
The following processing was performed using the input datasets by the R script:
- The test and train data tables were stacked using rbind  
- Feature names were added to the stacked table (column headers) 
- A 'activities' column was created from inputs and attached to the table using cbind
- A 'subject ID' column was created from inputs and attached to the table using cbind
- Columns with duplicated names were removed
- A subset of features (columns) meeting specific criteria was selected for further processing (see 'Feature subset selection criteria' section below)
- Numeric codes in the 'activity' column were replaced with text activity names conforming with [recommended R style](http://r-pkgs.had.co.nz/style.html) [4]
- The input list's feature names were revised for greater readability  (see 'Feature name readability' section below)
- The subset's observation (row) data was grouped by subject and activity
- The mean and standard deviation for the grouped observations were computed, then added as new features (columns) to the subset. 
- The feature names (column headers) of the added features were formed by appending the applicable suffix (either "_mean" or "_sd") to name of the feature used as calculation input. This is consistent with conforming with [recommended R style](http://r-pkgs.had.co.nz/style.html) [4]


Feature subset selection criteria
----------
Per the assignment instructions, features (columns) whose name contained the function designations "mean()" and "sd()" were selected for further processing. All others were not used, and do not appear in the final output.


Feature name readability
----------
Elements of the input list's feature names were revised for greater readability as follows:  

 - replaced "-X", "-Y", "-Z" axis designations with "-Xaxis", "-Yaxis", "-Zaxis"
 - replaced "Acc" with "Accelerometer"
 - replaced "Gyro" with "Gyroscope"
 - replaced "mean" with "Mean"
 - replaced "std" with "StdDev"
 - replaced "Mag" with "Magnitude"
 - replaced "t" with "timeDomain"
 - replaced "f" with "freqDomain"
 - deleted "-" and "()" in the feature names

[CamelCase](http://en.wikipedia.org/wiki/CamelCase) [5] capitalization was used for feature names due to the length of the expanded names  


Output file
----------
The R script's output file "var_avgs.txt" is written to the working directory. It will contain the final processed subset of the inputs.
 
It can be read into R from the working directory using:
>   read.table("./var_avgs.txt", header=TRUE, sep="")



Links and references
----------
[1]  [Wickham, H; "Tidy Data"; Journal of Statistical Software Aug 2014; ](http://www.jstatsoft.org/v59/i10/paper)

[2] [Machine Learning Repository; UC Irvine;](http://archive.ics.uci.edu/ml/index.html)

[3] [Human Activity Recognition Using Smartphones Data Set; UC Irvine; ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

[4] [Wickham, H; "R Style Guide"](http://r-pkgs.had.co.nz/style.html)

[5] [CamelCase, Wikipedia](http://en.wikipedia.org/wiki/CamelCase)

[6] [Google's R Style Guide](http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
