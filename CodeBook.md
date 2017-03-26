# The Dataset Code Book
The purpose of this file is to describe the variables present in the files "myData.txt" and "myDataMean.txt", output of the R script created for the assignment of coursera Data science specialization, course 3, getting and cleaning data.

Below the table with the description of the variables. But before explain the variable is important to describe the following words:

<table>
  <tr>
  <td>Body</td>
  <td>Signal based on the body of the subject</td>
  </tr>
  
  <tr>
  <td>Gravity</td>
  <td>Signal based on gravity</td>
  </tr>
  
  <tr>
  <td>Gyro</td>
  <td>A measurement from the phone's gyroscope</td>
  </tr>
  
  <tr>
  <td>Jerk</td>
  <td>A measurement of sudden movement, based on body acceleration and angular velocity</td>
  </tr>
  
  <tr>
  <td>Mag</td>
  <td>A measurement of the magnitude of the Euclidean norm</td>
  </tr>
 </table>


In the script, for every variable in the followin table we have 3 different variable for every dimension (X, Y and Z) of the phone, either for the mean and for the standard deviation:

<table>
  <tr>
  <th>Column Name</th>
  <th>Description</th>
  </tr>
  
  <tr>
  <td>ActivityName</td>
  <td>Is the name of the activity performed by the volunteers, it assumes 6 values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING</td>
  </tr>
  
  <tr>
  <td>TimeBodyAcc</td>
  <td>Numeric, measuring the mean of time domain body acceleration</td>
  </tr>
  
  <tr>
  <td>TimeGravityAcc</td>
  <td>Numeric, measuring the mean of time domain gravity acceleration</td>
  </tr>
  
  <tr>
  <td>TimeBodyAccJerk</td>
  <td>Numeric, measuring the mean of time domain body acceleration jerk</td>
  </tr>
  
  
  <tr>
  <td>TimeBodyGyro</td>
  <td>Numeric, measuring the mean of time domain body gyroscope</td>
  </tr>
  
  <tr>
  <td>TimeBodyGyroJerk</td>
  <td>Numeric, measuring the mean of time domain body gyroscope jerk</td>
  </tr>
  
  <tr>
  <td>FreqBodyAcc</td>
  <td>Numeric, measuring the mean of frequency domain body acceleration</td>
  </tr>
  
  <tr>
  <td>FreqBodyAccJerk</td>
  <td>Numeric, measuring the mean of frequency domain body acceleration jerk</td>
  </tr>
  
  <tr>
  <td>FreqBodyGyro</td>
  <td>Numeric, measuring the mean of frequency domain body gyroscope</td>
  </tr>
</table>
  
  
For the following table, instead, in the script there are only two variable for each row, the mean and the standard deviation:
<table>
  <tr>
  <th>Column Name</th>
  <th>Description</th>
  </tr>
  
  <tr>
  <td>TimeBodyAccMag</td>
  <td>Numeric, measuring the mean of time domain body acceleration magnitude</td>
  </tr>
  
  <tr>
  <td>TimeGravityAccMag</td>
  <td>Numeric, measuring the mean of time domain gravity acceleration magnitude</td>
  </tr>
  
  <tr>
  <td>TimeBodyAccJerkMag</td>
  <td>Numeric, measuring the mean of time domain body acceleration jerk magnitude</td>
  </tr>
  
  <tr>
  <td>TimeBodyGyroMag</td>
  <td>Numeric, measuring the mean of time domain body gyroscope magnitude</td>
  </tr>
  
  <tr>
  <td>TimeBodyGyroJerkMag</td>
  <td>Numeric, measuring the mean of time domain body gyroscope jerk magnitude</td>
  </tr>
  
  <tr>
  <td>FreqBodyAccMag</td>
  <td>Numeric, measuring the mean of frequency domain body acceleration magnitude</td>
  </tr>
  
  <tr>
  <td>FreqBodyAccJerkMag</td>
  <td>Numeric, measuring the mean of frequency domain body acceleration jerk magnitude</td>
  </tr>
  
  <tr>
  <td>FreqBodyGyroMag</td>
  <td>Numeric, measuring the mean of frequency domain body gyroscope magnitude</td>
  </tr>
  
  <tr>
  <td>FreqBodyGyroJerkMag</td>
  <td>Numeric, measuring the mean of frequency domain body gyroscope jerk magnitude</td>
  </tr>
</table>
