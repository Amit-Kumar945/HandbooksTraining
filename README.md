# HandbooksTraining

## Presentations
* https://s3-us-west-2.amazonaws.com/target-training/day1.zip
* https://s3-us-west-2.amazonaws.com/target-training/day2.zip

## Handbook Guides
* https://s3-us-west-2.amazonaws.com/target-training/Handbooks.zip

## Steps
* Download keys
  * Linux : https://s3-us-west-2.amazonaws.com/target-training/targetkey.pem
  * Windows : https://s3-us-west-2.amazonaws.com/target-training/targetkey.ppk
* Login to your VM's using ubuntu user
  * Linux:
    * Change permissio of targetkey
    ```chmod 600 targetkey.pem```
    * ssh -i targetkey.pem ubuntu@54.69.71.93
  * Windows: Use Putty to login to the system
* Do initial setup of system
  * Go to HandbooksTraining directory
  ```$ cd HandbooksTraining```
  * Update the code to latest state
  ```git pull origin master```
