##Tidy Data Set Project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The data was gathered from Smasung Labs website.	

From the gathered data we filtered the signal variables having mean or std anywhere in the variable name.run_analysis filters the experimental raw data to the mean of  signals for each Volunteer(Subject) and performing every activity. This script reads the "features.txt", "X_train.txt", "X_test.data" , "y_train.data" and "y_test.data" into a data frame. All the columns are tranformed into human readable.



###The run_analysis script can be used to tidy the experimental data set using the following steps:-

- Download the file using the url "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "

- unzip the file in the Working Directory.

- Run the run_analysis.R Script.

Once the run_analysis.R script is run, the tidy data is available in the file naming "Data.txt". 

Read data.txt into R using read.table("data.txt", header=TRUE). Columns 3:81 represents the mean value of all the variables as decribed in the code book for all the pairs of Activity and subjects.

The data set is in a wide format. To read the first five columns in data set execute:-

- dfre <- read.table("data.txt", header=TRUE)
- dfre[,1:5]



Please see the code book for further information on variables and its meaning.






