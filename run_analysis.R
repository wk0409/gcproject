dffeature <- read.table("./UCI HAR Dataset/features.txt")    ##Read feature.txt listing all the variables
dffeaturetrans <- t(dffeature$V2)              ##Transpose the columns into Rows
dfxtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")          ##Read the values of Training Data Set
colnames(dfxtrain) <- dffeaturetrans              ##Give the variable names as the cloumn names of the data set
dfsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")    ##Read the different subjects for which the value was determine  
dfxtrain2 <- cbind(dfsubject,dfxtrain)          ##Creating a new dataframe by biding columns of Subject and Values
dfact1 <- read.table("./UCI HAR Dataset/train/y_train.txt")             
dfact1$V1 <- factor(dfact1$V1, labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
                    ##Giving the Activity labels the name
dfxtrain3 <- cbind(dfact1$V1,dfxtrain2)   
colnames(dfxtrain3)[1] <- "Activity"  ## Give the column name for Activity 
colnames(dfxtrain3)[2]<- "Subject"   ##Give the column nane for Subject


dfxtest <- read.table("./UCI HAR Dataset/test/X_test.txt") ##Reading the test data as the training data
colnames(dfxtest) <- dffeaturetrans
dfsubject2 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dfxtest2 <- cbind(dfsubject2,dfxtest)
dfact2 <- read.table("./UCI HAR Dataset/test/y_test.txt")
dfact2$V1 <- factor(dfact2$V1, labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
dfxtest3 <- cbind(dfact2$V1,dfxtest2)
colnames(dfxtest3)[1] <- "Activity"
colnames(dfxtest3)[2] <- "Subject"


dftt <- rbind(dfxtrain3,dfxtest3)     ##Binding the rows of test and training data set

mea <- grep("mean", names(dftt))
dfttmean <- dftt[,mea]
std <- grep("std", names(dftt))
dfttstd <- dftt[,std]  


data <- cbind(dftt[,1:2],dfttmean,dfttstd)  ##Binding the data set of all the variables containing mean and std anywhere

colnames(data) <- make.names(names(data), unique=TRUE)  ##Removing special characters from the Column names of data set

dfsub1 <- data.frame()  ##Creating an empty data frame

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="WALKING" & data$Subject== i)
  ldf <- lapply(r, mean)  
  tldf <- t(ldf)
  dfac <- cbind("WALKING",i,tldf)
  dfsub1 <- rbind(dfsub1,dfac)       ##Looping through all the Activities and Subjects one by one
  
  i <- i+1
}

dfsub2 <- data.frame()

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="WALKING_UPSTAIRS" & data$Subject== i)
  ldf <- lapply(r, mean)
  tldf <- t(ldf)
  dfac <- cbind("WALKING_UPSTAIRS",i,tldf)
  dfsub2 <- rbind(dfsub2,dfac)
  
  i <- i+1
}

dfsub3 <- data.frame()

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="WALKING_DOWNSTAIRS" & data$Subject== i)
  ldf <- lapply(r, mean)
  tldf <- t(ldf)
  dfac <- cbind("WALKING_DOWNSTAIRS",i,tldf)
  dfsub3 <- rbind(dfsub3,dfac)
  
  i <- i+1
}

dfsub4 <- data.frame()

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="SITTING" & data$Subject== i)
  ldf <- lapply(r, mean)
  tldf <- t(ldf)
  dfac <- cbind("SITTING",i,tldf)
  dfsub4 <- rbind(dfsub4,dfac)
  
  i <- i+1
}

dfsub5 <- data.frame()

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="STANDING" & data$Subject== i)
  ldf <- lapply(r, mean)
  tldf <- t(ldf)
  dfac <- cbind("STANDING",i,tldf)
  dfsub5 <- rbind(dfsub5,dfac)
  
  i <- i+1
}

dfsub6 <- data.frame()

for(i in 1:30){
  
  r <- subset(data[, 3:81], data$Activity =="LAYING" & data$Subject== i)
  ldf <- lapply(r, mean)
  tldf <- t(ldf)
  dfac <- cbind("LAYING",i,tldf)
  dfsub6 <- rbind(dfsub6,dfac)
  
  i <- i+1
}

dfres <- rbind(dfsub1,dfsub2,dfsub3,dfsub4,dfsub5,dfsub6)  ##Making a final tidy data set

colnames(dfres)[1] <- "Activity"

colnames(dfres)[2] <- "Subject"

write.table(as.matrix(dfres), file= "Data.txt", row.name=FALSE) ##Writing the table to data set

