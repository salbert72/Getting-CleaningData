# Getting-CleaningData
Course project for Getting and Cleaning data (tidy dataset)

Run_Analysis.R source structure explanation:
-------------------------------------------

While working on the main function, I've split the main operations into individual functions and was doing my best to give descriptive names to them.
I've also included in-line comments to better explain the sections of the code.
Here is a summary of how it works:

Function name: loadTT
- it locates and downloads the "UCIDataset.zip" file from the url provided in the body of the main function and unzips it

Function name: mergeTT
- loads the test and training data into two separate data frames.
- binds the corresponding subjects' IDs provided within the "y_...txt" file with the corresponding data frame
- binds the rows from the train data frame with the rows of the test data frame and stores them into the mTidyData data frame

Function name: MeanStdColumns
- loads the list of features into a data frame
- subsets mTidyData by the columns whose names' contain either "mean" or "std" in their description
- adds the description of the subset features as column headers

Function name: CreateAvgbySubject
- using <aggregate> by SubjectID to apply mean to each measurement columns

Function name: WriteTabletoFile
- needless to explain.