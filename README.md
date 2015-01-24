####  Course Project for Coursera 'getdata-010'  
README.md


Content
----------
This document provides background and 'how to use' information for my course project submission for Getting and Cleaning Data (Coursera 'getdata-010') conducted by Johns Hopkins University.

Topics covered  
----------
- Project overview  
- Submission files and contents  
- Starting Point
- Input data  
- How data was processed  
- Variable naming

Project overview
----------
The course project consists of applying the principles of 'tidy data' [1] in the preparation and delivery of a specific subset of a large package of sensor measurements data. This is accomplished via creation of an R script to process the raw data, and of documentation package covering the process followed, output format, and other relevant information, both to be posted on GitHub.


Submission files and contents  
----------
The following files are available from the [public GitHub repository]:(https://github.com/rricce01/GACDCourseProject)

- run_analysis.R  
- CodeBook.md
- README.md  

"run_analysis.R" contains an R script that processes the measurement and associated data in folder "UCI HAR Data", outputting a tidy processed subset of the measurement data as file "var_avgs.txt"

"CodeBook.md" contains data dictionary-like information (feature name, data type, range, description) on the features (columns of data) in "var_avgs.txt".

"README.txt" (the file you are reading now) contains background and 'how to use' information for the project submittal.


Starting Point
----------
Project input is a set of smartphone sensor measurements collected from experimental subjects' movements in three dimensions while performing ordinary daily activities such as walking and stair climbing, plus descriptive documentation of the collection methods, pre-processing, formats and meanings of the measured data.

The data package was prepared during research into wearable device applications by a group in Italy, and resides at the UC Irvine Machine Learning Repository. [2] The data package, which is downloadable at [3], contains both the measurements data files, and supporting documentation containing detailed descriptions of the package and contents. 


Input Package
----------
The data package downloads as a zipped folder "UCI HAR Data". This folder contains subsets of the full measurements database for model training and testing (in folders "test" and "train") and text files describing the features and naming convention, and a list of activity code names. There is also a Read Me file.

The test and train folders each contain the measurement observations dataset, a list of the experimental subject IDs for each observation, and a list of the activity code for each observation. 

All datasets noted above are used as inputs by the "run_analysis.R" script except for the "Inertial Signals" folders, which are unused.


Running the R script  
----------
The unzipped folder "UCI HAR Data" should be saved in your system's working directory.

If the script file "run_analysis.R" is also saved in your system's working directory, it can be run it by entering 'source("./run_analysis.R")' -- without the single quotes -- at the R console prompt.

If "run_analysis.R" is saved anywhere else, use its fully-qualified file string in the source() commands above, or load the script into RStudio and run it using RStudio functions. 

The script's output file "var_avgs.txt" will be created in the working directory.

Output file
----------



How data was processed  
----------



Variable naming
----------





















[1]  Wickham, H; "Tidy Data"; Journal of Statistical Software Aug 2014; (http://www.jstatsoft.org/v59/i10/paper)

[2] Machine Learning Repository; UC Irvine; (http://archive.ics.uci.edu/ml/index.html)

[3] Human Activity Recognition Using Smartphones Data Set; UC Irvine; (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

[4] "Google's R Style Guide", (http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)

[5] Wickham, H; "R Style Guide", (http://r-pkgs.had.co.nz/style.html)

[6] CamelCase, Wikipedia, (http://en.wikipedia.org/wiki/CamelCase)