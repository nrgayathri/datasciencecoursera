setwd("C:/Data Scientist/DataCleaning/UCI HAR Dataset")
#Step 1 
traindata <- read.table("train/X_train.txt")
testdata <- read.table("test/X_test.txt")

#Merging Test and Train Data
MergeData <- rbind(traindata,testdata)

trainlabel <- read.table("train/Y_train.txt")
testlabel <- read.table("test/Y_test.txt")

#Merging test and train labels
Mergelabels <- rbind(trainlabel,testlabel)

trainsub <- read.table("train/subject_train.txt")
testsub <- read.table("test/subject_test.txt")

#Merging test and train subject
Mergesub <- rbind(trainsub,testsub)

features <- read.table("features.txt")
meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
resultmeanStd <- MergeData[, meanStd]

activityLabel <- read.table("activity_labels.txt")
activityLabel <- activity[Mergelabels[, 1], 2]
Mergelabels[, 1] <- activityLabel
names(Mergelabels) <- "activity"


names(Mergesub) <- "subject"
NamedData <- cbind(Mergesub, Mergelabels, MergeData)

write.table(NamedData, "TidyData.txt",row.names=FALSE)
