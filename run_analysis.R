run_analysis <- function()
{
  library(dplyr)
  test
  #load labels
  label_activities <- read.table("./activity_labels.txt")
    
  #read test labels
  test_activities<-read.table("./test/y_test.txt");

  #load label data for the test dataset
  myData <- read.table("./test/x_test.txt")

  #add to test data the labels
  myData[,"labels"]<-test_activities$V1
  
  #convert to data frame 
  myData<-as.data.frame.matrix(myData)
  
  #select only the mean and the std deviation
  myData<-select(myData,V1:V6, V41:V46, V81:V86, V121:V126, 
               V161:V166, V201:V202, V214:V215, V227:V228, 
               V240:V241,V253:V254, V266:V271, V345:V350, 
               V424:V429, V503:V504, V529:V530, V542:V543, V556:labels)
  
  #set the rows with the proper name
  colnames(myData)[1]<-"tBodyAcc.mean.X"
  colnames(myData)[2]<-"tBodyAcc.mean.Y"
  colnames(myData)[3]<-"tBodyAcc.mean.Z"
  colnames(myData)[4]<-"tBodyAcc.std.X"  
  colnames(myData)[5]<-"tBodyAcc.std.Y"  
  colnames(myData)[6]<-"tBodyAcc.std.Z"
  colnames(myData)[7]<-"tGravityAcc.mean.X" 
  colnames(myData)[8]<-"tGravityAcc.mean.Y"
  colnames(myData)[9]<-"tGravityAcc.mean.Z"
  colnames(myData)[10]<-"tGravityAcc.std.X"
  colnames(myData)[11]<-"tGravityAcc.std.Y" 
  colnames(myData)[12]<-"tGravityAcc.std.Z"
  colnames(myData)[13]<-"tBodyAccJerk.mean.X"  
  colnames(myData)[14]<-"tBodyAccJerk.mean.Y"  
  colnames(myData)[15]<-"tBodyAccJerk.mean.Z" 
  colnames(myData)[16]<-"tBodyAccJerk.std.X" 
  colnames(myData)[17]<-"tBodyAccJerk.std.Y" 
  colnames(myData)[18]<-"tBodyAccJerk.std.Z"
  colnames(myData)[19]<-"tBodyGyro.mean.X"   
  colnames(myData)[20]<-"tBodyGyro.mean.Y"
  colnames(myData)[21]<-"tBodyGyro.mean.Z"  
  colnames(myData)[22]<-"tBodyGyro.std.X"   
  colnames(myData)[23]<-"tBodyGyro.std.Y"     
  colnames(myData)[24]<-"tBodyGyro.std.Z"
  colnames(myData)[25]<-"tBodyGyroJerk.mean.X" 
  colnames(myData)[26]<-"tBodyGyroJerk.mean.Y"
  colnames(myData)[27]<-"tBodyGyroJerk.mean.Z" 
  colnames(myData)[28]<-"tBodyGyroJerk.std.X"  
  colnames(myData)[29]<-"tBodyGyroJerk.std.Y"   
  colnames(myData)[30]<-"tBodyGyroJerk.std.Z"
  colnames(myData)[31]<-"tBodyAccMag.mean"
  colnames(myData)[32]<-"tBodyAccMag.std"
  colnames(myData)[33]<-"tGravityAccMag.mean"
  colnames(myData)[34]<-"tGravityAccMag.std"
  colnames(myData)[35]<-"tBodyAccJerkMag.mean"
  colnames(myData)[36]<-"tBodyAccJerkMag.std" 
  colnames(myData)[37]<-"tBodyGyroMag.mean"
  colnames(myData)[38]<-"tBodyGyroMag.std"
  colnames(myData)[39]<-"tBodyGyroJerkMag.mean"
  colnames(myData)[40]<-"tBodyGyroJerkMag.std"
  colnames(myData)[41]<-"fBodyAcc.mean.X"
  colnames(myData)[42]<-"fBodyAcc.mean.Y"
  colnames(myData)[43]<-"fBodyAcc.mean.Z" 
  colnames(myData)[44]<-"fBodyAcc.std.X"
  colnames(myData)[45]<-"fBodyAcc.std.Y"
  colnames(myData)[46]<-"fBodyAcc.std.Z"  
  colnames(myData)[47]<-"fBodyAccJerk.mean.X"   
  colnames(myData)[48]<-"fBodyAccJerk.mean.Y" 
  colnames(myData)[49]<-"fBodyAccJerk.mean.Z"
  colnames(myData)[50]<-"fBodyAccJerk.std.X"   
  colnames(myData)[51]<-"fBodyAccJerk.std.Y" 
  colnames(myData)[52]<-"fBodyAccJerk.std.Z"  
  colnames(myData)[53]<-"fBodyGyro.mean.X"    
  colnames(myData)[54]<-"fBodyGyro.mean.Y"
  colnames(myData)[55]<-"fBodyGyro.mean.Z"    
  colnames(myData)[56]<-"fBodyGyro.std.X"    
  colnames(myData)[57]<-"fBodyGyro.std.Y"
  colnames(myData)[58]<-"fBodyGyro.std.Z"   
  colnames(myData)[59]<-"fBodyAccMag.mean"
  colnames(myData)[60]<-"fBodyAccMag.std"
  colnames(myData)[61]<-"fBodyBodyGyroMag.mean"
  colnames(myData)[62]<-"fBodyBodyGyroMag.std"
  colnames(myData)[63]<-"fBodyBodyGyroJerkMag.mean"
  colnames(myData)[64]<-"ffBodyBodyGyroJerkMag.std"
  colnames(myData)[65]<-"angle_tBodyAccJerkMean_gravityMean"
  colnames(myData)[66]<-"angle_tBodyGyroMean_gravityMean"
  colnames(myData)[67]<-"angle_tBodyGyroJerkMean_gravityMean"
  colnames(myData)[68]<-"gravityMean_X"  
  colnames(myData)[69]<-"gravityMean_Y"
  colnames(myData)[70]<-"gravityMean_Z"
  colnames(myData)[71]<-"activity_no"  
}