loadTT <- function (url){
  ## Check/ create sub directory for storing the downloaded data in
  dirName <- "TidyData"
  if (!file.exists(dirName)) {
    dir.create(dirName)
  }
  setwd(paste(".",dirName, sep="/"))  
  
  if (!file.exists("UCI HAR Dataset")){
  ## download and extract the zip file
  download.file(url, destfile = "UCIDataset.zip", mode="wb")
  unzip("UCIDataset.zip", exdir = ".")
  unlink("UCIDataset.zip")
  }
  
}

mergeTT <- function (){
  require(data.table)
  dtPath <- "./UCI HAR Dataset"
  trainPath <- paste(dtPath,"train", sep="/")
  testPath  <- paste(dtPath,"test",  sep="/")
  
  ## read the vector of features for test data
  dtTest  <-  read.csv(paste(testPath,"X_test.txt",sep="/"), sep =",", header = FALSE)
  ## read the users for the vector of features
  users <- read.csv(paste(testPath,"y_test.txt",sep="/"), header = FALSE)
  ## ...and add the users as first column
  dtTest <- cbind(user, dtTest)

  ## ..then do the same for the train data
  dtTrain  <-  read.csv(paste(trainPath,"X_train.txt",sep="/"), sep =",", header = FALSE)
  ## read the users for the vector of features
  users <- read.csv(paste(trainPath,"y_train.txt",sep="/"), header = FALSE)
  ## ...and add the users as first column
  dtTrain <- cbind(user, dtTrain)
  
  mTidyData <- rbind(dtTrain, dtTest)
}

MeanStdColumns <- function {
  ##read in the content of "Features.txt"
  features <- read.csv("../features.txt", sep = " ", header = FALSE)
  ## subset mTidyData keeping only the columns holding mean or std values
  mTidyData <- subset(mTidyData, select = grep("std|mean", features[,2]))
}


AddColumnHeaders <- function {
  
}

run_analysis <- function(){
  loadTT("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
  mTidyData <- NULL
  mergeTT()
  MeanStdColums()
  AddColumnHeaders()
  ##CreateAvgDataSet()
}