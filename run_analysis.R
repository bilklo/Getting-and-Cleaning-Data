run_analysis <- function()
{
  library(dplyr)
  
  #load labels
  label_activities <- read.table("./activity_labels.txt")
  colnames(label_activities)[1]<-"label_no"
  colnames(label_activities)[2]<-"Activity"
  
  #read test labels
  test_activities<-read.table("./test/y_test.txt");

  #load label data for the test dataset
  myData <- read.table("./test/x_test.txt")

  #add to test data the labels
  myData[,"label_id"]<-test_activities$V1
  
  #add test subject
  test_subject<-read.table("./test/subject_test.txt")
  myData[,"subject"]<-test_subject$V1
  
  #convert to data frame 
  myData<-as.data.frame.matrix(myData)
  
  #select only the mean and the std deviation
  myData<-select(myData,V1:V6, V41:V46, V81:V86, V121:V126, 
               V161:V166, V201:V202, V214:V215, V227:V228, 
               V240:V241,V253:V254, V266:V271, V345:V350, 
               V424:V429, V503:V504, V529:V530, V542:V543, V556:subject)
  
  #merge test data with the label
  myData<-merge(label_activities,myData, by.x = "label_no",by.y = "label_id")
  
  #read training labels
  train_activities<-read.table("./train/y_train.txt");
  
  #load label data for the test dataset
  myData_train <- read.table("./train/X_train.txt")  
  
  #add to test data the labels
  myData_train[,"label_id"]<-train_activities$V1
  
  #add train subject
  train_subject<-read.table("./train/subject_train.txt")
  myData_train[,"subject"]<-train_subject$V1
  
  #convert to data frame 
  myData_train<-as.data.frame.matrix(myData_train) 
  
  #select only the mean and the std deviation
  myData_train<-select(myData_train,V1:V6, V41:V46, V81:V86, V121:V126, 
                 V161:V166, V201:V202, V214:V215, V227:V228, 
                 V240:V241,V253:V254, V266:V271, V345:V350, 
                 V424:V429, V503:V504, V529:V530, V542:V543, V556:subject)  
  
  #merge test data with the label
  myData_train<-merge(label_activities,myData_train, by.x = "label_no",by.y = "label_id")  
  
  #merge two data frame to myData
  myData<-rbind(myData,myData_train)
  

  
  #set the rows with the proper name
  colnames(myData)[1]<-"activity_no"
  colnames(myData)[2]<-"activity"  
  colnames(myData)[3]<-"tBodyAcc.mean.X"
  colnames(myData)[4]<-"tBodyAcc.mean.Y"
  colnames(myData)[5]<-"tBodyAcc.mean.Z"
  colnames(myData)[6]<-"tBodyAcc.std.X"  
  colnames(myData)[7]<-"tBodyAcc.std.Y"  
  colnames(myData)[8]<-"tBodyAcc.std.Z"
  colnames(myData)[9]<-"tGravityAcc.mean.X" 
  colnames(myData)[10]<-"tGravityAcc.mean.Y"
  colnames(myData)[11]<-"tGravityAcc.mean.Z"
  colnames(myData)[12]<-"tGravityAcc.std.X"
  colnames(myData)[13]<-"tGravityAcc.std.Y" 
  colnames(myData)[14]<-"tGravityAcc.std.Z"
  colnames(myData)[15]<-"tBodyAccJerk.mean.X"  
  colnames(myData)[16]<-"tBodyAccJerk.mean.Y"  
  colnames(myData)[17]<-"tBodyAccJerk.mean.Z" 
  colnames(myData)[18]<-"tBodyAccJerk.std.X" 
  colnames(myData)[19]<-"tBodyAccJerk.std.Y" 
  colnames(myData)[20]<-"tBodyAccJerk.std.Z"
  colnames(myData)[21]<-"tBodyGyro.mean.X"   
  colnames(myData)[22]<-"tBodyGyro.mean.Y"
  colnames(myData)[23]<-"tBodyGyro.mean.Z"  
  colnames(myData)[24]<-"tBodyGyro.std.X"   
  colnames(myData)[25]<-"tBodyGyro.std.Y"     
  colnames(myData)[26]<-"tBodyGyro.std.Z"
  colnames(myData)[27]<-"tBodyGyroJerk.mean.X" 
  colnames(myData)[28]<-"tBodyGyroJerk.mean.Y"
  colnames(myData)[29]<-"tBodyGyroJerk.mean.Z" 
  colnames(myData)[30]<-"tBodyGyroJerk.std.X"  
  colnames(myData)[31]<-"tBodyGyroJerk.std.Y"   
  colnames(myData)[32]<-"tBodyGyroJerk.std.Z"
  colnames(myData)[33]<-"tBodyAccMag.mean"
  colnames(myData)[34]<-"tBodyAccMag.std"
  colnames(myData)[35]<-"tGravityAccMag.mean"
  colnames(myData)[36]<-"tGravityAccMag.std"
  colnames(myData)[37]<-"tBodyAccJerkMag.mean"
  colnames(myData)[38]<-"tBodyAccJerkMag.std" 
  colnames(myData)[39]<-"tBodyGyroMag.mean"
  colnames(myData)[40]<-"tBodyGyroMag.std"
  colnames(myData)[41]<-"tBodyGyroJerkMag.mean"
  colnames(myData)[42]<-"tBodyGyroJerkMag.std"
  colnames(myData)[43]<-"fBodyAcc.mean.X"
  colnames(myData)[44]<-"fBodyAcc.mean.Y"
  colnames(myData)[45]<-"fBodyAcc.mean.Z" 
  colnames(myData)[46]<-"fBodyAcc.std.X"
  colnames(myData)[47]<-"fBodyAcc.std.Y"
  colnames(myData)[48]<-"fBodyAcc.std.Z"  
  colnames(myData)[49]<-"fBodyAccJerk.mean.X"   
  colnames(myData)[50]<-"fBodyAccJerk.mean.Y" 
  colnames(myData)[51]<-"fBodyAccJerk.mean.Z"
  colnames(myData)[52]<-"fBodyAccJerk.std.X"   
  colnames(myData)[53]<-"fBodyAccJerk.std.Y" 
  colnames(myData)[54]<-"fBodyAccJerk.std.Z"  
  colnames(myData)[55]<-"fBodyGyro.mean.X"    
  colnames(myData)[56]<-"fBodyGyro.mean.Y"
  colnames(myData)[57]<-"fBodyGyro.mean.Z"    
  colnames(myData)[58]<-"fBodyGyro.std.X"    
  colnames(myData)[59]<-"fBodyGyro.std.Y"
  colnames(myData)[60]<-"fBodyGyro.std.Z"   
  colnames(myData)[61]<-"fBodyAccMag.mean"
  colnames(myData)[62]<-"fBodyAccMag.std"
  colnames(myData)[63]<-"fBodyBodyGyroMag.mean"
  colnames(myData)[64]<-"fBodyBodyGyroMag.std"
  colnames(myData)[65]<-"fBodyBodyGyroJerkMag.mean"
  colnames(myData)[66]<-"ffBodyBodyGyroJerkMag.std"
  colnames(myData)[67]<-"angle_tBodyAccJerkMean_gravityMean"
  colnames(myData)[68]<-"angle_tBodyGyroMean_gravityMean"
  colnames(myData)[69]<-"angle_tBodyGyroJerkMean_gravityMean"
  colnames(myData)[70]<-"gravityMean_X"  
  colnames(myData)[71]<-"gravityMean_Y"
  colnames(myData)[72]<-"gravityMean_Z"
  colnames(myData)[72]<-"subject"
  
  #export
  export<-myData;
  export[[1]]<-NULL
  write.table(export,"./export.txt", row.names=FALSE)
}