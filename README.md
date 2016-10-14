# HandbooksTraining

## Presentations
* https://s3-us-west-2.amazonaws.com/target-training/Day1PPT.zip
* https://s3-us-west-2.amazonaws.com/target-training/Day2PPT.zip

## Handbook Guides
* https://s3-us-west-2.amazonaws.com/target-training/Handbooks.zip

## Steps
* Download keys
  * Linux : https://s3-us-west-2.amazonaws.com/target-training/targetkey.pem
  * Windows : https://s3-us-west-2.amazonaws.com/target-training/targetkey.ppk
* Login to your VM's using ubuntu user
  * Linux: ssh -i targetkey.pem ubuntu@<public-ip>
  * Windows: Use Putty to login to the system
* Do initial setup of system
  * Go to HandbooksTraining directory
  ```$ cd HandbooksTraining```
  * Update the code to latest state
  ```git pull origin master```
